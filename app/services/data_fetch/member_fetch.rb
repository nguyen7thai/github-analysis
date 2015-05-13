module DataFetch
  class MemberFetch
    include FetchService

    def fetch options = {}
      @github_service.all_members.each do |member|
        GithubAccount.find_or_create_by(username: member[:login], github_id: member[:id])
      end
    end
  end
end
