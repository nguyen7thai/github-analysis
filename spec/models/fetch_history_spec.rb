require 'rails_helper'

describe FetchHistory, type: :model do

  describe '.start_fetching' do
    it 'should create a started history with passed type' do
      expect { FetchHistory.start_fetching 'Type' }.to change { FetchHistory.count }.by(1)
      expect(FetchHistory.last.fetch_type).to eq 'Type'
    end
  end

  describe 'mark_as_success' do
    let(:fetch_history) { FetchHistory.start_fetching 'Type' }

    it 'should mark history as success' do
      expect { fetch_history.mark_as_success }.to change { fetch_history.status }.to(FetchHistory::SUCCESS)
    end
  end
end
