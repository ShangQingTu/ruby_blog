class CreateViewers < ActiveRecord::Migration[6.0]
  def change
    create_table :viewers do |t|
      t.string :name
      t.integer :article_id
      t.timestamps
    end

    add_index :viewers, :article_id
  end
end
