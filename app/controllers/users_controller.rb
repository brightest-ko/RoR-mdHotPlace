class UsersController < ApplicationController
    def index
        @hotfood=Hplace.where(["category =? and ad =?",'food','no']).order("avg_evalu DESC")
        @hotcafe=Hplace.where(["category =? and ad =?",'cafe','no']).order("avg_evalu DESC")
        @hotculture=Hplace.where(["category =? and ad =?",'culture','no']).order("avg_evalu DESC")
        @adhotfood=Hplace.where(["category =? and ad =?",'food','yes']).order("avg_evalu DESC")
        @adhotcafe=Hplace.where(["category =? and ad =?",'cafe','yes']).order("avg_evalu DESC")
        @adhotculture=Hplace.where(["category =? and ad =?",'culture','yes']).order("avg_evalu DESC")
    end 

    def mypage
        if user2_signed_in?
            @myinfos=User2.where(["email = ?",current_user2.email])
            @myinfo=@myinfos.first
        end
    end 

    def mycomment
        if user2_signed_in?
        @mycomments=Comment.where(["user2_id = ?",current_user2.id]).paginate(:page => params[:page],
            :per_page => 10).order('created_at DESC')
        end
    end 

    def mybookmark
        if user2_signed_in?
            @mybookmarks = Bookmark.where(["user2_id = ? ",current_user2.id]).paginate(:page => params[:page],
                :per_page => 10).order('created_at DESC')    
        end        
    end

    def memberpage
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        @users=User2.paginate(:page =>params[:page],:per_page=>10).order('created_at')

        if !params[:search].nil?
        
            if params[:select]=='user_id'    
            @find=User2.where(['user_id LIKE ?',"%#{params[:search]}%"]).paginate(:page =>params[:page],:per_page=>10).order('created_at')  
            redirect_to = users_memberpage_path
            end

            if params[:select]=='user_name'    
                @find=User2.where(['user_name LIKE ?',"%#{params[:search]}%"]).paginate(:page =>params[:page],:per_page=>10).order('created_at')   
                redirect_to = users_memberpage_path
            end

            if params[:select]=='email'    
                    @find=User2.where(['email LIKE ?',"%#{params[:search]}%"]).paginate(:page =>params[:page],:per_page=>10).order('created_at')   
                    redirect_to = users_memberpage_path
            end
            if params[:select]=='phone'    
                @find=User2.where(['phone LIKE ?',"%#{params[:search]}%"]).paginate(:page =>params[:page],:per_page=>10).order('created_at')   
                redirect_to = users_memberpage_path
            end            
            
        end

    end    

    
    def show
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        @detail=User2.find(params[:id])
    end    

    def new
    end    


    def create
        User2.create({user_name: params[:uname],
                     email: params[:uemail],
                     user_id: params[:uid],
                     level: params[:ulevel],
                     phone: params[:uphone],
                     encrypted_password: params[:upassword],
                     password:params[:upassword],
                    user_delete:params[:udelete] })

        redirect_to users_memberpage_path(:page => params[:page])           
    end
    
    def edit
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        @user=User2.find(params[:id])
    end
    
    def update
        uu = User2.find(params[:id])
        uu.update({level:params[:ulevel],
            user_delete:params[:udelete],
            phone:params[:uphone],
            user_name:params[:uuser_name],
            email:params[:uemail],
            user_id:params[:uid]})

        redirect_to users_memberpage_path(:page => params[:page])
        
    end 
    
    def destroy
        @user = User2.find(params[:id])
        @user.destroy
        redirect_to users_memberpage_path(:page => params[:page]), :notice => "영구탈퇴"
     end    


     def mypage_edit
        if !current_user2.nil?
            @myinfos=User2.where(["email = ?",current_user2.email])
            @myinfo=@myinfos.first
        end        

     end
     
     def mypage_update
        m = User2.find(params[:id])
        
        if !params[:mphone].nil?
            m.update(phone:params[:mphone])
        end
       

        if !params[:memail].nil? 
            m.update(email:params[:memail])
        end        
        redirect_to users_mypage_path
     end   
     def userdelete
        m = User2.find(params[:id])
        m.user_delete="destroy"
        m.save
        sign_out(m)  
        redirect_to :root, alert: "탈퇴가 완료되었습니다."
     end   
end


