module Nostradamus
  module Command
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |client, data, match|
        client.say(channel: data.channel, text: help_message)
      end

      def self.help_message()
        text = <<'EOS'
【Nostradamus bot】
- help: 使い方
EOS
      end
    end
  end
end
