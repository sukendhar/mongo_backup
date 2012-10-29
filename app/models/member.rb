class Member
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  #belongs_to :user  
  embedded_in :tribe
  embedded_in :product_group  
  
  field :uid, :type => String
  field :status, :type => String, default: 'thinking'
  field :transaction_history, :type => String
  field :delivery_address, :type => String
end
