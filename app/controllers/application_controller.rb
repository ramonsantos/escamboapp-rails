# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_filter :store_current_location, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      'backoffice_devise'
    elsif devise_controller? && resource_name == :member
      'site_devise'
    else
      'application'
    end
  end

  def user_not_authorized
    flash[:alert] = I18n.t('messages.not_authorized')
    redirect_to(request.referrer || root_path)
  end

  private

  def store_current_location
    store_location_for(:member, request.url)
  end
end
