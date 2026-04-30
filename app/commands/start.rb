class StartCommand
  def initialize(message_sender)
    @message_sender = message_sender
  end

  def call(bot, message)
    keyboard = [
        [
        Telegram::Bot::Types::KeyboardButton.new(text: "🔎 Find a show"),
        Telegram::Bot::Types::KeyboardButton.new(text: "❓ Help")
        ]
    ]

    @message_sender.text_with_kb(
      bot,
      message.chat.id,
      "Hello! 👋

Use */search \"TV show name\"* to search for a show directly, or simply use the buttons below.

You can:
   🔎 Search for TV shows
   ❓ Get help and usage info
",
      keyboard
    )
  end
end