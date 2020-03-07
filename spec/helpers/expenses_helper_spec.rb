require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ExpensesHelper. For example:
#
# describe ExpensesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ExpensesHelper, type: :helper do
  describe "format_status" do
    let(:status) { "a_hot-messOf-Stuff" }

    it "formats the status correctly" do
      formatted_status = format_status(status)
      expect(formatted_status).to eq("A Hot Mess Of Stuff")
    end
  end
end
