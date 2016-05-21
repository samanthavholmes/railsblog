class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
