require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    describe 'name' do
      it 'is must be present' do
        event = described_class.new
        expect(event).to_not be_valid
      end

      it 'is to be string' do
        event = described_class.new
        event.name = 'Dansam'
        expect(event).to_s
      end

      it 'is not valid without a description' do
        event = described_class.new
        event.description = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without an image url' do
        event = described_class.new
        event.image = nil
        expect(event).to_not be_valid
      end
    end
  end
end
