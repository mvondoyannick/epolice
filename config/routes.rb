Rails.application.routes.draw do
  get 'gestion_constat/today'
  get 'gestion_constat/hier'
  get 'gestion_constat/week'
  get 'gestion_constat/mounth'
  get 'gestion_constat/all'
  get 'gestion_constat/cartography'
  get 'gestion_constat/region'
  get 'gestion_constat/assureur'
  get 'gestion_contravention/today'
  get 'gestion_contravention/week'
  get 'gestion_contravention/mounth'
  get 'gestion_contravention/cartography'
  get 'gestion_contravention/region'
  get 'gestion_alerte/today'
  get 'gestion_alerte/week'
  get 'gestion_alerte/mounth'
  get 'gestion_alerte/cartography'
  get 'gestion_alerte/region'
  resources :roles
  resources :services
  resources :workflows
  get 'u/index'
  get 'u/private'
  devise_for :us
  resources :grades
  get 'access/index'
  get 'access/login'
  get 'access/logout'
  get 'access/admin'
  get 'loggedin/home'
  get 'loggedin/private'
  get 'welcome/index'

  get 'welcome/home'

  #route generique
  #match ':controller(/:action/(:id))', via: [:get, :post]

  post 'a/b', to: 'access#attemp_login'

  #demande de compte et envoi des parametres
  post 'b/c', to: 'access#attemp_account'

  #se connecter dans le compte administrateur de l'etat
  get 'access/a/l/administration', to: 'access#administration'

  #pour la recherche des documents
  #match 'search/documents', via: ['get', 'post']
  post 'search/documents/', to: 'access#search_document'
  get 'search/documents', to: 'access#search_document'

  #lire une contravention
  get 'search/documents/:contravention_id/read', to: 'access#read_document'

  #affichage des requetes pour une ville
  get 'villes/ville/:ville_id/show', to: 'gestion_alerte#tri_ville'

  resources :carrefours
  resources :affectations
  resources :statuses
  resources :types
  resources :alertes
  resources :commissariats
  resources :villes
  resources :infractions
  resources :convocations
  resources :agents
  #root 'convocations#index'
  #root 'welcome#home'
  root 'access#login'

  resources :access do
  end
  #pour la gestion des carrefours
  get 'carrefours/cartograhie/all', to: 'carrefours#cartographie'

  #gestion de la de connexion et de son meniu
  #gestion de la documentation
  get 'access/request_docs', to: 'access#request_docs'

  #gestion de la demande d'un compte
  get 'access/request/auth/account', to: 'access#request_account'
  #post 'access/request/auth/account', to: 'access#request_account'

  #gestion de about
  get 'access/about', to: 'access#about'

  #voir toutes les alertes
  get 'access/alertes/alerte/all', to: 'access#alerte_all'

  #voir toutes les convocations
  get 'acces/convocations/convocation/all', to: 'access#convocation_all'

  #pour les autres services de la plateforme autres que la DGSN
  get 'access/request/service/open', to: 'access#request_service'

  #concernant les email
  get 'access/email(/:user_id)', to: 'access#email'

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
    get 'alert/new/:matricule/:type/:lon/:lat/:photo/:description/:ville', to: 'convocations#new_alerte'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
