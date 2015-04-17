require 'rails_helper'

def github_comment
  {
    id: Faker::Number.number(3),
    user: {
      login: Faker::Internet.user_name
    },
    body: Faker::Lorem.sentence,
    line: Faker::Number.number(1),
    position: Faker::Number.number(1)
  }
end

describe DataFetch::CommentFetch do
  let!(:repo) { create :repository }
  let(:github_service) { double 'github_service' }
  let(:github_comment_1) { github_comment }
  let(:github_comment_2) { github_comment }

  let(:github_commit) { {
    sha: '123456',
    committer: {
      login: 'username'
    },
    commit: {
      committer: {
        date: DateTime.now
      }
    }
  } }

  before do
    allow(github_service).to receive(:repo_comments).with(repo.name, {}).and_return(comments_list)
  end

  context 'commit exists' do
    let(:comments_list) { [
      github_comment_1
    ] }
    let!(:commit) { create :commit, repository: repo, sha: github_comment_1[:sha] }
    subject { DataFetch::CommentFetch.new(github_service).fetch(repo) }

    it 'should create a comment from github for existed commit' do
      expect { subject }.to change { repo.comments.count }.by 1
    end

    it 'should not create a new commit' do
      expect { subject }.to change { Commit.count }.by 0
    end
  end

  context 'commit not exitst' do
    let(:comments_list) { [
      github_comment_1, github_comment_2
    ] }

    let(:commit) { create :commit }

    before do
      expect(DataFetch::CommitFetch).to receive(:call).and_return(commit).twice
    end

    subject { DataFetch::CommentFetch.new(github_service).fetch(repo) }

    it 'should create a comment and commit for the repo' do
      expect { subject }.to change { repo.comments.count }.by 2
    end
  end

end
