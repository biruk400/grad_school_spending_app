require 'rails_helper'

RSpec.describe "budgets#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/budgets/#{budget.id}", payload
  end

  describe 'basic update' do
    let!(:budget) { create(:budget) }

    let(:payload) do
      {
        data: {
          id: budget.id.to_s,
          type: 'budgets',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BudgetResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { budget.reload.attributes }
    end
  end
end
