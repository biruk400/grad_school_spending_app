require 'rails_helper'

RSpec.describe "accounts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/accounts/#{account.id}", payload
  end

  describe 'basic update' do
    let!(:account) { create(:account) }

    let(:payload) do
      {
        data: {
          id: account.id.to_s,
          type: 'accounts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AccountResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { account.reload.attributes }
    end
  end
end
