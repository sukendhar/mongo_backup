class Tribe
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  #validates_associated :products
  
  #validates_presence_of :tribe_name, :message => "Please enter tribe name"
  #validates_presence_of :location, :message => "Please enter tribe location"  
  
  scope :location, where(:location => 'Hyderabad')

  belongs_to :member
  has_many :products
  embeds_many :members
  
  field :tribe_name, :type => String
  field :category, :type => String
  field :location, :type => String  
  field :offers, :type => String
  #field :amount_saved, :type => Integer
  field :created_by, :type => String
  field :members, :type => Array
  field :products, :type => Array
  

  #attr_accessible :tribe_name, :location, :product_name
  
  def self.i_want_this(tribe_id, product_name, uid)    
    product = Product.where(:tribe_id => tribe_id, :product_name => product_name).first    
    members_uid = all_member product
    if !members_uid.include?(uid)
      product.members.push([Member.new(:uid => uid, :status => 'accepted')])      
    end
  end

  
  def self.all_member product
    members_uid = []
    product.members.each do |each_member|
      members_uid.push(each_member.uid)
    end
    return members_uid
  end
  
 
   
  def self.search(search)
    if search
      
      where('tribe_name ?LIKE'  => "%#{search}%")
      #Tribe.find_by_tribe_name!('Tribe_name')
     #find(:all, :conditions =>['tribe.tribe_name LIKE ?', "%#{params[:search]}%"])
    
     
    else
      find(:all)
    end
  end


end
