  class SkillsController < ApplicationController

  expose_decorated :skill
  expose_decorated :skills, -> { fetch_skills }

<<<<<<< HEAD
  expose :users_skill, -> { UsersSkill.new }



  # POST /skills
  # POST /skills.json
=======
>>>>>>> a3e6186b9d7265d0d1dfe8bb5e8409f5f6ee21e5
  def create
    if skill.save
      redirect_to skill, notice: 'Skill was successfully created.'
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
      skills = skills.where("name ILIKE ?", "%#{params[:search]}%") if params[:search]
      skills
    end

    def skill_params
      params.require(:skill).permit(:name)
    end
end
