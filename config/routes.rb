Storiesofhealth::Application.routes.draw do
  match '/' => 'home#index'
  match 'about' => 'home#about', :as => :home
  match 'share' => 'home#share', :as => :home
  match 'action' => 'home#action', :as => :home
  match 'stories' => 'home#stories', :as => :home
  match 'trailers' => 'home#trailers', :as => :home
  match 'video/:id' => 'home#video', :as => :home
  match 'v/:id' => 'home#v', :as => :home
  match 'from/:id' => 'home#from', :as => :home
  match 'tag/:id' => 'home#tag', :as => :home
  match 'browser/tag/:id' => 'home#browser', :as => :home, :q => 'tag'
  match 'browser/from/:id' => 'home#browser', :as => :home, :q => 'from'
  match '/:controller(/:action(/:id))'
end
