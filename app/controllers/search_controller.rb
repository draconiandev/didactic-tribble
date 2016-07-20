class SearchController < ApplicationController
  before_action :beautify_url

  def show
    @activity_records = Activity.search(query_term).records.paginate(page: params[:page])
    @activities = @activity_records.to_a
    @category_records = Category.search(query_term).records
    @categories = @category_records.to_a
    @destination_records = Destination.search(query_term).records
    @destinations = @destination_records.to_a
  end

  private

    def beautify_url
      if params[:search].present?
        redirect_to search_url(q: params[:search][:q])
      end
    end

  def query_term
    params[:q] || ''
  end
end
