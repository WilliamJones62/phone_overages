class CreateOverages < ActiveRecord::Migration[5.1]
  def change
    create_table :overages do |t|
      t.string :name
      t.string :number
      t.date :overage_date
      t.string :reason
      t.float :added_data

      t.timestamps
    end
  end
end
