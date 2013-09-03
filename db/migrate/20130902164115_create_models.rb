class CreateModels < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :initials
    end

    create_table :games do |t|
      t.integer :winner_id
      t.integer  :winner_time
      t.timestamps
    end

    create_table :games_players do |t|
      t.belongs_to :game
      t.belongs_to :player
    end
  end
end
