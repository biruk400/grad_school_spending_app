require "rails_helper"

RSpec.describe BudgetResource, type: :resource do
  describe "serialization" do
    let!(:budget) { create(:budget) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(budget.id)
      expect(data.jsonapi_type).to eq("budgets")
    end
  end

  describe "filtering" do
    let!(:budget1) { create(:budget) }
    let!(:budget2) { create(:budget) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: budget2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([budget2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:budget1) { create(:budget) }
      let!(:budget2) { create(:budget) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      budget1.id,
                                      budget2.id,
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
                                      budget2.id,
                                      budget1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
