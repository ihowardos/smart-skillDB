class UsersSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :user

  validates :level, presence: true
  validates :level, :inclusion => 1..100
end
