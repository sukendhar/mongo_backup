module TribesHelper
  def no_of_wants(tribe_id, product_name, uid)    
    product = Product.where(:tribe_id => tribe_id, :product_name => product_name).first    
    members_uid = []
    product.members.each do |each_member|
      members_uid.push(each_member.uid)
    end
    return members_uid 
  end 
  
  def total_tribe_member(tribe)
    return tribe.members.count.size
  end
end
