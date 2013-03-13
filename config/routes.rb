WeThePeople::Application.routes.draw do
  
	root :to => 'speeches#index'
	get '/about' => 'about#index'

	get     '/:speeches'        => 'speeches#index'
  	get     '/:speeches/new'    => 'speeches#index'
  	post    '/speeches'         => 'speeches#index'
  	get     '/speeches/:id'     => 'speeches#show'
  	get     'speeches/:id/edit' => 'speeches#index', :as "speech_path"
  	put     '/speeches/:id'     => 'speeches#index'
  	delete  '/speeches/:id'     => 'speeches#index'

end
