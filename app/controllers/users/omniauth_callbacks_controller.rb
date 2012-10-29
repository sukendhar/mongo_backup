class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    access_token = request.env["omniauth.auth"]
    data = access_token.extra.raw_info    
    provider = access_token.provider
    
    if provider == 'facebook'           
      email =  data.email
      name =  data.name
      first_name =  data.first_name
      last_name =  data.last_name          
      image_path =  access_token.info.image       
      uid =  data.id
    else                                       
      render :text => '--- provider, #{@provider_route}, not supported ---'  
      return
    end
    
    if uid != '' and provider != ''
      auth = User.where(:provider => provider).and(:uid => uid).first        
      #raise auth.inspect
      if !auth.nil?
        flash[:notice] = "Signed in successfully"
        sign_in_and_redirect(:user, auth)
      else         
        user = User.new(:provider => provider, :uid => uid, :email => email, :fname => first_name, :lname => last_name, :image_url => image_path , :token => access_token.credentials.token, :password => Devise.friendly_token[0,20])        
        user.confirm!
        if user.save!
          flash[:notice] = "New user signed in successfully." 
          sign_in_and_redirect(:user, user)          
        else
          redirect_to new_user_registration_path
        end
      end
    end
  end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end

end
