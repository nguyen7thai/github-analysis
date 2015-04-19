require 'rails_helper'

describe GithubService do
  subject { GithubService }
  let(:repo) { 'Repo' }
  let(:org_repo) { "#{ORGANIZATION}/#{repo}" }

  describe '#get_org_repos' do
    it 'should call org_repos with organization name' do
      expect(GithubService).to receive(:org_repos).with(ORGANIZATION, {})
      GithubService.get_org_repos
    end
  end

  describe '#repo_comments' do
    let(:pull_requests_comments) { ['comment 1', 'comment 2'] }
    let(:commit_comments) { ['comment 3'] }
    let(:extra_params) { { since: DateTime.now } }
    before do
      expect(subject).to receive(:pull_requests_comments).with(org_repo, extra_params).and_return pull_requests_comments
      expect(subject).to receive(:list_commit_comments).with(org_repo, extra_params).and_return commit_comments
    end

    it 'should return sum of results of pull_requests_comments and commit_comments' do
      expect(GithubService.repo_comments repo, extra_params).to eq (pull_requests_comments + commit_comments)
    end
  end

  describe '#single_commit' do
    let(:sha) { '123456789' }
    let(:commit) { double }

    before do
      expect(subject).to receive(:commit).with(org_repo, sha).and_return(commit)
    end

    it 'should call commit with org repo and sha' do
      expect(subject.single_commit repo, sha).to eq commit
    end
  end
end
