# frozen_string_literal: true

module Bot::DiscordCommands
  # Reloads commands and events
  # Only the bot owner have the access to this command
  module Reload
    extend Discordrb::Commands::CommandContainer
    command(:reload, help_available: false) do |event|
      break unless event.user.id == 337567041970110464

      Bot.load_modules(:DiscordCommands, 'commands')
      Bot.load_modules(:DiscordEvents, 'events', true)

      event.respond 'Reloaded commands and events'
    end
  end
end