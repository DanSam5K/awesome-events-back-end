class Attendance < ApplicationRecord
  validates :date, :city, presence: true

  belongs_to :event
  belongs_to :attendee, class_name: 'User'
end
