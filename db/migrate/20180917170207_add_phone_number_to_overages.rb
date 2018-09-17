class AddPhoneNumberToOverages < ActiveRecord::Migration[5.1]
  def change
    add_column :overages, :phone_number, :string
  end
end
