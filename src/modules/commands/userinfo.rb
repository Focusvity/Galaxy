# frozen_string_literal: true

module Bot::DiscordCommands
  module UserInfo
    extend Discordrb::Commands::CommandContainer
    command(%i[userinfo ui], max_args: 0) do |event|
      user = event.user
      # user = if args.length == 1
      #         event.message.mentions[0] # Get the first mentioned user
      #       else
      #         event.user
      #       end
      playing = user.game
      playing = 'Nothing' if playing.nil?
      status = user.status.to_s
      event.channel.send_embed do |embed|
        embed.title = 'User Information'
        desc = "**Name#Discrim and ID:** #{user.name}##{user.discrim}, #{user.id}
**Currently Playing:** #{playing}
**Status:** #{status}"
        unless event.channel.private?
          desc += "\n**Joined at:** #{user.joined_at}"
          desc << "\n**Nickname:** #{user.nick}" unless user.nick.nil?
          roles = user.roles
          desc += "\n**Role(s):** #{roles.empty? ? 'No assigned roles' : roles.map(&:name).join(', ')}"
        end
        desc += "\n**Creation time:** #{user.creation_time}"
        embed.description = desc
        embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: user.avatar_url.to_s)
        if status == 'online'
          embed.color = 1108583
        elsif status == 'dnd'
          embed.color = 16722454
        elsif status == 'idle'
          embed.color = 16761666
        end
      end
    end
  end
end