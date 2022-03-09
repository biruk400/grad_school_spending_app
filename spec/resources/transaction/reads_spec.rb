require "rails_helper"

RSpec.describe TransactionResource, type: :resource do
  describe "serialization" do
    let!(:transaction) { create(:transaction) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(transaction.id)
      expect(data.jsonapi_type).to eq("transactions")
    end
  end

  describe "filtering" do
    let!(:transaction1) { create(:transaction) }
    let!(:transaction2) { create(:transaction) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: transaction2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([transaction2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:transaction1) { create(:transaction) }
      let!(:transaction2) { create(:transaction) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      transaction1.id,
                                      transaction2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      transaction2.id,
                                      transaction1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
