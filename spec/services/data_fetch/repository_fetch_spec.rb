require 'rails_helper'

describe DataFetch::RepositoryFetch do
  let(:github_service) {
    double(
      get_org_repos: list_repos
    )
  }
  subject { DataFetch::RepositoryFetch.new(github_service).fetch }

  let(:list_repos) { [
    {
      id: '1',
      name: 'Repo 1'
    },
    {
      id: '2',
      name: 'Repo 2'
    }
  ] }

  context 'repo exists' do
    let!(:existed_repo) { create :repository, github_id: list_repos.first[:id], name: list_repos.first[:name] }

    it 'should not create the existed repo' do
      expect { subject }.to change { Repository.count }.from(1).to(2)
    end
  end

  context 'repo not exists' do
    it 'should create all repo received from service' do
      expect { subject }.to change { Repository.count }.from(0).to(2)
      expect(Repository.pluck(:name)).to match_array ['Repo 1', 'Repo 2']
    end
  end
end
