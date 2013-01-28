class CropSpecs < ActiveRecord::Migration
  def change
    change_table :speakers do |t|
      t.string :crop
    end
  end
end
