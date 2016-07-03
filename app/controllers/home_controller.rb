class HomeController < ApplicationController
  def index
    @comments = Comment.roots
  end
end
