require "rails_helper"

RSpec.describe UpcomingTransactionResource, type: :resource do
  describe "serialization" do
    let!(:upcoming_transaction) { create(:upcoming_transaction) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(upcoming_transaction.id)
      expect(data.jsonapi_type).to eq("upcoming_transactions")
    end
  end

  describe "filtering" do
    let!(:upcoming_transaction1) { create(:upcoming_transaction) }
    let!(:upcoming_transaction2) { create(:upcoming_transaction) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: upcoming_transaction2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([upcoming_transaction2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:upcoming_transaction1) { create(:upcoming_transaction) }
      let!(:upcoming_transaction2) { create(:upcoming_transaction) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      upcoming_transaction1.id,
                                      upcoming_transaction2.id,
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
                                      upcoming_transaction2.id,
                                      upcoming_transaction1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
