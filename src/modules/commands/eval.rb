# frozen_string_literal: true

module Bot::DiscordCommands
  # Evaluate ruby codes.
  # Only the bot owner have the access to this command
  module Eval
    extend Discordrb::Commands::CommandContainer
    command(:eval, help_available: false) do |event, *code|
      break unless event.user.id == 337567041970110464

      begin
        eval code.join(' ')
      rescue => e
        "An error has occurred ```#{e}```"
      end
    end
  end
end