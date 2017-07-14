  class SkillsController < ApplicationController

  expose_decorated :skill
  expose_decorated :skills, -> { fetch_skills }


  expose_decorated :user_skill, -> { UserSkill.new }

  def create
    if skill.save
      redirect_to skills_path
    else
      render :new
    end
  end

  def update
    if skill.update(skill_params)
      redirect_to skill, notice: 'Skill was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    skill.destroy
    redirect_to skills_url, notice: 'Skill was successfully destroyed.'
  end

  private

    def fetch_skills
      skills = Skill.all
      skills = Skills.where("name ILIKE ?", "%#{params[:search]}%") if params[:search]
      skills
    end

    def skill_params
      params.require(:skill).permit(:name)
    end
end
