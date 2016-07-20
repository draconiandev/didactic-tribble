class Api::SearchAutocompleteController < ApplicationController
  def index
    results = Elasticsearch::Model.search(params[:term], [Activity, Category, Destination])
    @activities = results.select { |result| result["_type"] == 'activity' }
    @categories = results.select { |result| result["_type"] == 'category' }
    @destinations  = results.select { |result| result["_type"] == 'destination' }
  end
end
