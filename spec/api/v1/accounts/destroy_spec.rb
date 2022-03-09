require 'rails_helper'

RSpec.describe "accounts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/accounts/#{account.id}"
  end

  describe 'basic destroy' do
    let!(:account) { create(:account) }

    it 'updates the resource' do
      expect(AccountResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Account.count }.by(-1)
      expect { account.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
