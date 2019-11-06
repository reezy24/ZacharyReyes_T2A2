class CreateMemberExpertises < ActiveRecord::Migration[5.2]
  def change
    create_table :member_expertises do |t|
      t.references :member, foreign_key: true, null: false
      t.references :expertise, foreign_key: true, null: false

      t.timestamps
    end
  end
end
