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
    params[:blog_post][:content] = params[:my_textarea]
    params[:blog_post][:slug] = params[:blog_post][:slug].gsub(" ", "-")

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
    @post = BlogPost.where(id: params[:id]).first

    if @post
      render :edit
    else
      flash[:error] = "Error Captain!"
      redirect_to root_path
    end
  end

  def update
    @post = BlogPost.find(params[:id])

    params[:blog_post][:content] = params[:my_textarea]
    params[:blog_post][:slug] = params[:blog_post][:slug].gsub(" ", "-")
    
    @post.update(blog_post_params)

    if @post.save
      flash[:success] = "Your post as been updated."
      redirect_to blog_path
    else
      flash[:error] = "Error. Please fix your mistakes."
      render :edit
    end
  end

  def verify
    Rails.logger.debug(request.cookies)
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

  def destroy
    if session["logged_in_user"] == true
      @post = BlogPost.find(params[:id])

      @post.delete if @post
      flash[:success] = "Blog post deleted."

      redirect_to blog_path
    end
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
