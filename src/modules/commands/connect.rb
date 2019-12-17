# frozen_string_literal: true

module Bot::DiscordCommands
  module Connect
    extend Discordrb::Commands::CommandContainer
    command(%i[connect join]) do |event|
      voice_channel = event.user.voice_channel
      if voice_channel.nil?
        event.respond 'You are not in a voice channel!'
        break
      end

      event.bot.voice_connect(voice_channel)
      event.respond "Joined #{voice_channel.name}"
    end
  end
end
