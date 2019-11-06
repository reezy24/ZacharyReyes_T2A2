class CreateProjectRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :project_roles do |t|
      t.references :expertise, foreign_key: true, null: false
      t.references :project, foreign_key: true, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
