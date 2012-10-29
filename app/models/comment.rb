class Comment
  include Mongoid::Document
  embedded_in :product
  
  field :user_id, :type => String
  field :body, :type => String
end
