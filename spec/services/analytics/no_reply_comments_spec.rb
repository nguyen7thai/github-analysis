require 'rails_helper'

describe Analytics::NoReplyComments do

  let(:commit_1) { create :commit }
  let(:commit_2) { create :commit }
  let(:commit_3) { create :commit }

  let!(:comment_1) { create :comment, commit: commit_1, line: 10, file_path: 'file_1' }
  let!(:comment_2) { create :comment, commit: commit_1, line: 10, file_path: 'file_2' }
  let!(:comment_3) { create :comment, commit: commit_2, line: 10, file_path: 'file_1' }
  let!(:comment_4) { create :comment, commit: commit_1, line: 20, file_path: 'file_1' }
  let!(:comment_5) { create :comment, commit: commit_1, line: 20, file_path: 'file_1' }
  let!(:comment_6) { create :comment, commit: commit_3, line: 30, file_path: 'file_1' }


  let(:expected_result) {
    [comment_1, comment_2, comment_3, comment_6]
  }

  subject { Analytics::NoReplyComments.new(Comment.all).call }

  it 'should return list of comments that have no reply' do
  #by calculate comments in 1 line in 1 file of code in 1 commit
    expect(subject).to match_array expected_result
  end

end
