class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
