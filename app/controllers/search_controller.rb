class SearchController < ApplicationController
  before_action :beautify_url

  def show
    @activities = Activity.search(query_term).paginate(page: params[:page]).records
    @categories = Category.search(query_term).records
    @destinations = Destination.search(query_term).records
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
