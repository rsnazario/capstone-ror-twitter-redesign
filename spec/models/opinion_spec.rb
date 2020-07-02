# rubocop:disable Lint/UselessAssignment

require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'validation tests' do
    let(:userA) { User.create!(username: 'rsnazario', fullname: 'Rafael Nazario') }
    it 'ensures username presence' do
      tweet = userA.thoughts.new(text: nil).save
      expect(tweet).to be false
    end
  end

  context 'association test' do
    let(:userA) { User.create!(username: 'rsnazario', fullname: 'Rafael Nazario') }
    it 'ensures author association' do
      userA
      tweet = userA.thoughts.create(text: 'This is the author association test')
      expect(tweet.author).to eql(userA)
    end
  end

  context 'test scope' do
    it 'checks for descending order scope' do
      user = User.create(username: 'rsnazario', fullname: 'Rafael Nazario')
      post1 = user.thoughts.create(text: 'This is the author association test')
      post2 = user.thoughts.create(text: 'This is the author association test')
      expect(user.thoughts.ordered_by_most_recent.first).to eql(post2)
    end
  end
end

# rubocop:enable Lint/UselessAssignment
