require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'Validations' do
    describe 'attendance not be valid becuase event must exist' do
      it 'is must be present' do
        attendance = described_class.new
        expect(attendance).to_not be_valid
      end

      it 'city of attendance expected to be string' do
        attendance = described_class.new
        attendance.city = 'Lagos'
        expect(attendance).to_s
      end

      it 'Date of attendance expected to be a string' do
        attendance = described_class.new
        attendance.date = '02/02/2021'
        expect(attendance).to_s
      end

      it 'is not valid without city of attendance' do
        attendance = described_class.new
        attendance.city = nil
        expect(attendance).to_not be_valid
      end

      it 'is not valid without a date of attendance' do
        attendance = described_class.new
        attendance.date = nil
        expect(attendance).to_not be_valid
      end
    end
  end
end
