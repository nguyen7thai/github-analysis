class GithubAccountsController < ApplicationController
  def index
    @github_accounts = GithubAccount.order(:updated_at)
  end

  def show
    @github_account = GithubAccount.find(params[:id])
    @comments = @github_account.comments.joins(:commit).reject do |comment|
      # debugger if comment.commit == nil
      comment.commit.github_account_ids.include? comment.github_account_id
    end
  end

  def edit
    @github_account = GithubAccount.find(params[:id])
  end

  def update
    @github_account = GithubAccount.find(params[:id])
    @github_account.update_attributes(account_params)
    redirect_to github_accounts_url
  end

  private

  def account_params
    params.require(:github_account).permit(:id, :email)
  end
end
