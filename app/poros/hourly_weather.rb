class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = data[:time]
    @temperature = data[:temp_f]
    @conditions = data[:condition][:text]
    @icon = data[:condition][:icon]
  end
end