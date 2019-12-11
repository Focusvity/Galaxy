# frozen_string_literal: true

module Bot::DiscordCommands
  module BotInfo
    extend Discordrb::Commands::CommandContainer
    command(%i[botinfo bi]) do |event|
      event.channel.send_embed do |embed|
        embed.title = "#{event.bot.bot_user.name} #{ENV['VERSION']}"
        embed.color = 4165563
        desc = "**Server count:** #{event.bot.servers.count}
**Total unique users:** #{event.bot.users.count}
**Source code:** https://github.com/Focusvity/Galaxy"
        embed.description = desc
        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'Created by Fleek#0036', icon_url: '')
        embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: event.bot.bot_user.avatar_url.to_s)
      end
    end
  end
end