# frozen_string_literal: true

class Site::AdDetailsController < SiteController
  def show
    @categories = Category.order_by_description
    @ad = Ad.find(params[:id])
  end
end
