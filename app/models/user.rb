class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :users_skills
  has_many :skills, :through => :users_skills

  validates :role, inclusion: {in: :role}

  enum role: {
    user: 'user',
    teacher: 'teacher',
    deanery: 'deanery'
  }

  def get_username
    "#{name} #{surname}"
  end
end
