# frozen_string_literal: true

module Bot::DiscordCommands
  # Evaluate ruby codes.
  # Only the bot owner have the access to this command
  module Debug
    extend Discordrb::Commands::CommandContainer
    command(%i[debug d], help_available: false) do |event, *code|
      break unless event.user.id == event.bot.bot_app.owner.id

      time = Time.new
      new_time = "#{time.hour}:#{time.min}:#{time.sec}"
      begin
        result = eval code.join(' ')
        event.respond "```md\n# #{new_time}: #{result}```"
      rescue Exception => e
        event.respond "```md\n> #{e.backtrace.first}: #{e.message}```"
      end
    end
  end
end