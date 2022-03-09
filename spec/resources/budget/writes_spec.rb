require 'rails_helper'

RSpec.describe BudgetResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'budgets',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BudgetResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Budget.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:budget) { create(:budget) }

    let(:payload) do
      {
        data: {
          id: budget.id.to_s,
          type: 'budgets',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BudgetResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { budget.reload.updated_at }
      # .and change { budget.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:budget) { create(:budget) }

    let(:instance) do
      BudgetResource.find(id: budget.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Budget.count }.by(-1)
    end
  end
end
