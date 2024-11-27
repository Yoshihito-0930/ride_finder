class FutureVisitsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @destination = Destination.find(params[:destination_id])
    current_user.add_future_visit(@destination)
  end

  def destroy
    @destination = current_user.upcoming_destinations.find(params[:id])
    current_user.remove_future_visit(@destination)
  end
end
