# frozen_string_literal: true

module Bot::DiscordCommands
  module Disconnect
    extend Discordrb::Commands::CommandContainer
    command(%i[disconnect leave]) do |event|
      if event.bot.voices[event.server.id].nil?
        event.respond "I'm not in a voice channel!"
        break
      end

      event.bot.voices[event.server.id].destroy
      event.respond 'Disconnected in all voice channels'
    end
  end
end
