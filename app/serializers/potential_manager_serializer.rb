class PotentialManagerSerializer < ApplicationSerializer
  attributes :id, :email, :name, :property_relation, :phone, :avatar

  def avatar
    file_presenter(:avatar)
  end

end
