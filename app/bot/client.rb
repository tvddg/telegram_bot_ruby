require "tvshow_wrapper"
require "dotenv/load"
require_relative "../services/message_sender"
require_relative "router"
require_relative "../services/user_state"

tvmaze_client = TvshowWrapper.client
message_sender = MessageSender.new(token: ENV["BOT_TOKEN"])
user_state = UserState.new

router = Router.new(tvmaze_client, message_sender, user_state)

router.start