# frozen_string_literal: true

require 'discordrb'
require 'dotenv/load'

# Main bot module
module Bot
  # Load modules
  Dir['src/modules/*.rb'].each { |mod| load mod }

  BOT = Discordrb::Commands::CommandBot.new(token: ENV['TOKEN'],
                                            client_id: ENV['CLIENT_ID'],
                                            prefix: ENV['COMMAND_PREFIX'])

  def self.load_modules(clazz, path, clear = false)
    BOT.clear! if clear
    new_module = Module.new
    const_set(clazz.to_s, new_module)
    Dir["src/modules/#{path}/*rb"].each { |file| load file }
    new_module.constants.each do |mod|
      BOT.include! new_module.const_get(mod)
    end
  end

  load_modules(:DiscordCommands, 'commands')
  load_modules(:DiscordEvents, 'events')

  BOT.run
end

