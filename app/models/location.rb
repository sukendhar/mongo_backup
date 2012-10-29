class Location
  include Mongoid::Document
  field :first_name, :type => String
  field :email, :type => String
  field :phone, :type => String
  field :street_address, :type => String
  field :suburb, :type => String
  field :state, :type => String
  field :postcode, :type => String
  field :map_lat, :type => Float
  field :map_lng, :type => Float
end
