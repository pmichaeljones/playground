class PagesController < ApplicationController

  def blog
    render 'pages/blog/index'
  end

  def sitemap
    @posts = BlogPost.all

    # respond_to do |format|
    #   format.xml do 
    #     
    #   end
    # end
  end

end
