# frozen_string_literal: true

# Ready event
module Bot::DiscordEvents
  # When the bot successfully connect to Discord
  module Ready
    extend Discordrb::EventContainer
    ready do |event|
      puts "Running #{event.bot.bot_user.name} #{ENV['VERSION']}"
      puts 'Created by Fleek#0036 (https://github.com/Focusvity/Galaxy)'
      puts "Bot invite link: #{event.bot.invite_url}"
    end
  end
end