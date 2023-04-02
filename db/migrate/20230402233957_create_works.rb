class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.text :job
      t.text :description
      t.integer :price
      t.text :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
