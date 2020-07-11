# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new(username: nil, fullname: 'Rafael Nazario').save
      expect(user).to be false
    end

    it 'ensures username length' do
      user = User.new(username: 'rs', fullname: 'Rafael Nazario').save
      expect(user).to be false
    end

    it 'ensures fullname presence' do
      user = User.new(username: 'rsnazario', fullname: nil).save
      expect(user).to be false
    end

    it 'ensures fullname length' do
      user = User.new(username: 'rsnazario', fullname: 'RN').save
      expect(user).to be false
    end

    it 'shoul save successfully' do
      user = User.new(username: 'rsnazario', fullname: 'Rafael Nazario').save
      expect(user).to be true
    end
  end

  context 'associations test' do
    let(:userA) { User.create!(username: 'rsnazario', fullname: 'Rafael Nazario') }
    let(:userB) { User.create!(username: 'crunchy', fullname: 'Crunchy Bacon') }
    let(:friendship1) { userA.follows.create!(followed_id: userB.id) }
    it 'ensures thoughts attached to user' do
      userA
      thought = userA.thoughts.create(text: 'Test for user-opinion association')
      expect(userA.thoughts.first).to eql(thought)
    end

    it 'ensures follows association to friendship model' do
      userA
      userB
      friendship1
      expect(userA.follows.first.followed_id).to eql(userB.id)
    end

    it 'ensures ppl_following returns the users' do
      userA
      userB
      friendship1
      expect(userA.ppl_following.first).to eql(userB)
    end

    it 'ensures followers association to friendship model' do
      userA
      userB
      friendship1
      expect(userB.followers.first.follower_id).to eql(userA.id)
    end

    it 'ensures ppl_followers returns the users' do
      userA
      userB
      friendship1
      expect(userB.ppl_followers.first).to eql(userA)
    end
  end
end

# rubocop:enable Metrics/BlockLength
