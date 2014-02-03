class AddCounterCache < ActiveRecord::Migration
  def self.up
    add_column :student_speakers, :votes_count, :integer, default: 0
  end
  
  def self.down
    remove_column :student_speakers, :votes_count
  end
end
