# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location_id     :integer
#

class User < ApplicationRecord
  attr_reader :password
  
  validates :username, presence: true, uniqueness:true
  validates :password_digest, presence: true
  validates :password, allow_nil:true,length:{minimum: 6}
  
  has_one :location,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Location
  has_many :sessions,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Session

  has_many :user_groups,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :GroupUserJoin
  has_many :groups,
    through: :user_groups,
    source: :group

  #instance methods
  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end
  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  #class methods
  def self.find_by_credentials(uname,pass)
    u = User.find_by(username: uname)
    return nil if u.nil?
    return u if u.is_password?(pass) 
    return nil
  end

end








