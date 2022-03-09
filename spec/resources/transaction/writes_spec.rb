require 'rails_helper'

RSpec.describe TransactionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'transactions',
          attributes: { }
        }
      }
    end

    let(:instance) do
      TransactionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Transaction.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:transaction) { create(:transaction) }

    let(:payload) do
      {
        data: {
          id: transaction.id.to_s,
          type: 'transactions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TransactionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { transaction.reload.updated_at }
      # .and change { transaction.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:transaction) { create(:transaction) }

    let(:instance) do
      TransactionResource.find(id: transaction.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Transaction.count }.by(-1)
    end
  end
end
