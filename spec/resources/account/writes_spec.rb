require "rails_helper"

RSpec.describe AccountResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "accounts",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AccountResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Account.count }.by(1)
    end
  end

  describe "updating" do
    let!(:account) { create(:account) }

    let(:payload) do
      {
        data: {
          id: account.id.to_s,
          type: "accounts",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AccountResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { account.reload.updated_at }
      # .and change { account.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:account) { create(:account) }

    let(:instance) do
      AccountResource.find(id: account.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Account.count }.by(-1)
    end
  end
end
