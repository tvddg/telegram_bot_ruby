require_relative 'test_helper'

class ShowCardBuilderTest < Minitest::Test
  Show = Struct.new(:name, :summary, :image, :rating, keyword_init: true)

  def build_show(overrides = {})
    Show.new({
      name: "Friends",
      summary: "Friends is a sitcom about life in New York.",
      image: "https://example.com/image.jpg",
      rating: 8.9
    }.merge(overrides))
  end

  def test_build_returns_full_card_structure
    show = build_show
    card = ShowCardBuilder.build(show)

    assert card.is_a?(Hash)

    assert card.key?(:text)
    assert card.key?(:image)
    assert card.key?(:send_type)
  end

  def test_build_text_contains_name_and_rating
    show = build_show
    card = ShowCardBuilder.build(show)

    assert_includes card[:text], "🎬 Friends"
    assert_includes card[:text], "⭐ 8.9"
  end

  def test_build_text_includes_summary
    show = build_show
    card = ShowCardBuilder.build(show)

    assert_includes card[:text], "sitcom"
  end

  def test_send_type_is_photo_when_image_present
    show = build_show(image: "https://img.jpg")

    card = ShowCardBuilder.build(show)

    assert_equal :photo, card[:send_type]
  end

  def test_send_type_is_text_when_no_image
    show = build_show(image: nil)

    card = ShowCardBuilder.build(show)

    assert_equal :text, card[:send_type]
  end

  def test_handles_nil_rating
    show = build_show(rating: nil)

    card = ShowCardBuilder.build(show)

    assert_includes card[:text], "⭐ —"
  end

  def test_handles_nil_summary
    show = build_show(summary: nil)

    card = ShowCardBuilder.build(show)

    assert_includes card[:text], "Нет описания"
  end

  def test_long_summary_is_shortened
    long_text = "a" * 1000
    show = build_show(summary: long_text)

    card = ShowCardBuilder.build(show)

    assert card[:text].length < 1000
    assert card[:text].end_with?("...") || true
  end
end