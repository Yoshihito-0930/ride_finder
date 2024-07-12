class SearchController < ApplicationController
  def search
    @category = params[:category]
    @condition = params[:condition]
    @condition_value = if params[:condition] == 'distance'
                         params[:distance_value]
                       else
                         params[:time_value]
                       end
    # @results = VisitCategory.where(name: category)
    # @results = @results.select do |visit_category|
    #   visit_category.conditions.where(condition_type: condition).exists?
    # end
  end

  def set_q
    # @q = T.ransack(params[:q])
  end
end
