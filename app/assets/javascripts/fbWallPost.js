(function($) {
    $.triballyWallPost ={
        renderFbWallPost : function(){            
            //window.fbAsyncInit();            
            var obj = {
                    method: 'feed',
                    link: 'http://www.tribally-new.herokuapp.com',
                    picture: 'http://fbrell.com/f8.jpg',
                    name: 'Tribally',
                    caption: 'Save money',
                    description: 'Become part of tribe and save money'
            };

            function callback(response) 
            {
               document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
               session_destroy() ;
               $.cookie('isNewChallenge', null); 
            }

            FB.ui(obj, callback);
	}
    }	
})(jQuery);		

