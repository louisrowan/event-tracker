class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps null: false
    end
  end
end
