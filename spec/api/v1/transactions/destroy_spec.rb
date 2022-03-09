require 'rails_helper'

RSpec.describe "transactions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/transactions/#{transaction.id}"
  end

  describe 'basic destroy' do
    let!(:transaction) { create(:transaction) }

    it 'updates the resource' do
      expect(TransactionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Transaction.count }.by(-1)
      expect { transaction.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
