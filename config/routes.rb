WeThePeople::Application.routes.draw do
  
	root :to => 'speeches#index'
	get '/about' => 'about#index'
  	resources :speeches

end
