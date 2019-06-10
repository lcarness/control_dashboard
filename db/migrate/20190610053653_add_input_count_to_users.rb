class AddInputCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :inputs_count, :integer
  end
end
