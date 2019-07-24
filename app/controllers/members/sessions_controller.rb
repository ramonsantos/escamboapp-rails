# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(_)
    site_profile_dashboard_index_path
  end
end
