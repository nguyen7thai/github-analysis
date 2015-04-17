require 'rails_helper'

describe CommentsController do

  describe 'GET index' do
    let!(:repo) { create :repository }
    let!(:comment_1) { create :comment, repository: repo }
    let!(:comment_2) { create :comment }


    let(:result) { 'result' }
    let(:service) { double(
      call: result
    ) }

    context 'with params repo' do
      subject { get :index, repo: repo.id }

      before do
        expect(Analytics::CommentCount).to receive(:new).with([comment_1]).and_return service
      end

      it 'should return comments analytics for repo' do
        subject
        expect(assigns(:comment_analytics)).to eq result
      end

      it 'should return success' do
        subject
        expect(response).to be_success
      end
    end

    context 'without params repo' do
      subject { get :index }

      before do
        expect(Analytics::CommentCount).to receive(:new).with([comment_1, comment_2]).and_return service
      end

      it 'should return comments analytics for all comments' do
        subject
        expect(assigns(:comment_analytics)).to eq result
      end
    end
  end

end
