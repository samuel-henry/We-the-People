WeThePeople::Application.routes.draw do
  
	root :to => 'speeches#index'
  	resources :speeches

end
