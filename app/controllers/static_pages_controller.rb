class StaticPagesController < ApplicationController
  before_action :beautify_url

  def home
    @activities = Activity.limit(6).includes(:destination, :category)
    @destinations = Destination.order("created_at desc").limit(6)
  end

  def show
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
