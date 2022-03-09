require "rails_helper"

RSpec.describe "transactions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/transactions/#{transaction.id}", params: params
  end

  describe "basic fetch" do
    let!(:transaction) { create(:transaction) }

    it "works" do
      expect(TransactionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("transactions")
      expect(d.id).to eq(transaction.id)
    end
  end
end
