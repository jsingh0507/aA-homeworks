class ChangeToys < ActiveRecord::Migration[7.0]
  def change
    add_column :toys, :name, :string, null: false
  end
end
