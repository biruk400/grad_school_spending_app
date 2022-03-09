require "rails_helper"

RSpec.describe UpcomingTransactionResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "upcoming_transactions",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UpcomingTransactionResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UpcomingTransaction.count }.by(1)
    end
  end

  describe "updating" do
    let!(:upcoming_transaction) { create(:upcoming_transaction) }

    let(:payload) do
      {
        data: {
          id: upcoming_transaction.id.to_s,
          type: "upcoming_transactions",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UpcomingTransactionResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { upcoming_transaction.reload.updated_at }
      # .and change { upcoming_transaction.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:upcoming_transaction) { create(:upcoming_transaction) }

    let(:instance) do
      UpcomingTransactionResource.find(id: upcoming_transaction.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UpcomingTransaction.count }.by(-1)
    end
  end
end
