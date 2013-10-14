class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :text
      t.datetime :ends_at

      t.timestamps
    end
  end
end
