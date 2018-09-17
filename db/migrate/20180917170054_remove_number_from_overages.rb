class RemoveNumberFromOverages < ActiveRecord::Migration[5.1]
  def change
    remove_column :overages, :number, :string
  end
end
