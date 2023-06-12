require 'rails_helper'

RSpec.describe Forecast do
  before :each do
    @current_weather_data = {
      last_updated: "2023-06-12 15:17",
      temp_f: 72.0,
      feelslike_f: 72.0,
      humidity: 10,
      uv: 10.0,
      vis_miles: 10.0,
      condition: {
        text: "Sunny",
        icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }}
    @current_weather = CurrentWeather.new(@current_weather_data)

    @daily_weather_data_1 = {
      date: "2023-04-07",
      day: {
        maxtemp_f: 72.0,
        mintemp_f: 42.0,
        condition: {
          text: "Sunny",
          icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
        }},
        astro: {
          sunrise: "5:57 AM",
          sunset: "7:42 PM"
        }}
    @daily_weather_1 = DailyWeather.new(@daily_weather_data_1)
    @daily_weather_data_2 = {
      date: "2023-04-08",
      day: {
        maxtemp_f: 75.0,
        mintemp_f: 45.0,
        condition: {
          text: "Sunny",
          icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
        }},
        astro: {
          sunrise: "5:57 AM",
          sunset: "7:42 PM"
        }}

    @daily_weather_2 = DailyWeather.new(@daily_weather_data_2)

    @hourly_weather_data_1 = {
      time: "2023-06-12 00:00",
      temp_f: 72.0,
      condition: {
        text: "Sunny",
        icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }}
    @hourly_weather_1 = HourlyWeather.new(@hourly_weather_data_1)

    @hourly_weather_data_2 = {
      time: "2023-06-12 01:00",
      temp_f: 72.0,
      condition: {
        text: "Sunny",
        icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }}
    @hourly_weather_2 = HourlyWeather.new(@hourly_weather_data_2)

    @hourly_weather_data_3 = {
      time: "2023-06-12 02:00",
      temp_f: 72.0,
      condition: {
        text: "Sunny",
        icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }}

    @hourly_weather_3 = HourlyWeather.new(@hourly_weather_data_3)

    @daily_weather = [@daily_weather_1, @daily_weather_2]
    @hourly_weather = [@hourly_weather_1, @hourly_weather_2, @hourly_weather_3]
  end

  it 'exists' do
    forecast = Forecast.new(@current_weather, @daily_weather, @hourly_weather)

    expect(forecast).to be_a Forecast
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.daily_weather).to be_a Array
    expect(forecast.daily_weather.first).to be_a DailyWeather
    expect(forecast.daily_weather.last).to be_a DailyWeather
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.hourly_weather.first).to be_a HourlyWeather
    expect(forecast.hourly_weather.last).to be_a HourlyWeather
  end
end