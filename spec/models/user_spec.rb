require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  RSpec.describe User, type: :model do
    user1_data = { name: 'Fernado', email: 'fernando@example.com', password: 'Secret1',
                   password_confirmation: 'Secret1' }
    invalid_user_data = { name: 'aa', email: '@aa', password: 'pass', password_confirmation: 'Secret1' }
    context 'checking validations for creation' do
      it 'creates valid users' do
        user1 = User.new(user1_data)
        expect(user1.valid?).to eq(false)
      end
      it 'rejects invalid users' do
        invalid_user = User.new(invalid_user_data)
        expect(invalid_user.valid?).to eq(false)
      end
      it 'presents the proper errors for invalid users' do
        invalid_user = User.new(invalid_user_data)
        invalid_user.valid?
        error_msgs = ['Email is invalid',
                      'Password confirmation doesn\'t match Password',
                      'Password is too short (minimum is 6 characters)']
        expect(invalid_user.errors.full_messages).to eq(error_msgs)
      end
      it 'rejects the repetion of an existing user' do
        User.create(user1_data)
        user1 = User.new(user1_data)
        expect(user1.valid?).to eq(false)
      end
      it 'presents the proper error messages for trying to create the same user twice' do
        User.create(user1_data)
        user1 = User.new(user1_data)
        user1.valid?
        expect(user1.errors.full_messages).to eq(['Email has already been taken'])
      end
    end
  end
end
