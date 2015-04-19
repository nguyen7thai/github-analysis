module DataFetch
  class RepositoryFetch
    include FetchService

    def fetch options = {}
      @github_service.get_org_repos(options).each do |repo|
        Repository.find_or_create_by(github_id: repo[:id], name: repo[:name]) do |r|
          r.raw_data = repo
        end
      end
    end
  end
end
