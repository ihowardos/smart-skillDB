class UserSkillsController < ApplicationController
  expose_decorated :user_skill
  expose_decorated :user_skills, -> {fetch_user_skills}

  def create
    user_skill.save
  end


  private
    def user_skill_params
      params.require(:user_skill).permit(:user_id, :skill_id, :level)
    end

    def fetch_user_skills
      user_skills = UserSkill.all
      user_skills = UserSkill.where('user_id = ?', params[:user_id]) if params[:user_id]
      user_skills
    end
end
