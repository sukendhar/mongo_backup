ActiveAdmin.register Product do
  index do
    column :product_name
    column :description
    column :price do |product|
      number_to_currency product.price
    end    
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do       
      f.input :product_name        
      f.input :description
      f.input :price
    end      
    f.buttons
  end
  
  show do |ad|
    attributes_table do
      row :product_name
      row :description
      row :price do |product|
        number_to_currency product.price
      end
    end    
  end
end
