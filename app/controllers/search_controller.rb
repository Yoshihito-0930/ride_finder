class SearchController < ApplicationController
  def search
    category = params[:category]
    condition = params[:condition]
    @results = VisitCategory.where(name: category)
    # binding.pry
    @results = @results.select do |visit_category|
      visit_category.conditions.where(condition_type: condition).exists?
    end
  end

  def set_q
    # @q = T.ransack(params[:q])
  end
end
