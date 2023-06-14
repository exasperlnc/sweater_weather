class WeatherEta
  attr_reader :temperature, :conditions, :datetime

  def initialize(data, arrival_time)
    @temperature = data[:temp_f]
    @conditions = data[:condition][:text]
    @datetime = arrival_time
  end
end