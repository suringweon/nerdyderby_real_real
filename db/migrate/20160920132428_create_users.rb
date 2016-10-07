class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :username
			t.string :phone
			t.string :carname
			t.string :image
			t.string :rail
			t.integer:record, default:-1
			t.integer :group
			t.string :content, default:""
      t.timestamps
    end
  end
end
