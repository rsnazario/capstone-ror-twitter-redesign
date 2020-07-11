require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'check associations' do
    let(:userA) { User.create!(username: 'rsnazario', fullname: 'Rafael Nazario') }
    let(:userB) { User.create!(username: 'crunchy', fullname: 'Crunchy Bacon') }
    let(:friendship1) { userA.follows.create!(followed_id: userB.id) }
    it 'checks follower association' do
      userA
      userB
      friendship1
      expect(friendship1.followed).to eql(userB)
    end

    it 'checks followed association' do
      userA
      userB
      friendship1
      expect(friendship1.followed).to eql(userB)
    end
  end
end
