class BookingsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save!
      redirect_to dashboard_path(@booking)
    else
      render 'cars/show'
    end
  end

  def dashboard
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = @booking.car
    @disabled_dates = @car.bookings.flat_map { |booking| (booking.begin_date.to_date..booking.end_date.to_date).map { |date| date.strftime('%d-%m-%Y') } }
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :begin_date, :end_date)
  end
end
