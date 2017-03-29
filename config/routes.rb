Rails.application.routes.draw do
  devise_for :accounts
  root to: 'parking_spots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parking_spots, only: [:index, :show]

# namespace :dashboard do
  resources :users, only: [:show, :edit, :update, :destroy ] do
    resources :parking_spots
  end
  resources :bookings, except: [ :destroy ] do
    resources :comments, only: [ :create ]
    resources :reviews, only: [ :create ]
  end
  resources :reviews, only: [ :index ]

# end
end


# root/index would show all parking spots or a selection
# /parking_spots would show all parking spots or search results
# /parking_spots/:id would show a single parking spot (with address, reviews etc.) and enable a user to create/update a booking
# /dashboard would show all bookings and maybe other info for an admin or a user
# /dashboard/bookings would show all bookings



# MoSCoW

# Must have

# Should have

# Could have

# Would have but won't have

