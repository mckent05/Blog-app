require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'test for the comments mode should pass' do
    new_user = User.new(name: 'Akinlade Temitope', bio: 'simple guy', postscounter: 2)
    new_post = Post.new(author: new_user, text: 'Nice post', commentscounter: 3, likescounter: 5)
    subject do
      Comment.new
    end

    before { subject.save }

    it 'should be inavlid because text is nil' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid because of the length of text' do
      subject.text = 'a' * 250
      expect(subject).to_not be_valid
    end

    it 'should return 4' do
      subject.post = new_post
      subject.update_comment_counter
      expect(subject.post.commentscounter).to be(4)
    end
  end
end
