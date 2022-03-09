require "rails_helper"

RSpec.describe "budgets#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/budgets", params: params
  end

  describe "basic fetch" do
    let!(:budget1) { create(:budget) }
    let!(:budget2) { create(:budget) }

    it "works" do
      expect(BudgetResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["budgets"])
      expect(d.map(&:id)).to match_array([budget1.id, budget2.id])
    end
  end
end
