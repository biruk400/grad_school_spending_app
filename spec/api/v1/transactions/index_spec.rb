require "rails_helper"

RSpec.describe "transactions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/transactions", params: params
  end

  describe "basic fetch" do
    let!(:transaction1) { create(:transaction) }
    let!(:transaction2) { create(:transaction) }

    it "works" do
      expect(TransactionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["transactions"])
      expect(d.map(&:id)).to match_array([transaction1.id, transaction2.id])
    end
  end
end
