class CreateApplicationAnswers < ActiveRecord::Migration
  def change
    create_table :application_answers do |t|
      t.integer :application_question_id
      t.integer :application_id
      t.text :content
      t.timestamps
    end
  end
end
