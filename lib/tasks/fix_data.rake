namespace :fix_data do
  desc "Update comment github account base on comment username"
  task :update_commenters => :environment do |t|
    Comment.find_each do |comment|
      p "Update commenter for comment: #{comment.id}"
      comment.github_account = GithubAccount.find_by(username: comment.username)
      comment.save
    end
  end
end
