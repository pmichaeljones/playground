class AddSettingsColumn < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :email
      t.timestamps
    end
  end
end
