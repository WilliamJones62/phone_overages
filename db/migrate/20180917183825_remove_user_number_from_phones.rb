class RemoveUserNumberFromPhones < ActiveRecord::Migration[5.1]
  def change
    remove_column :phones, :user_number, :string
  end
end
