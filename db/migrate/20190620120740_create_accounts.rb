class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :email, null: false
      t.string :token
      t.timestamps
    end
  end
end
