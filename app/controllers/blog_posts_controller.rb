class BlogPostsController < ApplicationController

  before_action :require_login, only: [:new, :edit, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def verify
    if params[:user_name] == ENV['USERNAME'] && params[:password] == ENV['PASSWORD']
      session["logged_in_user"] = true
      redirect_to new_blog_post_path
    else
      flash[:error] = "You cannot do that!"
      redirect_to root_path
    end
  end

  def new
    @post = BlogPost.new
  end

  def update
  end

  def destroy
  end

  def logout
    session["logged_in_user"] = false
    flash[:success] = "You are logged out."
    redirect_to root_path
  end

  private

  def require_login
    if session["logged_in_user"] != true
      render :login and return
    end
  end

end
