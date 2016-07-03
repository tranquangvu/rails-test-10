class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @comments = Comment.roots
  end
end
