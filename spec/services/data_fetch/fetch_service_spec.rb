require 'rails_helper'

class SampleFetchService
  include DataFetch::FetchService
  def fetch param, options
    'Fetch Result'
  end
end

describe SampleFetchService do
  subject { SampleFetchService }
  let(:service) { SampleFetchService.new }

  describe '.schedule_call' do
    let(:param) { 'param' }

    before do
      expect(SampleFetchService).to receive(:new).and_return(service)
    end

    it 'should log history when fetch' do
      expect { subject.schedule_call(param, {}) }.to change { FetchHistory.count }.by(1)
      expect(FetchHistory.last.status).to eq FetchHistory::SUCCESS
    end

    context 'not first time fetch' do
      let(:last_fetch_time) { DateTime.now }
      let!(:history) { FetchHistory.create(fetch_type: SampleFetchService.name, finished_at: last_fetch_time, status: FetchHistory::SUCCESS) }
      it 'should call fetch with extra params since' do
        expect(service).to receive(:fetch).with param, { since: last_fetch_time }
        subject.schedule_call(param, {})
      end
    end
  end
end
