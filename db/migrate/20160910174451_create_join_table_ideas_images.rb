class CreateJoinTableIdeasImages < ActiveRecord::Migration[5.0]
  def change
    create_join_table :ideas, :images do |t|
      t.index :idea_id
      t.index :image_id
      t.timestamps
    end
  end
end
