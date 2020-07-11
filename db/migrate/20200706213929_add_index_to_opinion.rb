class AddIndexToOpinion < ActiveRecord::Migration[5.2]
  def change
    add_index :opinions, :author_id
  end
end
