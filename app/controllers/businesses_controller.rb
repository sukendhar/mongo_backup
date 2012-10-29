class BusinessesController < ApplicationController
  skip_before_filter :authenticate_user!  
  def index
    @businesses = Business.find(:all)
    
  end

  def show
    
    @business = Business.find(params[:id])
    #raise @business.user_id.inspect
    @user = User.where("_id" => @business.user_id)
    #@user.each do |each_details|
     # raise each_details.fname.inspect
    #end
    
  end

  def new 
    @business = Business.new    
  end

  def edit
    @business = Business.find(params[:id])
    #raise @business.website.inspect
    #raise @business.user.email.inspect
    @user = User.where("_id" => @business.user_id)
    #@business.user_id
    #@user.each do |each_details|
     # raise each_details.fname.inspect
    #end
    
  end

  def create
    #raise params.inspect
    @user = User.new(:fname => params[:fname], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :role => "business")        
    if @user.save
      @user.businesses.create!(:website => params[:website])
      redirect_to @user, notice: 'Business was successfully created.'
    else
      render action: "new" 
    end
  end
  
  def update
    @business = Business.find(params[:id])
    
   #@business = Business.edit(:business_name => params[:fname], :business_email => params[:email])        
   @user = User.where("_id" => @business.user_id)
      if @business.update_attributes(params[:business])
        redirect_to @business, notice: 'Business was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  
  def destroy
    @business = Business.find(params[:id])
    @business.destroy
     redirect_to businesses_url 
  end  
  def business_signup
    
  end
end