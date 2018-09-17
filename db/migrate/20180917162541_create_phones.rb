class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :wireless_number
      t.string :user_number
      t.string :service_status
      t.string :upgrade_date
      t.string :account_number
      t.string :device_id

      t.timestamps
    end
  end
end
