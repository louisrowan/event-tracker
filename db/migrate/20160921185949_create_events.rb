class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :stadium
      t.string :location
      t.string :image
      t.integer :ticket_count
      t.float :lowest_price
      t.string :buy_url
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
