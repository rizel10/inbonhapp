class ApplicationSerializer < ActiveModel::Serializer

  def file_presenter(attr_name)
    object.send(attr_name).present? ? object.send(attr_name).url : nil
  end
  
end
