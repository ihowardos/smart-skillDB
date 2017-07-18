class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_skills
  has_many :skills, :through => :user_skills

  mount_uploader :photo, PhotoUploader

  validates :role, inclusion: {in: :role}
  validates :tel, phone: true 

  enum role: {
    user: 'user',
    teacher: 'teacher',
    deanery: 'deanery'
  }

  def get_username
    "#{name} #{surname}"
  end
end
