ActiveAdmin.register Tribe do
  
  scope :location
  
  index do
    column "Tribe name", :tribe_name
    column :location
    column :category
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do       
      f.input :tribe_name        
      f.input :location
      f.input :category
    end      
    f.buttons
  end
  
  #show do
  #  panel "Product" do      
  #    table_for tribe.products do
  #      column "product_name"
  #      column "description"
  #      column "price" do |product|
  #        number_to_currency product.price
  #      end
  #      column "created_at"
  #    end
  #  end
  #end
  
  show do |tribe|
    panel "Tribe details" do
      attributes_table_for tribe, :tribe_name, :location, :category
    end
    
    panel("Products for this tribe") do
      table_for(tribe.products) do
        column "Product" do |product| 
          product.product_name          
        end
        column "Description" do |product|           
          product.description          
        end
        column "Price" do |product|           
          number_to_currency product.price
        end  
      end
    end

    panel("Members for this tribe") do
      table_for(tribe.members) do
        column "Member" do |member| 
          member.uid          
        end
        column "Status" do |member| 
          member.status          
        end          
      end
    end
    
  end

end
