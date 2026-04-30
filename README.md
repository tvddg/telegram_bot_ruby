# Telegram TV Shows Bot

A simple Telegram bot that helps you find information about TV shows.

## Features

* Search for TV shows by name
* View show rating and short description
* Receive show images (if available)

## How to Use

Start the bot in Telegram and use the following commands:

```
/start
```

Starts the bot and shows a short welcome message.

```
/search <show name>
```

Searches for a TV show.

Example:

```
/search breaking bad
```

The bot will return:

* Show title
* Rating
* Short description
* Image (if available)

```
/help
```

Displays available commands.

## Setup

### 1. Clone the repository

```
git clone <your-repo-url>
cd tg_bot
```

### 2. Install dependencies

```
bundle install
```

### 3. Create `.env` file

```
BOT_TOKEN=your_telegram_bot_token
```

### 4. Run the bot

```
ruby bot.rb
```

## Notes

* If no results are found, the bot will notify you
* Some shows may not have images or descriptions
* The bot works in real time using an external API

## License

MIT

