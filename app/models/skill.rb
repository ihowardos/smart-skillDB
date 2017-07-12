class Skill < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :users_skills
  has_many :users, :through => :users_skills
end
