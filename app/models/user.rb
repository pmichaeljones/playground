class User < ActiveRecord::Base

  include Storext.model
  store_attributes :settings do
    default_singature String, default: "Let's see if this changes."
  end
end
