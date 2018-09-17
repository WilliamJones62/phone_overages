class AddUserNameToPhones < ActiveRecord::Migration[5.1]
  def change
    add_column :phones, :user_name, :string
  end
end
