require 'rails_helper'

describe RepositoriesController do

  describe 'GET index' do
    let!(:repo) { create :repository }

    subject { get :index }

    it 'should assign variables and return success' do
      subject
      expect(assigns[:list_repos]).to eq Repository.all
      expect(response).to be_success
    end
  end
end
