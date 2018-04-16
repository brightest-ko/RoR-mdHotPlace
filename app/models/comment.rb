class Comment < ApplicationRecord

    belongs_to:user2
    belongs_to :hplace, optional: true
    
    validates:hplace_id, presence:true
    validates:place_name, presence:true
    validates:category, presence:true

    validates:user2_id, presence:true
    validates:user_id, presence:true
    validates:content, presence:true
    validates:evalu, presence:true
    
end
