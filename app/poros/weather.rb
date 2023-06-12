class Weather
  attr_accessor :current_weather, :summary

  def initialize(data)
    @current_weather = data[:current][:temp_f]
    @summary = data[:current][:condition][:text]
  end
end