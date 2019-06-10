require 'rails_helper'

RSpec.describe Note, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:inputs) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
