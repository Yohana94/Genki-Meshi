Rails.application.routes.draw do


# # URL /customers/sign_in ...
# devise_for :users,skip: [:passwords], controllers: {
#   registrations: "public/registrations",
#   sessions: 'public/sessions'
# }

# devise_for :admins,skip: [:registrations, :passwords] , controllers: {
#   sessions: "admin/sessions"
# }

root "homes#top"

end
