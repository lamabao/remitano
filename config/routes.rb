Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'home#index'
   get "user/register"
   get "user/sharemovie"
   get "user/logout"
   post "user/addnewuser"
   post "user/checklogin"
   post "ajax/vocieup"
   post "ajax/vociedown"
end
