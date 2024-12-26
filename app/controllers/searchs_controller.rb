class SearchsController < ApplicationController
  def result
    permitted_params = search_params
    @category = permitted_params[:category]
    @condition = permitted_params[:condition]
    @condition_value = if params[:condition] == 'distance'
                         params[:distance_value]
                       else
                         params[:time_value]
                       end
  end

  private

  def search_params
    params.except(:commit).permit(:category, :condition, :distance_value, :time_value)
  end
end
