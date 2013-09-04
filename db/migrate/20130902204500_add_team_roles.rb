class AddTeamRoles < ActiveRecord::Migration
  
  ROLES = [
    "Web Developer",
    "Graphic Designer",
    "Stage Tech"
  ]
  
  def change
    ROLES.each do |role|
      ApplicationRole.create(name: role)
    end
  end
end
