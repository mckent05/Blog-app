require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'test for the comments mode should pass' do
    new_user = User.new(name: 'Akinlade Temitope', bio: 'simple guy', postscounter: 2)
    new_post = Post.new(author: new_user, text: 'Nice post', commentscounter: 3, likescounter: 5)
    subject do
      Like.new
    end

    before { subject.save }

    it 'should return 4' do
      subject.post = new_post
      subject.author = new_user
      subject.likes_counter_update
      expect(subject.post.likescounter).to be(6)
    end
  end
end
