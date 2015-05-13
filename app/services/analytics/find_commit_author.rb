module Analytics
  class FindCommitAuthor
    DOMAIN = '@eastagile.com'

    def initialize(commit)
      @commit = commit
    end

    def call
      begin
        p "update author for commit #{@commit.id}"
        author = @commit.author
        author_names = author[:name].delete(' ').split('+')
        author_emails = author[:email].delete(' ').downcase.gsub(DOMAIN, '').split('+')
        github_accounts = []
        if author_names.size <= author_emails.size
          # use emails field
          emails = author_emails.map { |e| "#{e}#{DOMAIN}" }
          github_accounts = GithubAccount.where(email: emails)
        else
          # use names field
          author_names.map! do |name|
            "#{name.delete('.').downcase}%"
          end
          github_accounts = GithubAccount.where{name.like_any author_names}
        end

        @commit.github_accounts = github_accounts
        @commit.save
      rescue
        p "Cannot find author for commit: ##{@commit.id}"
      end
    end
  end
end
