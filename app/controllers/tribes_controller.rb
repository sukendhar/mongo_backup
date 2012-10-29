class TribesController < ApplicationController

  def index
    
   @tribes = Tribe.search(params[:search])
   
  end
  
  
  def show                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    @tribe = Tribe.find(params[:id])
    @invitee_uid = []
    if !@tribe.members.blank?
      @tribe.members.each do |each_member|
        @invitee_uid.push(each_member.uid)
      end
    end    
  end
  
  def new
    @tribe = Tribe.new
    @tribe.products.build
  end

  def edit
    @tribe = Tribe.find(params[:id])
  end

  def create     
    @tribe = Tribe.new(params[:tribe])     
    if @tribe.save      
      @tribe.members.push(Member.new(:status => 'accepted', :uid => current_user.uid))
      if !params[:invitees].blank? 
        invitee_list = params[:invitees].split(",")      
        invitee_list.each do |each_invitee_uid|        
          @tribe.members.push(Member.new(:uid => each_invitee_uid))
        end
      end      
      @tribe.products.create(:product_name => params[:product_name], :members => [Member.new(:uid => current_user.uid)])
      redirect_to my_tribe_tribes_path, notice: 'Tribe was successfully created.'
    else      
      render action: "new"
    end
  end

  def update
    @tribe = Tribe.find(params[:id])

    if @tribe.update_attributes(params[:tribe])
      redirect_to @tribe, notice: 'Tribe was successfully updated.'
    else
      render action: "edit"
    end
    
  end

  def destroy
    @tribe = Tribe.find(params[:id])
    @tribe.destroy
    redirect_to tribes_path
  end
  
  def change_invitation_status
    @tribe = Tribe.where(:_id => params[:id]).first
    @tribe.members.each do |each_member|      
        if each_member.uid == params[:uid]
          each_member.update_attributes(:status => 'accepted')
        end
    end
    redirect_to my_tribe_tribes_path
  end
  
  def my_tribe    
    @tribes = Tribe.where('members.uid' => current_user.uid)
  end
  
  def tribe_products
    if params[:product_name]      
      @tribe = Tribe.where(:_id => params[:id]).first
      Tribe.i_want_this(params[:id], params[:product_name], current_user.uid)      
    else
      @tribe = Tribe.where(:_id => params[:id]).first
    end
  end
  
  def invite_friend
    @tribe = Tribe.where(:tribe_id => params[:tribe_id]).first
      if !params[:invitees].blank?
          invitee_list = params[:invitees].split(",")
          invitee_list.each do |each_invitee_uid|
            @tribe.members.push([Member.new(:uid => each_invitee_uid)])
      end
      else
      end
      redirect_to my_tribe_tribes_path
  end
  def solar
    
  end
  
  
  #def i_want_this    
  #  product = Product.where(:tribe_id => params[:tribe_id]).first
  #  product.members.push([Members.new(:uid => current_user.uid, :status => 'accepted')])
  #  raise "maisa"
  #end
    
end
