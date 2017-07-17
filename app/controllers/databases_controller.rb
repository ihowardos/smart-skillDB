class DatabasesController < ApplicationController
  expose_decorated :user_skill
  expose_decorated :user_skills, -> {fetch_user_skills}

  expose_decorated :skill
  expose_decorated :skills, -> {fetch_skills}

  expose_decorated :user
  expose_decorated :users, -> {fetch_users}

  def index

  end

  private

    def fetch_skills
      skills = Skill.all
      skills = Skill.where("name ILIKE ?", "%#{params[:search]}%") if params[:search]
      skills = Skill.all.order(:name) if params[:order_by] == 'name'
      skills
    end

    def fetch_users
      users = User.all
      users = User.where("name OR surname OR email ILIKE ?", "%#{params[:user]}%") if params[:user]

      if params[:order_by]
        case params[:order_by]
        when 'name'
          users = User.all.order(:name)
        when 'surname'
          users = User.all.order(:surname)
        when 'created at'
          users = User.all.order(:created_at)
        when 'email'
          users = User.all.order(:email)
        end
      end
      users
    end

    def fetch_user_skills
      user_skills = UserSkill.joins(:user).where('user_id = ?', params[:user_id]).order(:user_id) if params[:user_id]
      if params[:skill_id]
        case params[:order_by]
          when 'level-desc'
            user_skills = UserSkill.joins(:skill).where('skill_id = ?', params[:skill_id]).order(level: :desc)
          when 'level-asc'
            user_skills = UserSkill.joins(:skill).where('skill_id = ?', params[:skill_id]).order(:level)
          when nil
            user_skills = UserSkill.joins(:skill).where('skill_id = ?', params[:skill_id])
        end
      end

      user_skills
    end
end
