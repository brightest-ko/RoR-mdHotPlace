class HplacesController < ApplicationController
    def cafe
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        if params[:order_by]&&params[:order_by]!=""
            sort_order = params[:order_by]+" DESC"
        else
            sort_order = "avg_evalu DESC"
        end
        
        #byebug
        if params[:search]&&params[:select]!="*"
            if params[:select]=='place_name'    
                @find=Hplace.where(['place_name LIKE ? and category=?',"%#{params[:search]}%", "cafe"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order) 
                redirect_to = hplaces_cafe_path
            end

            if params[:select]=='place_address'    
                @find=Hplace.where(['place_address LIKE ? and category=?',"%#{params[:search]}%", "cafe"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                redirect_to = hplaces_cafe_path
            end

            if params[:select]=='place_call'    
                    @find=Hplace.where(['place_call LIKE ? and category=?',"%#{params[:search]}%", "cafe"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                    redirect_to = hplaces_cafe_path
            end
            if params[:select]=='intro'    
                @find=Hplace.where(['intro LIKE ? and category=?',"%#{params[:search]}%", "cafe"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                redirect_to = hplaces_cafe_path
            end   
        else
            @adcafes=Hplace.where(["category = ? and ad = ?", "cafe","yes"])
            @nonadcafes=Hplace.where(["category = ? and ad = ?", "cafe","no"]).paginate(:page => @page,
                :per_page => 10).order(sort_order)
        end
        if user2_signed_in?
            @cafbook=Bookmark.where(["category = ? and user2_id = ?","cafe",current_user2.id])
        end
    end  
    def culture
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        if params[:order_by]&&params[:order_by]!=""
            sort_order = params[:order_by]+" DESC"
        else
            sort_order = "avg_evalu DESC"
        end
        if params[:search]&&params[:select]!="*"
            if params[:select]=='place_name'    
                @find=Hplace.where(['place_name LIKE ? and category=?',"%#{params[:search]}%", "culture"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order) 
                redirect_to = hplaces_culture_path
            end

            if params[:select]=='place_address'    
                @find=Hplace.where(['place_address LIKE ? and category=?',"%#{params[:search]}%", "culture"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                redirect_to = hplaces_culture_path
            end

            if params[:select]=='place_call'    
                    @find=Hplace.where(['place_call LIKE ? and category=?',"%#{params[:search]}%", "culture"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                    redirect_to = hplaces_culture_path
            end
            if params[:select]=='intro'    
                @find=Hplace.where(['intro LIKE ? and category=?',"%#{params[:search]}%", "culture"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                redirect_to = hplaces_culture_path
            end   

        else
            
            @adcultures=Hplace.where(["category = ? and ad = ?", "culture","yes"])
            @nonadcultures=Hplace.where(["category = ? and ad = ?", "culture","no"]).paginate(:page => @page,
                :per_page => 10).order(sort_order)
                
        end
        if user2_signed_in?
        @culbook=Bookmark.where(["category = ? and user2_id = ?","culture",current_user2.id])
        end
    end  
    def food
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        if params[:order_by]&&params[:order_by]!=""
            sort_order = params[:order_by]+" DESC"
        else 
            sort_order = "avg_evalu DESC"
        end
        if params[:search]&&params[:select]!="*"
            if params[:select]=='place_name'    
                @find=Hplace.where(['place_name LIKE ? and category=?',"%#{params[:search]}%", "food"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order) 
                redirect_to = hplaces_food_path
            end

            if params[:select]=='place_address'    
                @find=Hplace.where(['place_address LIKE ? and category=?',"%#{params[:search]}%", "food"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                redirect_to = hplaces_food_path
            end

            if params[:select]=='place_call'    
                    @find=Hplace.where(['place_call LIKE ? and category=?',"%#{params[:search]}%", "food"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                    redirect_to = hplaces_food_path
            end
            if params[:select]=='intro'    
                @find=Hplace.where(['intro LIKE ? and category=?',"%#{params[:search]}%", "food"]).paginate(:page =>params[:page],:per_page=>10).order(sort_order)
                redirect_to = hplaces_food_path
            end            
        else
            @adfoods=Hplace.where(["category = ? and ad = ?", "food","yes"])
            @nonadfoods=Hplace.where(["category = ? and ad = ?", "food","no"]).paginate(:page => @page,
                :per_page => 10).order(sort_order)
        end
        if user2_signed_in?
            @fodbook=Bookmark.where(["category = ? and user2_id = ?","food",current_user2.id])
        end
    end  
    def show
        @hplace=Hplace.find_by_id(params[:id])
        if !@hplace.nil?
            @hplace.views = @hplace.views+1
            @hplace.save
            if params[:page]==''||params[:page].nil?
                @page='1'
            else    
                @page=params[:page]
            end
            puts params[:click]
            if user2_signed_in? || params[:click] == "updatecomment"
                @click = params[:click]
                @wascomment=Comment.where(["hplace_id = ? and user2_id = ?",params[:id].to_i,current_user2.id])
            end
            #@comments=Comment.where(["hplace_id = ?",params[:id]])
            #.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
            if user2_signed_in?
            b=Bookmark.where(["hplace_id = ? and user2_id = ?",params[:id].to_i,current_user2.id])
            @albookmark=b.first
            end
            
        else
            redirect_back(fallback_location: root_path)
        end
    end 
    
    def edit
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        @hplace=Hplace.find(params[:id])
    end      
    def destroy
        @hplace = Hplace.find(params[:id])
        ctg = @hplace.category
        @hplace.destroy
        @commentsupdate=Comment.where(["hplace_id = ?",params[:id]])
        if !@commentsupdate.nil?
            @commentsupdate.each do |c|
                c.place_delete = "yes"
                c.save
                puts c.place_delete
            end
        end
        
        if ctg =='cafe'            
            redirect_to hplaces_cafe_path(:page => params[:page])
        end
    
        if ctg =='food'            
            redirect_to hplaces_food_path(:page => params[:page])
        end
                
        if ctg =='culture'            
            redirect_to hplaces_culture_path(:page => params[:page])
        end
    end    

    def update
        pp = Hplace.find(params[:id])
        pp.place_name = params[:pname]
        pp.place_address = params[:paddress]
        pp.place_call = params[:pcall]
        pp.optime = params[:poptime]
        pp.site = params[:psite]
        pp.park = params[:ppark]
        pp.ad = params[:pad]
        pp.category = params[:pcategory]
        pp.remarks = params[:premark]
        pp.intro = params[:pintro]
        pp.place_photo1 = params[:photo1]
        pp.place_photo2 = params[:photo2]
        pp.place_photo3 = params[:photo3]
        pp.place_photo4 = params[:photo4]
        pp.place_photo5 = params[:photo5]
        pp.save
        redirect_to hplace_path(:page => params[:page])
    end    



    def new
    end    


    def create
        np = Hplace.create({place_name: params[:pname],
                        place_address: params[:paddress],
                        place_call: params[:pcall],
                        site: params[:psite],
                         optime: params[:poptime],
                          park: params[:ppark],
                          ad: params[:pad],
                          category: params[:pcategory],
                          remarks: params[:premark],
                          place_photo1:params[:photo1],
                          place_photo2:params[:photo2],
                          place_photo3:params[:photo3],
                          place_photo4:params[:photo4],
                          place_photo5:params[:photo5],
                        intro:params[:pintro]
                    })
        if np.category =='cafe'            
        redirect_to hplaces_cafe_path(:page => params[:page])
        end

        if np.category =='food'            
            redirect_to hplaces_food_path(:page => params[:page])
        end
            
        if np.category =='culture'            
        redirect_to hplaces_culture_path(:page => params[:page])
        end    


    end    

    def search
        puts "안녕하세요?"
        if params[:cate] == 'cafe'
            redirect_to hplaces_cafe_path(:select=> "place_name", :search => params[:search])
        elsif  params[:cate] == 'food'
            redirect_to hplaces_food_path(:select=> "place_name", :search => params[:search])
        elsif  params[:cate] == 'culture'
            redirect_to hplaces_culture_path(:select=> "place_name", :search => params[:search])
        end    
    end           
end
