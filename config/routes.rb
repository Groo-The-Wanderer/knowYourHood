Rails.application.routes.draw do
  root :to => "application#index"

  get '/suburb/search'   => 'suburb#search'
  get '/schools/near'    => 'school_location#near'

end
