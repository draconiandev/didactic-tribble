#
class ApplicationController < ActionController::Base

  before_action :prepare_meta_tags, if: "request.get?"

  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :person_not_authorized

  protected

  # FIXME: Change default image url after the website is up
  def prepare_meta_tags(options={})
    site_name   = "TrekHub"
    title       = action_name.capitalize
    description = "Organizing trekking tours, adventures tours. We hold expertise in offering you India trekking tours at best prices. Get complete information about famous treks for Trekking in India."
    image       = options[:cover] || "http://www.trekhub.in/imgs/logo.png"
    current_url = request.url

    defaults = {
      site:        site_name,
      title:       title,
      icon:        '/favicon.ico',
      image:       image,
      description: description,
      keywords:    %w[trekhub adventure tourism trekking India paraglide scuba diving skydiving team outings campsites corporate tours],
      category:    "Tourist Guide, Adventure Guide India, Trekking Tour Guide, Hiking Tour Guide",
      classification: "Tours, Travel, Tourism, Tour Guide, Tourism Guide, Tourist Guide, Adventure Guide, Trekking Tour Guide, Hiking Tour Guide",
      DC: {
            title:     "Trekhub – Adventure Trekking Tours Guide in India | Adventure Tourism"
      },
      geo: {
        region: "IN-KA",
        placename: "Bengaluru",
        position: "12.898622;77.570897"
      },
      ICBM: "12.898622;77.570897",
      googlebot: "index, follow",
      msnbot: "index, follow",
      YahooSeeker: "index, follow",
      twitter: {
        site_name: site_name,
        site: '@TrekHubIN',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      },
      author: 'https://plus.google.com/+TrekhubInindia',
      publisher: "http://yourgplusprofile.com/profile/url"
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end

  def authenticate_manager!
    redirect_to new_person_session_path unless admin? || editor?
  end

  def person_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def authenticate_admin!
    redirect_to new_person_session_path unless admin?
  end

  def pundit_user
    Person.find_by_id(current_person)
  end

  def admin?
    current_person && current_person.admin?
  end

  def editor?
    current_person && current_person.editor?
  end
end
