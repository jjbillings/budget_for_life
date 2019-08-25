require 'rails_helper'

RSpec.describe Position, type: :model do
  let(:position) { build(:position) }

  describe "value" do
    it "returns the correct value" do
      expect(position.value).to eq(19.98)
    end
  end
end
