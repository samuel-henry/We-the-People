WeThePeople::Application.routes.draw do
  
	root :to => 'speeches#index'
	get '/about' => 'about#index'

	get     '/:speeches'        => 'speeches#index'
	get     '/:speeches/new'    => 'speeches#index'
	post    '/speeches'         => 'speeches#index'
	get     '/speeches/:id'     => 'speeches#show'
	get     'speeches/:id/edit' => 'speeches#index'
	put     '/speeches/:id'     => 'speeches#index'
	delete  '/speeches/:id'     => 'speeches#index'
	resources :speeches

end
