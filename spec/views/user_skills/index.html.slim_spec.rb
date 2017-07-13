require 'rails_helper'

RSpec.describe "user_skills/index", type: :view do
  before(:each) do
    assign(:user_skills, [
      UserSkill.create!(
        :user => nil,
        :skill => nil,
        :level => 2
      ),
      UserSkill.create!(
        :user => nil,
        :skill => nil,
        :level => 2
      )
    ])
  end

  it "renders a list of user_skills" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
