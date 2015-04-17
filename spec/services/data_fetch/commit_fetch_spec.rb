require 'rails_helper'

describe DataFetch::CommitFetch do
  let(:github_service) { double 'github' }
  let!(:repo) { create :repository }

  context 'commit not exists' do
    let(:date) { DateTime.now }
    let(:commit) { {
      sha: '123456',
      committer: {
        login: 'username'
      },
      commit: {
        committer: {
          date: date
        }
      }
    } }

    before do
      allow(github_service).to receive(:single_commit).and_return(commit)
    end

    subject { DataFetch::CommitFetch.new(github_service).fetch(repo, sha: commit[:sha], repository_id: repo.id) }

    it 'should create new commit for repository' do
      expect { subject }.to change { repo.commits.count }.from(0).to(1)
      expect(Commit.last.committer).to eq 'username'
    end

  end
end
