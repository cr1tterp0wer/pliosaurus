# == Schema Information
#
# Table name: sessions
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Session < ApplicationRecord

  after_initialize :ensure_session_token
  validates :session_token, :user_id, presence:true
  validates :session_token, uniqueness:true
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  def remove_session_token
    self.session_token = nil
  end
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  #class methods
  def self.get_user_id_by_token(st)
    session = Session.find_by(session_token:st)
    session.user_id unless session.nil?
  end
  def self.sign_out_user(user_id)
    sessions = Session.where(user_id:user_id)
    sessions.each do |session|
      session.destroy
    end
  end

end
