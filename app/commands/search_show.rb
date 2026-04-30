require_relative "../presenters/show_presenter"

class SearchShowCommand
  def initialize(tvmaze_client, message_sender)
    @client = tvmaze_client
    @message_sender = message_sender
  end

  def call(bot, message, query)
    show = @client.search(query).first

    unless show
      return @message_sender.text(bot, message.chat.id, "❌ Nothing found")
    end

    card = ShowCardBuilder.build(show)

    if card[:send_type] == :photo
      @message_sender.photo(
        bot,
        message.chat.id,
        card[:image],
        card[:text]
      )
    else
      @message_sender.text(
        bot,
        message.chat.id,
        card[:text]
      )
    end
  end
end