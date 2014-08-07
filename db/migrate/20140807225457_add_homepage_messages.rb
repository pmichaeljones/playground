class AddHomepageMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :sender
      t.timestamps
    end

  end
end
