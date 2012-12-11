class CreateStudentSpeakers < ActiveRecord::Migration
  def change
    create_table :student_speakers do |t|
      t.string :name
      t.string :talk
      t.string :description
      t.string :youtube
      t.has_attached_file :thumbnail
      
      t.timestamps
    end
  end
end
