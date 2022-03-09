require 'rails_helper'

RSpec.describe "budgets#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/budgets/#{budget.id}"
  end

  describe 'basic destroy' do
    let!(:budget) { create(:budget) }

    it 'updates the resource' do
      expect(BudgetResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Budget.count }.by(-1)
      expect { budget.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
