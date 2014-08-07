class Message < ActiveRecord::Base

  validates :sender, presence: true
  validates :contents, presence: true
end
