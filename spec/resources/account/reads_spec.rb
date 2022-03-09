require 'rails_helper'

RSpec.describe AccountResource, type: :resource do
  describe 'serialization' do
    let!(:account) { create(:account) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(account.id)
      expect(data.jsonapi_type).to eq('accounts')
    end
  end

  describe 'filtering' do
    let!(:account1) { create(:account) }
    let!(:account2) { create(:account) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: account2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([account2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:account1) { create(:account) }
      let!(:account2) { create(:account) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            account1.id,
            account2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            account2.id,
            account1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
