class Hplace < ApplicationRecord

    mount_uploader :place_photo1, ImageUploader 
    mount_uploader :place_photo2, ImageUploader 
    mount_uploader :place_photo3, ImageUploader 
    mount_uploader :place_photo4, ImageUploader 
    mount_uploader :place_photo5, ImageUploader 

    has_many:comments
    has_many:bookmarks

    validates:place_name, presence:true
    validates:place_address, presence:true
    validates:place_call, presence:true
    validates:optime, presence:true
    validates:ad, presence:true
    validates:category, presence:true
    validates:intro, presence:true
    
    def init
        self.views  ||= 0      #will set the default value only if it's nil
        self.reviewcount ||= 0 #let's you set a default association
        self.avg_evalu ||= 0
    end
end
