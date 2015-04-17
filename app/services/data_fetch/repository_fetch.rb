module DataFetch
  class RepositoryFetch
    include ServiceFetch

    def fetch
      @github_service.get_org_repos.each do |repo|
        Repository.find_or_create_by(github_id: repo[:id], name: repo[:name]) do |r|
          r.raw_data = repo
        end
      end
    end
  end
end
