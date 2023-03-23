class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :conversation
      t.references :customer, null:false, foreign_key: true

      t.timestamps
    end
  end
end
