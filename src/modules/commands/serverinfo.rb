# frozen_string_literal = true

module Bot::DiscordCommands
  module ServerInfo
    extend Discordrb::Commands::CommandContainer
    command(%i[serverinfo si]) do |event|
      if event.channel.private?
        event.respond 'Try running this in a server.'
        break
      end

      server = event.server
      afk_channel = server.afk_channel
      afk_channel = if afk_channel.nil?
                      'None'
                    else
                      server.afk_channel.name
                    end

      desc = "**Name and ID:** #{server.name}, #{server.id}
**Region:** #{server.region}
**Owned by:** #{server.owner.mention}
**Members:** #{server.member_count}
**Channels:** #{server.channels.count}
**Roles:** #{server.roles.count}
**AFK channel and timeout:** #{afk_channel}, #{server.afk_timeout}
**Verification level:** #{server.verification_level}
**Has emoji?** #{server.emoji?}
**Creation time:** #{server.creation_time}"

      event.channel.send_embed do |embed|
        embed.title = 'Server Information'
        embed.description = desc
        embed.color = 4165563
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: server.icon_url.to_s)
      end
    end
  end
end