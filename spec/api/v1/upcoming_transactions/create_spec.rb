require "rails_helper"

RSpec.describe "upcoming_transactions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/upcoming_transactions", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "upcoming_transactions",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(UpcomingTransactionResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { UpcomingTransaction.count }.by(1)
    end
  end
end
