class CreateApplicationRoles < ActiveRecord::Migration
  def change
    create_table :application_roles do |t|
      t.string :name
      t.text :description
    end
  end
end
