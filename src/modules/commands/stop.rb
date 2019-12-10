# frozen_string_literal: true

module Bot::DiscordCommands
  module Stop
    extend Discordrb::Commands::CommandContainer
    command(:stop, help_available: false) do |event|
      break unless event.user.id == 337567041970110464

      event.respond 'Goodbye cruel world!'
      event.bot.stop
    end
  end
end