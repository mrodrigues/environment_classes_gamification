class ChangeDefaultOfValidAnswerFromResults < ActiveRecord::Migration
  def up
    change_column :results, :valid_answer, :boolean, default: true
  end

  def down
    change_column :results, :valid_answer, :boolean, default: nil
  end
end
