class PostsController < ApplicationController
  def index
    Post.all
  end

  def new
    @post = Post.new
  end

end
