namespace :github do
  desc "Pull repositories data from github"
  task :update_repositories => :environment do |t|
    DataFetch::RepositoryFetch.call
  end

  desc "Pull comments with commits data from github"
  task :update_comments => :environment do |t|
    DataFetch::AllReposCommentFetch.schedule_call({})
  end
end
