class AddValidAnswerToResults < ActiveRecord::Migration
  def change
    add_column :results, :valid_answer, :boolean
  end
end
