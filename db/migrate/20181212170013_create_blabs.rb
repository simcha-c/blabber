class CreateBlabs < ActiveRecord::Migration[5.2]
  def change
    create_table :blabs do |t|
      t.integer :author_id
      t.text :body

      t.timestamps
    end
  end
end
