require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let!(:users) { [
      create(:user),
      create(:user)
  ] }

  before(:each) do
    assign(:users, users)
  end

  it "renders a list of users" do
    render

    users.each do |user|
      assert_select "tr>td", :text => user.first_name
      assert_select "tr>td", :text => user.last_name
      assert_select "tr>td", :text => user.email
      assert_select "tr>td", :text => user.birthdate.to_s
    end
  end
end
