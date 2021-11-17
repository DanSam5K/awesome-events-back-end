class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, jwt_revocation_strategy: JwtDenylist

  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event

  attr_accessor :token

  def on_jwt_dispatch(token, _)
    @token = token.to_s
  end
end
