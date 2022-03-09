require 'rails_helper'

RSpec.describe "transactions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/transactions/#{transaction.id}", payload
  end

  describe 'basic update' do
    let!(:transaction) { create(:transaction) }

    let(:payload) do
      {
        data: {
          id: transaction.id.to_s,
          type: 'transactions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TransactionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { transaction.reload.attributes }
    end
  end
end
