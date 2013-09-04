class CreateApplicationQuestions < ActiveRecord::Migration
  def change
    create_table :application_questions do |t|
      t.text :content
      t.integer :application_role_id
      t.integer :application_cycle_id
    end
  end
end
