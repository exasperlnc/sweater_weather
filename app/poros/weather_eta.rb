class WeatherEta
  attr_reader :temperature, :conditions, :datetime

  def initialize(data)
    @temperature = data[:temp_f]
    @conditions = data[:condition][:text]
    @datetime = data[:time]
  end
end