class StaticPagesController < ApplicationController

  def home
    @activities = Activity.limit(6).includes(:destination)
    @destinations = Destination.order("created_at desc").limit(6)
  end

  def handcrafted
    @weekend_getaways = Activity.handcrafted(:weekend_getaway).latest(6)
    @team_outings = Activity.handcrafted(:team_outing).latest(6)
    @elderly_activities = Activity.handcrafted(:elderly_activity).latest(6)
    @women_specials = Activity.handcrafted(:women_special).latest(6)
  end

  def weekend
    @weekend_getaways = Activity.handcrafted(:weekend_getaway)
  end

  def team_outing
    @team_outings = Activity.handcrafted(:team_outing)
  end

  def elderly
    @elderly_activities = Activity.handcrafted(:elderly_activity)
  end

  def women_special
    @women_specials = Activity.handcrafted(:women_special)
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
