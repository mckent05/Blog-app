require 'rails_helper'

RSpec.describe User, type: :model do
  context 'test for the User mode should pass' do
    subject do
      User.new
    end

    before { subject.save }

    it 'should return nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should return nil' do
      subject.postscounter = nil
      expect(subject).to_not be_valid
    end

    it 'should return nil' do
      subject.postscounter = 2.5
      expect(subject).to_not be_valid
    end

    describe 'User model should pass' do
      before { 6.times { |_post| Post.new(author: subject, title: 'testing', text: 'just testing') } }
      it 'should pass these test' do
        expect(subject.recent3_posts).to eq(subject.posts.last(3))
      end
    end
  end
end
