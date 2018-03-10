Rails.application.routes.draw do
  resources :commissariats
  resources :villes
  resources :infractions
  resources :convocations
  resources :users
  resources :agents
  root 'convocations#home'
  get 'convocations/all/not_paid', to: 'convocations#not_paid'
  get 'convocations/all/paid', to: 'convocations#paid'
  get 'auth/login', to: 'convocations#login'
  get 'convocations/request/payer/:id', to: 'convocations#payer'
  get 'convocations/r/g/facture/:id', to: 'convocations#facture'
  get 'convocations/r/p/print/:id', to: 'convocations#print'
  namespace :api, defaults: {format: :json} do
    get 'convocations/create/:cni/:phone/:immatriculation/:motif/:pieceretenue/:agent', to: 'convocations#conv'
    #connexion d'un utilisateur, return matricule
    get 'convocations/authUser/:phone/:matricule', to: 'convocations#authUser'
    get 'convocations/verify/:code', to: 'convocations#verifyContravention'
    get 'convocations/protectCode/:code', to: 'convocations#protectCode'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
