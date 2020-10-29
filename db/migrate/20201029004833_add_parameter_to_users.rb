class AddParameterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :max_hp, :integer, null: false, default: 10
    add_column :users, :level, :integer, null: false, default: 1
    add_column :users, :exp, :integer, null: false, default: 0
    add_column :users, :attack_power, :integer, null: false, default: 5
    add_column :users, :defensive_power, :integer, null: false, default: 5
  end
end
