class UserSerializer < ApplicationSerializer
  attributes :id, :email, :nickname, :avatar

  def avatar
    file_presenter(:avatar)
  end

end
