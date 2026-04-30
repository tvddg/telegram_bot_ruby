class MessageSender
  def initialize(token:)
    @token = token
  end

  def text_with_kb(bot, chat_id, text, kb)
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: kb,
        resize_keyboard: true
    )
    bot.api.send_message(chat_id: chat_id, text: text, reply_markup: markup, parse_mode: "Markdown")
  end

  def text(bot, chat_id, text)
    bot.api.send_message(chat_id: chat_id, text: text, parse_mode: "Markdown")
  end

  def photo(bot, chat_id, photo, caption)
    bot.api.send_photo(
      chat_id: chat_id,
      photo: photo,
      caption: caption
    )
  end
end