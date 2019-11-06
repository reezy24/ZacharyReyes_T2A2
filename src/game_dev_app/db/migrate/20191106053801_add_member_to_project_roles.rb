class AddMemberToProjectRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_roles, :member, foreign_key: true
  end
end
