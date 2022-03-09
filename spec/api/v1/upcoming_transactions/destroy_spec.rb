require 'rails_helper'

RSpec.describe "upcoming_transactions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/upcoming_transactions/#{upcoming_transaction.id}"
  end

  describe 'basic destroy' do
    let!(:upcoming_transaction) { create(:upcoming_transaction) }

    it 'updates the resource' do
      expect(UpcomingTransactionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { UpcomingTransaction.count }.by(-1)
      expect { upcoming_transaction.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
