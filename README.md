# Orusuban

IRCチャンネルのお留守番をしてくれるCinchPluginです。  
留守番中にチャンネルに連絡があれば応答します。  
暇なときは、ひとりごとをつぶやきます。  

see: [Chinch](https://github.com/cinchrb/cinch)

## Installation

Add this line to your application's Gemfile:

    gem 'orusuban'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orusuban

## Usage

```ruby
require "cinch"
require "orusuban"

bot = Cinch::Bot.new do
  configure do |c|
    # add all required options here
    c.plugins.plugins = [Orusuban]
    c.plugins.options[Orusuban] = {
      take_care:       ['いってらっしゃーい'],
      reply:           ['%time%まで%place%でMTG中です'],
      reply_again:     ['まだ席を外しています'],
      welcome_back:    ['おかえりー'],
      have_visitors:   ['%visitors%が来てましたよー'],
      talk_to_oneself: ['お・る・す・ば・ん']
    }
  end
end

bot.start
```

## Command

`いってきます　場所　終了時間`でお留守番を開始します。  
お留守番中に連絡があれば、応答します。  
暇なときは、ひとりごとをつぶやきます。  

```console
いってきます　会議室A　10時
```

`ただいま`でお留守番を終了します。  
お留守番中に訪問したユーザも教えてくれます。  

```console
ただいま
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
