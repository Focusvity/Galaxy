# frozen_string_literal: true

module Bot::DiscordCommands
  # Time it takes to edit the message
  module Ping
    extend Discordrb::Commands::CommandContainer
    command(:ping) do |event|
      m = event.respond 'Pinging...'
      m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
    end
  end
end
