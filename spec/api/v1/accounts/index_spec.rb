require 'rails_helper'

RSpec.describe "accounts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/accounts", params: params
  end

  describe 'basic fetch' do
    let!(:account1) { create(:account) }
    let!(:account2) { create(:account) }

    it 'works' do
      expect(AccountResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['accounts'])
      expect(d.map(&:id)).to match_array([account1.id, account2.id])
    end
  end
end
