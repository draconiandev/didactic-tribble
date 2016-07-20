class StaticPagesController < ApplicationController

  def home
    @activities = Activity.latest(6).includes(:destination)
    @destinations = Destination.order("created_at desc").limit(6)
    @weekend_getaways = Activity.handcrafted(:weekend_getaway).count
    @team_outings = Activity.handcrafted(:team_outing).count
    @elderly_activities = Activity.handcrafted(:elderly_activity).count
    @women_specials = Activity.handcrafted(:women_special).count
  end

  def handcrafted
    @weekend_getaways = Activity.handcrafted(:weekend_getaway).latest(9)
    @team_outings = Activity.handcrafted(:team_outing).latest(9)
    @elderly_activities = Activity.handcrafted(:elderly_activity).latest(9)
    @women_specials = Activity.handcrafted(:women_special).latest(9)
  end

  def weekend
    @weekend_getaways = Activity.handcrafted(:weekend_getaway).paginate(page: params[:page], per_page: 9)
  end

  def team_outing
    @team_outings = Activity.handcrafted(:team_outing).paginate(page: params[:page], per_page: 9)
  end

  def elderly
    @elderly_activities = Activity.handcrafted(:elderly_activity).paginate(page: params[:page], per_page: 9)
  end

  def women_special
    @women_specials = Activity.handcrafted(:women_special).paginate(page: params[:page], per_page: 9)
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
end
