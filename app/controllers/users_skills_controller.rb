class UsersSkillsController < ApplicationController

  expose_decorated :users_skill
  expose_decorated :users_skills

  def create
    users_skills = UsersSkill.new(users_skill_params)
    if users_skills.save
      redirect_to skills_path
    end
  end

  private

  def users_skill_params
    params.require(:users_skill).permit(:user_id, :skill_id, :level )
  end
end
