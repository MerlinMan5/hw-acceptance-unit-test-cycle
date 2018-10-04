require 'rails_helper'

describe MoviesController, type: :controller do

   describe '.similarMovies' do
       it 'should redirect if no movies found' do
            Movie.create(title: '1byD1', rating: 'G', director: 'd1', release_date: Date.new(2000,1,1))
            Movie.create(title: '2byD1', rating: 'G', director: 'd1', release_date: Date.new(2000,1,1))
            Movie.create(title: '1byD2', rating: 'G', director: 'd2', release_date: Date.new(2000,1,1))
            
            movie = Movie.all.where(title: '1byD2').take
            get :similarMovies, movie_id: movie.id
            expect(response).to redirect_to('/movies')
        end
        
        
        it 'should redirect to the page for that movie' do
            Movie.create(title: '1byD1', rating: 'G', director: 'd1', release_date: Date.new(2000,1,1))
            Movie.create(title: '2byD1', rating: 'G', director: 'd1', release_date: Date.new(2000,1,1))
            Movie.create(title: '1byD2', rating: 'G', director: 'd2', release_date: Date.new(2000,1,1))
            @movies = Movie.all
            
            movie = @movies.take
            get :similarMovies, movie_id: movie.id
            expect(response).to render_template('movies/similarMovies')
        end
    end
    

    describe '.show' do
        
        it 'should show' do
            Movie.create(title: '1byD1', rating: 'G', director: 'd1', release_date: Date.new(2000,1,1))
            get :show, id: 1
            expect(response).to render_template('movies/show')
        
        end
    end
    
     describe '.index' do
        
        it 'should show all moveis with no ratings' do
            get :index, ratings: {}
           #expect(response).to render_template('index')
        
        end
    end
    
    
    describe '.create' do
        
        it 'should create' do
            
            tmp_params = Hash.new
            tmp_params = { 'title' => 'name', 'rating' => 'G','description' => 'best', 'release_date' => Date.new(2000,1,1), 'director' => 'dude'  }
            
            post :create, movie: tmp_params
            expect(response).to redirect_to('/movies')
        
        end
    end
        
      describe '.update' do
        
        it 'should update' do
            
            Movie.create(title: '1byD1', rating: 'G', director: 'd1', release_date: Date.new(2000,1,1))
            @movies = Movie.all
            tmp_movie = @movies.take
            
            tmp_params = Hash.new
            tmp_params = { 'title' => 'name', 'rating' => 'G','description' => 'best', 'release_date' => Date.new(2000,1,1), 'director' => 'dude'  }
            
            post :update, id: tmp_movie.id, movie: tmp_params
            expect(response).to redirect_to("/movies/#{tmp_movie.id}")
        
        end
    end
    
     
    
end

