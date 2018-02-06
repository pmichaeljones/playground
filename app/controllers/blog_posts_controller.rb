class BlogPostsController < ApplicationController

  before_action :require_login, only: [:new, :edit, :destroy]

  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.where(slug: params[:slug]).first

    if @post
      render :show
    else
      flash[:error] = "Fail."
      redirect_to root_path
    end

  end

  def create
    @post = BlogPost.new(blog_post_params)

    if @post.save
      flash[:success] = "Your post as been published."
      redirect_to blog_path
    else
      flash[:error] = "Error. Please fix your mistakes."
      render :new
    end

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

  def blog_post_params
    params.require(:blog_post).permit(:content, :slug, :metadescription, :title)
  end

  def require_login
    if session["logged_in_user"] != true
      render :login and return
    end
  end

end
