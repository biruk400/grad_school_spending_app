require 'rails_helper'

RSpec.describe "upcoming_transactions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/upcoming_transactions/#{upcoming_transaction.id}", payload
  end

  describe 'basic update' do
    let!(:upcoming_transaction) { create(:upcoming_transaction) }

    let(:payload) do
      {
        data: {
          id: upcoming_transaction.id.to_s,
          type: 'upcoming_transactions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(UpcomingTransactionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { upcoming_transaction.reload.attributes }
    end
  end
end
