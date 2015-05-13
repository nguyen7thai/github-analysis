namespace :github do
  desc "Pull repositories data from github"
  task :update_repositories => :environment do |t|
    DataFetch::RepositoryFetch.call
  end

  desc "Pull comments with commits data from github"
  task :update_comments => :environment do |t|
    DataFetch::AllReposCommentFetch.schedule_call({})
  end

  desc "Update author for commit"
  task :update_commit_author => :environment do |t|
    Commit.find_each do |commit|
      Analytics::FindCommitAuthor.new(commit).call
    end
  end
end

