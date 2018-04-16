class BookmarksController < ApplicationController


      
    def create
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        if params[:click] == 'bookmark' || 'bookmarks'
            hplace_name=Hplace.find(params[:id]).place_name
            hcategory=Hplace.find(params[:id]).category              
            Bookmark.create(hplace_id:params[:id],
                            user2_id:params[:uid],
                            place_name: hplace_name,
                            category: hcategory,
                            place_delete: "no") 
                if params[:click] == 'bookmark'                    
                redirect_to hplace_path(:id => params[:id],:click=>params[:click])
                end    
                if params[:click] == 'culbookmark'
                    if params[:search].nil?
                    redirect_to hplaces_culture_path(:id => params[:id],:click=>params[:click],:page=>params[:page],:order_by=>params[:order_by])
                    else
                        redirect_to hplaces_culture_path(:order_by=>params[:order_by],:select=>params[:select],:search=>params[:search])    
                    end    
                end
                if params[:click] == 'fodbookmark'
                    if params[:search].nil?
                    redirect_to hplaces_food_path(:id => params[:id],:click=>params[:click],:page=>params[:page],:order_by=>params[:order_by])
                    else
                    redirect_to hplaces_food_path(:order_by=>params[:order_by],:select=>params[:select],:search=>params[:search])    
                    end    
                end
                if params[:click] == 'cafbookmark'
                    if params[:search].nil?
                    redirect_to hplaces_cafe_path(:id => params[:id],:click=>params[:click],:page=>params[:page],:order_by=>params[:order_by])
                    else
                        redirect_to hplaces_cafe_path(:order_by=>params[:order_by],:select=>params[:select],:search=>params[:search])  
                    end    
                end
        end                          
    end


    def destroy
        if params[:page]==''||params[:page].nil?
            @page='1'
        else    
            @page=params[:page]
        end
        d = Bookmark.where(["hplace_id =? and user2_id = ?",params[:id],params[:uid]])
        dd = d.first
        dd.destroy
        if params[:click] == 'foddes'
            if params[:search].nil?
            redirect_to hplaces_food_path(:id => params[:id],:page=>params[:page],:order_by=>params[:order_by])
            else
                redirect_to hplaces_food_path(:order_by=>params[:order_by],:select=>params[:select],:search=>params[:search])
            end         
        elsif params[:click] == 'cafdes'
            if params[:search].nil?
            redirect_to hplaces_cafe_path(:id => params[:id],:page=>params[:page],:order_by=>params[:order_by])
            else
                redirect_to hplaces_cafe_path(:order_by=>params[:order_by],:select=>params[:select],:search=>params[:search])
            end    
        elsif params[:click] == 'culdes'  
            if params[:search].nil?  
            redirect_to hplaces_culture_path(:id => params[:id],:page=>params[:page],:order_by=>params[:order_by])
            else
                redirect_to hplaces_culture_path(:order_by=>params[:order_by],:select=>params[:select],:search=>params[:search])    
            end    
        elsif  params[:click] == 'listdes' 
            redirect_to  users_mybookmark_path(:id => params[:id])
        elsif   params[:click] == 'des' 
            redirect_to hplace_path(:id => params[:id],:page=>params[:page],:order_by=>params[:order_by])
        end    
    end    
end
