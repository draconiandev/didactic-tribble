class SearchController < ApplicationController

  def show
    @activities = Activity.activity_search(query_term).includes(:categories, :destination)
    @activities_autocomplete = Activity.all
    @categories = Category.category_search(query_term)
    @destinations = Destination.destination_search(query_term)
    @autocomplete = Destination.all + Category.all

    prepare_meta_tags title: "Search"
  end

  private

  def query_term
    params[:q] || ''
  end
end
