class RemoveProjectFromOffers < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :project_id
  end
end
