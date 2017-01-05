class EventSerializer < ApplicationSerializer
  attributes :id, :name, :when, :address, :lat, :lng
end
