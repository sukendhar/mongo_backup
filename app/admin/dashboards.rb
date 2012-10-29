ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  
  section "All Tribes" do
    table_for Tribe.all.collect do |tribe|
      column :tribe_name do |tribe|
        link_to tribe.tribe_name, [:admin, tribe]
      end
      column :location
      column :category      
    end
    strong( link_to "View all Tribes", admin_tribes_path)    
  end
   
  section "All Products" do
    ul do
      Product.all.collect do |product|
        li link_to(product.product_name, admin_product_path(product))
      end
     end
  end
  
  section "All Users" do
    table_for User.all.collect do |user|
      column "First name", :fname do |user|
        link_to user.fname, [:admin, user]
      end
      column "Last name", :lname
      column :email      
    end
    strong( link_to "View all Users", admin_users_path)
  end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
