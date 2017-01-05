class UserPolicy < ApplicationPolicy

  def update?
    user_is_record
  end

  def show?
    user_is_record
  end

  def password?
    user_is_record
  end

  def register_device?
    user_is_record
  end

  def user_is_record
    @user == @record
  end

end
