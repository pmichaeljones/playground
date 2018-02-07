class BlogPost < ActiveRecord::Base

  validates_uniqueness_of :slug

  default_scope { order('updated_at DESC')}

end

