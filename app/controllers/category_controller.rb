class CategoryController < ApplicationController
  def index
    @users = User.all
  end
end
