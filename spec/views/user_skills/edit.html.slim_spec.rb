require 'rails_helper'

RSpec.describe "user_skills/edit", type: :view do
  before(:each) do
    @user_skill = assign(:user_skill, UserSkill.create!(
      :user => nil,
      :skill => nil,
      :level => 1
    ))
  end

  it "renders the edit user_skill form" do
    render

    assert_select "form[action=?][method=?]", user_skill_path(@user_skill), "post" do

      assert_select "input#user_skill_user_id[name=?]", "user_skill[user_id]"

      assert_select "input#user_skill_skill_id[name=?]", "user_skill[skill_id]"

      assert_select "input#user_skill_level[name=?]", "user_skill[level]"
    end
  end
end
