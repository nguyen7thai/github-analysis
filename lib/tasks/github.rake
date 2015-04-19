namespace :github do
  desc "Pull repositories data from github"
  task :update_repositories => :environment do |t|
    DataFetch::RepositoryFetch.call
  end

  desc "Pull comments with commits data from github"
  task :update_comments => :environment do |t|
    Repository.includes(:comments).each do |repo|
      p "Update comments for #{repo.name}"
      DataFetch::CommentFetch.schedule_call repo
    end
  end
end
