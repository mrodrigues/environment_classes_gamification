class AddTextToResults < ActiveRecord::Migration
  def change
    add_column :results, :text, :string
  end
end
