class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :project, foreign_key: true, null: false
      t.references :sender, null: false
      t.references :receiver, null: false
      t.boolean :response
      t.text :description, null: false

      t.timestamps
    end
  end
end
