class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
    @disabled_dates = @car.bookings.flat_map { |booking| (booking.begin_date.to_date..booking.end_date.to_date).map { |date| date.strftime('%Y-%m-%d')
      }}
  end
end
