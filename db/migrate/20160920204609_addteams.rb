class Addteams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title
      t.string :date
      t.string :stadium
      t.string :location
      t.string :image
    end
  end
end
