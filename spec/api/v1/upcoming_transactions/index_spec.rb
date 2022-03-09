require 'rails_helper'

RSpec.describe "upcoming_transactions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/upcoming_transactions", params: params
  end

  describe 'basic fetch' do
    let!(:upcoming_transaction1) { create(:upcoming_transaction) }
    let!(:upcoming_transaction2) { create(:upcoming_transaction) }

    it 'works' do
      expect(UpcomingTransactionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['upcoming_transactions'])
      expect(d.map(&:id)).to match_array([upcoming_transaction1.id, upcoming_transaction2.id])
    end
  end
end
