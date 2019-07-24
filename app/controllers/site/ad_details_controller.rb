# frozen_string_literal: true

class Site::AdDetailsController < SiteController
  def show
    @ad = Ad.find(params[:id])
  end
end
