# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  def new
    super(&:build_profile_member)
  end

  protected

  def after_sign_in_path_for(_)
    stored_location = stored_location_for(resource)

    if stored_location.match(site_ad_details_path)
      stored_location
    else
      site_profile_dashboard_index_path
    end
  end
end
