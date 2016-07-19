class SearchController < ApplicationController
  before_action :beautify_url

  def show
    @activity_records = Activity.search(query_term).records
    @activities = @activity_records.to_a
    @categories = Category.search(query_term).records.to_a
    @destinations = Destination.search(query_term).records.to_a
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
