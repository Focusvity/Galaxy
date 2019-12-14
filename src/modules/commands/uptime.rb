# frozen_string_literal: true

module Bot::DiscordCommands
  module Uptime
    extend Discordrb::Commands::CommandContainer
    command(:uptime) do |event|
      event.channel.start_typing
      calculate(Time.now)
      event.channel.send_embed do |embed|
        embed.description = humanise
        embed.color = 4165563
        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'Created by Fleek#0036', icon_url: '')
      end
    end

    attr_accessor :seconds, :minutes, :hours, :days

    def self.calculate(current_time)
      time_difference = (current_time - $start_time).floor
      @seconds = time_difference % 60
      @minutes = time_difference / 60 % 60
      @hours = time_difference / (60 * 60) % 24
      @days = time_difference / (60 * 60 * 24)
    end

    def self.humanise
      time_string = "#{@days} #{pluralise 'day', @days}, "
      time_string += "#{@hours} #{pluralise 'hour', @hours}, "
      time_string += "#{@minutes} #{pluralise 'minute', @minutes} and "
      time_string += "#{@seconds} #{pluralise 'second', @seconds}"
      time_string
    end

    def self.pluralise(word, value)
      return word if value == 1

      "#{word}s"
    end
  end
end