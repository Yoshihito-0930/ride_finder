class SearchsController < ApplicationController
  def result
    @category = params[:category]
    @condition = params[:condition]
    @condition_value = if params[:condition] == 'distance'
                         params[:distance_value]
                       else
                         params[:time_value]
                       end
  end

  def set_q
    # @q = T.ransack(params[:q])
  end
end
