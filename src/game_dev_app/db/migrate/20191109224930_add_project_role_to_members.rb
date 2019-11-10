class AddProjectRoleToMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :project_role, foreign_key: true
  end
end
