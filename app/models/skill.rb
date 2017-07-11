class Skill < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :userskills
  has_many :users, :through => :userskills
end
