require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:budgets) }

    it { should have_many(:transactions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
