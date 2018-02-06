class AddBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title, :slug, :metadescription 
      t.text :content
      t.timestamps
    end
  end
end
