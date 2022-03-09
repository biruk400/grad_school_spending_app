require 'rails_helper'

RSpec.describe "upcoming_transactions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/upcoming_transactions/#{upcoming_transaction.id}", params: params
  end

  describe 'basic fetch' do
    let!(:upcoming_transaction) { create(:upcoming_transaction) }

    it 'works' do
      expect(UpcomingTransactionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('upcoming_transactions')
      expect(d.id).to eq(upcoming_transaction.id)
    end
  end
end
