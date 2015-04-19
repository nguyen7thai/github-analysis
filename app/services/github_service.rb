Octokit.auto_paginate = true
GithubService = Octokit::Client.new(access_token: GITHUB_TOKEN[:token])
ORGANIZATION = GITHUB_TOKEN[:organization] || 'EastAgile'

class << GithubService
  # Just get 2 type of comment: pull request comments and commit comments
  # Temporary ignore issues comments
  def repo_comments repo, options = {}
    repo = org_repo_name repo
    self.pull_requests_comments(repo, options) + self.list_commit_comments(repo, options)
  end

  def get_org_repos options = {}
    org_repos ORGANIZATION, options
  end

  def single_commit repo, sha, options = {}
    commit org_repo_name(repo), sha
  end

  private
  def org_repo_name repo
    "#{ORGANIZATION}/#{repo}"
  end
end
