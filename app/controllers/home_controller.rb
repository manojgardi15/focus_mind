class HomeController < ApplicationController
  def index
  end

  def search_group
    if params[:search].present?
      @search = Group.where('name LIKE ?', "%#{params[:search]}%")
      render json: @search
    end
  end
end
