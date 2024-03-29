# frozen_string_literal: true

class Site::CategoriesController < ApplicationController
  def show
    @categories = Category.order_by_description
    @category = Category.friendly.find(params[:id])
    @ads = Ad.by_category(@category, params[:page])
  end
end
