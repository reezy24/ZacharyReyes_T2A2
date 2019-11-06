class AddOwnerToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :owner, null: false
  end
end
