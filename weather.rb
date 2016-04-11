require 'barometer'
require 'colorize'


class WeatherBotFiveK

  def initialize
  end

  def ask_for_location
    puts 'Welcome to WeatherBot 5000™! May I please have your location?'
  end

  def get_response
    location = Barometer.new(gets.chomp)
    @weather = location.measure
  end

  def current_temperature
    puts "It looks like your temperature is #{@weather.today.high.f} and low #{@weather.today.low.f}"
  end

  # def current_weather
  #   today = @weather.today
  #   puts today.condition
  #   puts today.visibility
  #   date_maker(Time.now)
  #   picture(today)
  #   lets_talk_weather(@weather.today)
  # end

  def mostly_cloudy
    puts "«——————————————»"
    puts "|              |"
    puts "|    #{'Mostly'.black}    |"
    puts "|    #{'Cloudy'.black}    |"
    puts "|==============|"
    puts "|    #{'.--.'.black}      |"
    puts "|  #{'.-(    ).'.black}   |"
    puts "| #{'(___.__)__)'.black}  |"
    puts '«——————————————»'
  end

  def snow
    puts "«——————————————»"
    puts "|              |"
    puts "|" + "     Snow    ".white + " |"
    puts "|              |"
    puts "|==============|"
    puts "|   #{' .-.'.black}       |"
    puts "|   #{'(   ).'.black}     |"
    puts "|   #{'(___(__)'.black}   |"
    puts "|   #{'* * * *'.white}    |"
    puts "|   #{' * * * *'.white}   |"
    puts "«——————————————»"
  end

  def chance_rain
    puts "«——————————————»"
    puts "|              |"
    puts "|" + "     Rain    ".white + " |"
    puts "|              |"
    puts "|==============|"
    puts "| #{'     .-.     '.black}|"
    puts "| #{'    (   ).   '.black}|"
    puts "| #{'   (___(__)  '.black}|"
    puts "| #{'    ʻ ʻ ʻ ʻ  '.blue}|"
    puts "| #{'   ʻ ʻ ʻ ʻ   '.blue}|"
    puts "«——————————————»"
  end

  def sunny
    puts "«——————————————»"
    puts "|              |"
    puts "|" + "     Sunny    ".yellow + "|"
    puts "|              |"
    puts "|==============|"
    puts "|    \\  |  /   |".yellow
    puts "|     .---.    |".yellow
    puts "|  ‒-( °–° )-‒ |".yellow
    puts "|     `---᾿    |".yellow
    puts "|    /  |  \\   |".yellow
    puts "«——————————————»"
  end


  def partly_cloudy
    puts "«——————————————»"
    puts "|              |"
    puts "|    #{'Partly'.black}    |"
    puts "|    #{'Cloudy'.black}    |"
    puts "|==============|"
    puts "|    #{'.--.'.black}      |"
    puts "|  #{'.-(    ).'.black}   |"
    puts "| #{'(___.__)__)'.black}  |"
    puts '«——————————————»'
  end

  def picture(day)
    case day.icon
      when 'clear'
        @weather_type = 'sunny'
        sunny
      when 'partlycloudy'
        @weather_type = 'Partly Cloudy'
        partly_cloudy
      when 'mostlycloudy'
        @weather_type = 'Mostly Cloudy'
        mostly_cloudy
      when 'cloudy'
        @weather_type = 'cloudy'
        mostly_cloudy
      when 'rain'
        @weather_type = 'rainy'
        chance_rain
      when 'chancerain'
        @weather_type = 'rainy'
        chance_rain
      when /snow/
        @weather_type = 'snowy'
        snow
      else
        puts day.icon
    end
  end


  def forecast
    whole_week = []
    whole_week << @weather.today
    @weather.forecast.each do |day|
      whole_week << day
    end
    whole_week.each do |day|
      date_maker(day.starts_at)
      picture(day)
      lets_talk_weather(day)
    end
  end

  def date_maker(date)
    today    = Time.new.strftime('%d').to_i
    tomorrow = today + 1
    case date.strftime('%d').to_i
      when today
        @formatted_day = 'Today'
      when tomorrow
        @formatted_day = 'Tomorrow'
      else
        @formatted_day = date.strftime('%A')
    end
    puts "«——————————————»"
    puts "    #{@formatted_day}    "
    puts "«——————————————»"
  end

  def lets_talk_weather(day)
    puts "\n#{@formatted_day} is going to be #{@weather_type} with a high of #{day.high.f}° F and a low of #{day.low.f}° F\n"
  end

end

weather = WeatherBotFiveK.new
weather.ask_for_location
weather.get_response
weather.current_temperature
weather.forecast