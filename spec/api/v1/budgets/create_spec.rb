require 'rails_helper'

RSpec.describe "budgets#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/budgets", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'budgets',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BudgetResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Budget.count }.by(1)
    end
  end
end
