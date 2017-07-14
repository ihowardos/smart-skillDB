class UserDecorator < ApplicationDecorator
  delegate_all

  def telephone(user)
    if user.tel.nil?
      "Emty"
    end
  end
end
