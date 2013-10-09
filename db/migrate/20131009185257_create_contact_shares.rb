class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.string :contact_id, null: false
      t.string :user_id, null: false

      t.timestamps
    end

    add_index :contact_shares, :contact_id
    add_index :contact_shares, :user_id
  end
end
