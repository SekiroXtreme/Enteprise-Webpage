class AddCustomerReferencesToConversation < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:conversations, :customer_id)
      add_reference :conversations, :customer, null: false, foreign_key: true
    end
  end
end

