WeThePeople::Application.routes.draw do
  
	root :to => 'speeches#index'
	get '/about' => 'about#index'

	#only route requeqsts on speeches to home page and individual speech pages
	get     '/:speeches/new'    => 'speeches#index'
	get     '/:speeches'        => 'speeches#index'
  	post    '/speeches'         => 'speeches#index'
  	get     'speeches/:id/edit' => 'speeches#index'
  	put     '/speeches/:id'     => 'speeches#index'
  	delete  '/speeches/:id'     => 'speeches#index'

  	get     '/speeches/:id'     => 'speeches#show'

end
