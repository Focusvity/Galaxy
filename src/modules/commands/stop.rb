# frozen_string_literal: true

module Bot::DiscordCommands
  module Stop
    extend Discordrb::Commands::CommandContainer
    command(:stop, help_available: false) do |event|
      break unless event.user.id == event.bot.bot_app.owner.id

      event.channel.send_embed do |embed|
        embed.description = 'Goodbye cruel world'
        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "Requested by #{event.user.name}##{event.user.discrim}", icon_url: "")
        embed.color = 16722454
      end

      event.bot.stop
    end
  end
end