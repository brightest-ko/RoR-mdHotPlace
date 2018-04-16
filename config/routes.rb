Rails.application.routes.draw do

  devise_for :user2s

  get "hplaces/cafe"
  get "hplaces/culture"
  get "hplaces/food"
  get "hplaces/search"
  resources :hplaces do
    resources :comments
  end

  resources :comments

  get "users/mypage"
  get "users/mycomment"
  get "users/memberpage"
  get "users/userdelete"
  get "users/mybookmark"

  get "users/:id/mypage_edit" => 'users#mypage_edit'
  post "users/mypage/:id" =>'users#mypage_update'
  resources :users

  #post "comments/create"
  #post "comments/update"
  #post "comments/destroy"

  get "bookmarks/create/:uid/:id" => 'bookmarks#create'
  get "bookmarks/destroy/:uid/:id" => 'bookmarks#destroy'

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
