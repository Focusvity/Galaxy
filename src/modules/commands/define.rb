# frozen_string_literal: true

require 'urban_dict'

module Bot::DiscordCommands
  module Define
    extend Discordrb::Commands::CommandContainer
    command(%i[define def]) do |event, *args|
      begin
        event.channel.send_embed do |embed|
          define = nil
          msg = args.join(' ')
          define = if msg != ''
                     UrbanDict.define(msg)
                   else
                     UrbanDict.random
                   end
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: define['word'],
                                                              url: define['permalink'])
          embed.add_field(name: 'Definition', value: define['definition'])
          embed.add_field(name: 'Example', value: define['example'])
          embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "#{define['thumbs_up']} likes/#{define['thumbs_down']} dislikes",
                                                              icon_url: '')
          embed.color = 1452363
        end
      end
    end
  end
end