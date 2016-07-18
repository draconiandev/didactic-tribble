class StaticPagesController < ApplicationController
  before_action :beautify_url

  def home
    @activities = Activity.limit(6).includes(:destination)
    @destinations = Destination.order("created_at desc").limit(6)
  end

  def show
    @activities = Activity.search(query_term).paginate(page: params[:page]).records
    @categories = Category.search(query_term).records
    @destinations = Destination.search(query_term).records
  end

  def about
  end

  def contact
  end

  def terms
  end

  def policies
  end

  def help
  end

  def trust
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
