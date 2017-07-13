class UserSkillsController < ApplicationController
  expose_decorated :user_skill
  expose_decorated :user_skills, -> {fetch_user_skills}

  def create
    if user_skill.save
      redirect_to user_skill, notice: 'User skill was successfully created.'
    else
      redirect_to root_path
    end
  end


  private
    def user_skill_params
      params.require(:user_skill).permit(:user_id, :skill_id, :level)
    end

    def fetch_user_skills
      user_skills = UserSkill.all
    end
end
