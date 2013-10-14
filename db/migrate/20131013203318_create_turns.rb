class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.datetime :ends_at

      t.timestamps
    end
  end
end
