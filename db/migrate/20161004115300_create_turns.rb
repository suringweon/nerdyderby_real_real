class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
			t.integer :tmp
      t.timestamps
    end
  end
end
