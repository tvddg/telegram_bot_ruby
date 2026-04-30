require "telegram/bot"
require_relative "../commands/start"
require_relative "../commands/help"
require_relative "../commands/search_show"

class Router
    def initialize(tvmaze_client, message_sender, user_state)
        @tvmaze_client = tvmaze_client
        @message_sender = message_sender
        @user_state = user_state
    end
    
    def start
        Telegram::Bot::Client.run(ENV["BOT_TOKEN"]) do |bot|
            bot.listen do |message|
            route(bot, message)
        end
    end 
end

def route(bot, message)
    text = message.text.to_s

    if @user_state.get(message.chat.id) == :waiting_for_show 
        SearchShowCommand.new(@tvmaze_client, @message_sender).call(bot, message, text)
        @user_state.clear(message.chat.id)
        return
    end

    case text
    when "/start"
        StartCommand.new(@message_sender).call(bot, message)

    when "/help", "❓ Help"
        HelpCommand.new(@message_sender).call(bot, message)

    when "🔎 Find a show"
        @message_sender.text(bot, message.chat.id, "Send the name of the show")
        @user_state.set(message.chat.id, :waiting_for_show)

    when /\/search (.+)/
        query = $1
        SearchShowCommand.new(@tvmaze_client, @message_sender).call(bot, message, query)

    else
        @message_sender.text(bot, message.chat.id, "Unknown command. Please type /help to see a list of availible commands.")
    end 
end
end