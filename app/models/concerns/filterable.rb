module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.all
      filtering_params.each do |key, value|
        association = results.public_send(key, value) if value.present?
        if association.is_a? ActiveRecord::Relation
          results = association
        end
      end
      results
    end
  end
end
