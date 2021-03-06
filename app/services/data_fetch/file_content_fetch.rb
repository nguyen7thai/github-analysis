module DataFetch
  class FileContentFetch
    include FetchService

    def fetch repo, sha, options = {}
      github_commit = @github_service.single_commit repo.name, sha, options

      repo.commits.create(
        sha: sha,
        committer: github_commit[:committer].try(:fetch, :login) || github_commit[:commit][:committer][:email],
        committed_at: github_commit[:commit][:committer][:date],
        raw_data: github_commit
      )
    end
  end
end
