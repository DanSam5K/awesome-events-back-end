class Event < ApplicationRecord
  validates :name, :description, :city, :country, :image, :date_of_event, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, class_name: 'User'
end
