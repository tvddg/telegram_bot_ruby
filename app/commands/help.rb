class HelpCommand
  def initialize(message_sender)
    @message_sender = message_sender
  end

  def call(bot, message)
    @message_sender.text(
      bot,
      message.chat.id,
      "🤖 Help

This bot helps you find information about TV shows.

How to use:

* Use the buttons below to navigate through options
* Or type commands manually

Commands:
/start — restart the bot
/help — show this message
"
    )
  end
end