require 'rails_helper'

describe Analytics::CommentCount do

  let(:user_1) { 'User_1' }
  let(:user_2) { 'User_2' }
  let(:user_3) { 'User_3' }

  let(:comments) { [
    build(:comment, username: user_1),
    build(:comment, username: user_1),
    build(:comment, username: user_2),
    build(:comment, username: user_1),
    build(:comment, username: user_3),
    build(:comment, username: user_3)
  ] }

  let(:expected_result) { [
    [user_1, 3],
    [user_3, 2],
    [user_2, 1]
  ] }

  subject { Analytics::CommentCount.new(comments).call }

  it 'should cound count comments by user and order by count' do
    expect(subject).to eq expected_result
  end

end
