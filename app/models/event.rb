class Event < ApplicationRecord
  validates :name, :description, :image, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, class_name: 'User'
end
