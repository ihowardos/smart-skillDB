require 'rails_helper'

RSpec.describe "user_skills/show", type: :view do
  before(:each) do
    @user_skill = assign(:user_skill, UserSkill.create!(
      :user => nil,
      :skill => nil,
      :level => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
