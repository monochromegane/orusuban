require "orusuban/version"

class Orusuban
  include Cinch::Plugin

  match(/^いってきます[ 　](.+?)[ 　](.+)/, method: :start, use_prefix: false)
  match(/^ただいま/, method: :stop, use_prefix: false)
  match(/.*/, method: :reply, use_prefix: false)

  timer 600, method: :talk_to_oneself
  def talk_to_oneself
    return unless @answering
    @bot.channels.sample.msg config[:talk_to_oneself].sample
  end

  def start(m, place, time)
    @answering = true
    @place     = place
    @time      = time
    @visitors  = []
    m.reply config[:take_care].sample
  end

  def stop(m)
    @answering = false
    m.reply config[:welcome_back].sample
    if !@visitors.empty?
      m.reply config[:have_visitors].sample.gsub(/%visitors%/, @visitors.uniq.join(','))
    end
  end

  def reply(m)
    return if m.message.match(/^いってきます|^ただいま/)
    return unless @answering
    return if m.user.nick == bot.nick
    m.reply '！'
    message = if @visitors.include? m.user.nick
                config[:reply_again].sample
              else
                config[:reply].sample
              end
    m.reply message
            .gsub(/%visitor%/, m.user.nick)
            .gsub(/%time%/, @time)
            .gsub(/%place%/, @place)
    @visitors << m.user.nick
  end
end

