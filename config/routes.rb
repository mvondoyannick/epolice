Rails.application.routes.draw do
  get 'access/index'
  get 'access/login'
  get 'access/logout'
  get 'access/admin'
  devise_for :users
  get 'loggedin/home'
  get 'loggedin/private'
  get 'welcome/index'

  get 'welcome/home'

  #route generique
  match ':controller(/:action/(:id))', via: [:get, :post]

  resources :carrefours
  resources :carrefours do
    resources :villes
  end

  resources :affectations
  resources :statuses
  resources :types
  resources :alertes
  resources :commissariats
  resources :villes
  resources :infractions
  resources :convocations
  resources :convocations do
    resources :villes
  end

  resources :users
  resources :agents
  #root 'convocations#index'
  #root 'welcome#home'
  root 'access#login'
  #pour la gestion des carrefours
  get 'carrefours/cartograhie/all', to: 'carrefours#cartographie'

  #gestion de la de connexion et de son meniu
  #gestion de la documentation
  get 'access/request_docs', to: 'access#request_docs'

  #gestion de la demande d'un compte
  get 'access/request_account', to: 'access#request_account'

  #gestion de about
  get 'access/about', to: 'access#about'

  #concernant les email
  get 'access/email', to: 'access#email'

  #gestion des convocation
  get 'convocations/all/not_paid', to: 'convocations#not_paid'
  get 'convocations/all/paid', to: 'convocations#paid'
  get 'auth/login', to: 'convocations#login'
  get 'convocations/request/payer/:id', to: 'convocations#payer'
  get 'convocations/r/g/facture/:id', to: 'convocations#facture'
  get 'convocations/r/p/print/:id', to: 'convocations#print'
  get 'convocations/r/h/historiqueCni/:cni', to: 'convocations#historiqueCni'
  get 'convocations/r/h/historiquePhone/:phone', to: 'convocations#historiquePhone'
  get 'convocations/r/h/historiqueImmatriculation/:imm', to: 'convocations#historiqueImmatriculation'
  get 'convocations/r/a/alerteReq/:titre/:description/:date/:ville_id/:type_id/:agent_id', to: 'convocations#alerteReq'

  #route de l'API pour l'application mobile
  namespace :api, defaults: {format: :json} do
    get 'convocations/create/:cni/:phone/:immatriculation/:motif/:pieceretenue/:agent', to: 'convocations#conv'
    #connexion d'un utilisateur, return matricule
    get 'convocations/authUser/:phone/:matricule', to: 'convocations#authUser'
    get 'convocations/verify/:code', to: 'convocations#verifyContravention'
    get 'convocations/protectCode/:code', to: 'convocations#protectCode'
    #----------------------sending alert and return status----------------------------------
    get 'alert/new/:matricule/:type/:coordonnees/:photo/:description/:ville', to: 'alert#new_alerte'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
