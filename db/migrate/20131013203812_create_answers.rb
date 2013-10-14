class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :city_id
      t.integer :turn_id

      t.timestamps
    end
  end
end
