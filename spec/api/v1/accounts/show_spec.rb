require "rails_helper"

RSpec.describe "accounts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/accounts/#{account.id}", params: params
  end

  describe "basic fetch" do
    let!(:account) { create(:account) }

    it "works" do
      expect(AccountResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("accounts")
      expect(d.id).to eq(account.id)
    end
  end
end
