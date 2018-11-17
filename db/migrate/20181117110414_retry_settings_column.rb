class RetrySettingsColumn < ActiveRecord::Migration
  def change
    add_column :users, :settings, :jsonb, null: false, default: {}
  end
end
