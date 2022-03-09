require "rails_helper"

RSpec.describe "budgets#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/budgets/#{budget.id}", params: params
  end

  describe "basic fetch" do
    let!(:budget) { create(:budget) }

    it "works" do
      expect(BudgetResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("budgets")
      expect(d.id).to eq(budget.id)
    end
  end
end
