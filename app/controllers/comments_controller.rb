class CommentsController < ApplicationController
    def create
        
        h=Hplace.find(params[:place_id])
        hplace_name=h.place_name
        hcategory=h.category
        if Comment.create({hplace_id: params[:place_id],
                        place_name: hplace_name,
                        category: hcategory,
                        place_delete: params[:place_delete],
                        user2_id: params[:user2_id],
                        user_id: params[:user_id],
                        content: params[:content],
                        evalu: params[:evalu]})
        cc = Comment.where({hplace_id: params[:place_id]}).count.to_f
        avg = (h.avg_evalu.to_f*(cc-1)+params[:evalu].to_f)/cc
        h.avg_evalu = avg
        h.reviewcount = h.reviewcount+1
        h.save
        
        respond_to do |format|
            format.js
            #format.html은 잘됨
        end
        else
            redirect_to hplace_path(:id => params[:place_id])
        end
    end
    
    def update
        c = Comment.find(params[:id])
        c.content = params[:content]
        c.evalu = params[:evalu]
        c.save
        h=Hplace.find(params[:hplace_id])
        cc = Comment.where({hplace_id: params[:hplace_id]}).count.to_f
        avg = (h.avg_evalu.to_f*(cc-1)+params[:evalu].to_f)/cc
        h.avg_evalu = avg
        h.save
        redirect_to hplace_path(:id => params[:hplace_id])
    end
    def destroy

        c = Comment.find(params[:id])

        h=Hplace.find(params[:hplace_id])
        h.reviewcount = h.reviewcount-1

        cc = Comment.where({hplace_id: params[:hplace_id]}).count.to_f
        evalu= c.evalu.to_f
        if (cc-1)!=0
            avg = (h.avg_evalu.to_f*cc-evalu)/(cc-1)
        else
            avg =0
        end
        h.avg_evalu = avg
        h.save

        c.destroy
        redirect_to hplace_path(:id => params[:hplace_id])
    end
    
end
