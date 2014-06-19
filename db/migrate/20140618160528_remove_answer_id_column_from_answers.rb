class RemoveAnswerIdColumnFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :answer_id, :integer
  end
end
