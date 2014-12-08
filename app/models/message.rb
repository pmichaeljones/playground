class Message < ActiveRecord::Base

  default_scope{ order('created_at DESC')}

  validates :sender, presence: true
  validates :contents, presence: true


end
