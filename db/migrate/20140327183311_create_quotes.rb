class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :text
      t.integer :group_id

      t.timestamps
    end
  end
end
