class AddDescriptionToMemberExpertises < ActiveRecord::Migration[5.2]
  def change
    add_column :member_expertises, :description, :text
  end
end
