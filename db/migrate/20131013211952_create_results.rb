class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :answer_id
      t.text :characteristics
      t.float :delta_pollution
      t.float :delta_public_support
      t.float :delta_corporate_support
      t.float :delta_balance

      t.timestamps
    end
  end
end
