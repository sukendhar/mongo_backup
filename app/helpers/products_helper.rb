module ProductsHelper
  def people(zipcode)
    @group_details = Product.all.first
    @group_details.product_groups.each do |each_product_group|
      if each_product_group.zipcode == zipcode
        return each_product_group.members.count 
      end
    end
  end
  
  def no_of_offers(zipcode)
    return 5
  end
  
  def is_member(zipcode,current_uesr_uid)
    @all_member = []
    @group_details = Product.all.first
    @group_details.product_groups.each do |each_product_group|
      if each_product_group.zipcode == zipcode
        each_product_group.members.each do |each_member| 
          @all_member.push(each_member.uid)
        end
      end
    end
    return @all_member.include?(current_uesr_uid)
  end
end
