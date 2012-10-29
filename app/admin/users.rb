ActiveAdmin.register User do
  
  actions :all, :except => [:edit, :new]
  
  index do
    column :fname
    column :lname
    column :email    
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do       
      f.input :fname        
      f.input :lname
      f.input :email
      if !f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end      
    f.buttons
  end
  
  show do |ad|
    attributes_table do
      row :fname
      row :lname
      row :email
    end    
  end
    
end
