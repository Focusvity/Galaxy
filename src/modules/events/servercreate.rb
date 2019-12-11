# frozen_string_literal: true

module Bot::DiscordEvents
  module ServerCreate
    extend Discordrb::EventContainer
    server_create do |event|
      event.server.default_channel.send_embed do |embed|
        embed.title = event.bot.bot_user.name
        embed.description = "Thank you for inviting **#{event.bot.bot_user.name}**. Get started say #{ENV['COMMAND_PREFIX']}help"
        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: event.bot.bot_user.name,
                                                            url: event.bot.invite_url,
                                                            icon_url: event.bot.bot_user.avatar_url.to_s)
        embed.color = 4165563
      end
    end
  end
end