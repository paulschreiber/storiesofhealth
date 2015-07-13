Storiesofhealth::Application.routes.draw do
  get '/' => 'home#index'
  get 'about' => 'home#about'
  get 'share' => 'home#share'
  get 'action' => 'home#action'
  get 'stories' => 'home#stories'
  get 'trailers' => 'home#trailers'
  get 'video/:id' => 'home#video'
  get 'v/:id' => 'home#v'
  get 'from/:id' => 'home#from'
  get 'tag/:id' => 'home#tag'
  get 'browser/tag/:id' => 'home#browser', :q => 'tag'
  get 'browser/from/:id' => 'home#browser', :q => 'from'
  get '/:controller(/:action(/:id))'
end
