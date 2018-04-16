# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |x|
    Hplace.create({place_name: "lucy 카페", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00",
        category: "cafe", ad: "yes", intro: "디져트 카페", views: 0})
end
Hplace.create({place_name: "a 카페", place_address: "경기도 고양시 일산동구 마두1동",
    place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00",
    category: "cafe", ad: "yes", intro: "디져트 카페", views: 0})
3.times do |x|    
Hplace.create({place_name: "nonad카페", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00",
        category: "cafe", ad: "no", intro: "디져트 카페", views: 0})
end        
25.times do |x|
    Hplace.create({place_name: "안 광고 문화동산", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
        category: "culture", ad: "no", intro: "양식전문점", views: 0, reviewcount:0, avg_evalu: 0})
end
Hplace.create({place_name: "평점 좋은 안 광고 문화동산", place_address: "경기도 고양시 일산동구 마두1동",
    place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
    category: "culture", ad: "no", intro: "파스타, 스테이크 전문점", views: 0, reviewcount:0, avg_evalu:0})
Hplace.create({place_name: "평점 안좋은 안 광고 문화동산", place_address: "경기도 고양시 일산동구 마두1동",
    place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
    category: "culture", ad: "no", intro: "중식 전문점", views: 0, reviewcount:0, avg_evalu:0})
10.times do |x|    
Hplace.create({place_name: x.to_s+"영화관", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
        category: "culture", ad: "yes", intro: "중식 전문점", views: 0, reviewcount:0, avg_evalu:0})    
end   


2.times do |x|
    Hplace.create({place_name: "놀부부대찌개", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
        category: "food", ad: "yes", intro: "중식 전문점", views: 0})
end 
3.times do |x|
    Hplace.create({place_name: "꿀맛부대찌개", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
        category: "food", ad: "yes", intro: "중식 전문점", views: 0})
end 
31.times do |x|
    Hplace.create({place_name: "진짜 김치 부대찌개", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
        category: "food", ad: "no", intro: "중식 전문점", views: 0})
end 
31.times do |x|
    Hplace.create({place_name: "놀부 김치 찌개", place_address: "경기도 고양시 일산동구 마두1동",
        place_call: "031-0000-0000", site: "www.naver.com", optime: "평일 11:00~12:00", 
        category: "food", ad: "no", intro: "중식 전문점", views: 0})
end




User2.create({email: "admin@admin.com", user_id: "lovehero", phone: "01023222769",
            level: "admin" , password: "123456", password_confirmation: "123456", 
            user_delete: "no", user_name: "관리자"})


20.times do |x|
User2.create({email: x.to_s+"project@admin.com", user_id: "stayes"+x.to_s, phone: "01023222769",
        level: "user" , password: "123456", password_confirmation: "123456", 
        user_delete: "no", user_name: "황"+x.to_s})    
end