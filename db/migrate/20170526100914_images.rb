class Images < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user

      t.timestamps null: false
    end
  end
end
