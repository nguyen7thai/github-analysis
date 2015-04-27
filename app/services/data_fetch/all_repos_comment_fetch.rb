module DataFetch
  class AllReposCommentFetch
    include FetchService

    def fetch options
      Repository.includes(:comments).each do |repo|
        p "Update comments for #{repo.name}"
        DataFetch::CommentFetch.call repo, options
      end
    end
  end
end
