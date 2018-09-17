class Phone < ApplicationRecord

  def self.import(file)
    Phone.delete_all
    CSV.foreach(file.path, headers:true) do |row|
      Phone.create! row.to_hash
    end
  end

end
