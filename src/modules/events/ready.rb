# frozen_string_literal: true

# Ready event
module Bot::DiscordEvents
  module Ready
    extend Discordrb::EventContainer
    ready do |event|
      puts "Running #{event.bot.bot_user.name} #{ENV['VERSION']}"
    end
  end
end