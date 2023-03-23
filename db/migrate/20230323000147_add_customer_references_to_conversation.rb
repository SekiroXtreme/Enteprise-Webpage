class AddCustomerReferencesToConversation < ActiveRecord::Migration[7.0]
  def change
    add_reference :conversations, :customer, null: false, foreign_key: true
  end
end
