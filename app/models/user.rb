class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable
 
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
    end
  end
end

