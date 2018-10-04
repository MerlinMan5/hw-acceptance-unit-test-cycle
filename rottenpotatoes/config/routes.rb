Rottenpotatoes::Application.routes.draw do
 
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
   resources :movies do
    resources :similarMovies, :controller=> 'movies', :action => 'similarMovies', :only => [:index]
  end
end
