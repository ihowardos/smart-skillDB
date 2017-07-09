class Skill < ApplicationRecord
  validates :name, :level, presence: true
  validates :name, uniqueness: true
end
