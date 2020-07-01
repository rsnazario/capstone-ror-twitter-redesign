require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.create(username: 'rsnazario', fullname: 'Rafael Nazario')
      expect(user).to eq(false)
    end

    it 'ensures username length' do
      user = User.create(username: 'rsnazario', fullname: 'Rafael Nazario')
      expect(user).to eq(false)
    end

    it 'ensures fullname presence' do
      user = User.create(username: 'rsnazario', fullname: 'Rafael Nazario')
      expect(user).to eq(false)
    end

    it 'ensures fullname length' do
      user = User.create(username: 'rsnazario', fullname: 'Rafael Nazario')
      expect(user).to eq(false)
    end

    it 'shoul save successfully' do
      user = User.create(username: 'rsnazario', fullname: 'Rafael Nazario')
      expect(user).to eq(false)
    end
  end
  
  context 'scope test' do

  end
end
