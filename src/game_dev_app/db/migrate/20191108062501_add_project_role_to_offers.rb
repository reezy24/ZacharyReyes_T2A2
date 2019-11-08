class AddProjectRoleToOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :project_role, foreign_key: true, null: false
  end
end
