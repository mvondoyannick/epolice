Rails.application.routes.draw do
  resources :constats
  resources :typeaccidents
  get 'metropoli/index'
  get 'member/index'
  get 'grvpc/index'
  get 'assurance/index'
  get 'assurance/detail'
  get 'assurance/pay'
  get 'assurance/bilan'
  #devise_for :metropolis
  #devise_for :assurances
  #devise_for :grvpcs
  #devise_for :admins
  devise_for :member, controllers: {
      sessions: 'member/sessions',
      registrations: 'member/registrations'
  }

  #pour lagestion de la DGSN qui est dans notre cas l'administrateur
  devise_for :admin, controllers: {
      sessions: 'admin/sessions',
      registrations: 'admin/registrations'
  }

  #pour la gestion du grvpc
  devise_for :grvpc, controllers: {
      sessions: 'grvpc/sessions',
      registrations: 'grvpc/registrations'
  }

  #pour la gestion des assurances
  devise_for :assurance, controllers: {
      sessions: 'assurance/sessions',
      registrations: 'assurance/registrations'
  }

  #pour la gestion de la communaute urbaine metropi=olis
  devise_for :metropolis, controllers: {
      sessions: 'metropolis/sessions',
      registrations: 'metropolis/registrations'
  }


  get 'convocation/detail/:convocation_id/view', to: 'gestion_contravention#month_detail'
  resources :pieceretenus
  get 'archive/index'
  get 'archive/merci'
  get 'archive/validate'
  post 'archive/validate'
  get 'archive/get_contravention_from_agent/:agent_id', to: 'archive#get_contravention_from_agent'
  get 'archive/confirm_contravention_document/:agent_id/:code/fallback', to: 'archive#confirm_get_document'
  get 'archive/end_transaction/:code/fallback/end', to: 'archive#set_transmission'
  get 'compte/index'
  get 'compte/validate'
  get 'compte/update'
  get 'compte/authorise'
  get 'compte/block'
  get 'public/index'
  get 'public/search'
  get 'public/result'
  get 'public/abonne'
  get 'public/desabonne'
  get 'public/attempt_search'
  post 'public/attempt_search'
  get 'journal/public'
  get 'journal/private'
  resources :status
  get 'constat/read'
  get 'constat/search'
  get 'constat/transmettre'
  get 'constat/archiver'
  get 'statistique/index'
  get 'statistique/day'
  get 'statistique/week'
  get 'statistique/mois'
  #========================================
  get 'gestion_constat/today'
  get 'gestion_constat/hier'
  get 'gestion_constat/week'
  get 'gestion_constat/mounth'
  get 'gestion_constat/all'
  get 'gestion_constat/cartography'
  get 'gestion_constat/region'
  get 'gestion_constat/assureur'
  #=========================================
  get 'gestion_contravention/today'
  get 'gestion_contravention/week'
  get 'gestion_contravention/mounth'
  get 'gestion_contravention/cartography'
  get 'gestion_contravention/region'
  get 'gestion_contravention/periode'
  post 'gestion_contravention/periode'
  #===========================================
  get 'gestion_alerte/today'
  get 'gestion_alerte/week'
  get 'gestion_alerte/mounth'
  get 'gestion_alerte/cartography'
  get 'gestion_alerte/region'
  get 'gestion_alerte/periode'
  post 'gestion_alerte/periode'
  get 'gestion_alerte/resolve'
  get 'gestion_alerte/unresolve'
  get 'gestion_alerte/archive/:alerte_id', to: 'gestion_alerte#archive'
  #==========================================
  get 'statistique/statistique_home'
  resources :roles
  resources :services
  #resources :workflows
  get 'u/index'
  get 'u/private'
  resources :grades
  get 'access/index'
  get 'access/login'
  get 'access/logout'
  get 'access/admin'
  get 'access/access_control'
  get 'loggedin/home'
  get 'loggedin/private'
  get 'welcome/index'

  get 'welcome/home'

  get 'accesss/attemp_buying'
  post 'access/attemp_buying'

  #route generique
  #match ':controller(/:action/(:id))', via: [:get, :post]

  post 'a/b', to: 'access#attemp_login'
  post 'time_machine/search/periode/week', to: 'gestion_alerte#periode'

  #demande de compte et envoi des parametres
  post 'b/c', to: 'access#attemp_account'

  #se connecter dans le compte administrateur de l'etat
  get 'access/a/l/administration', to: 'access#administration'

  #pour la recherche des documents
  #match 'search/documents', via: ['get', 'post']
  post 'search/documents/', to: 'access#search_document'
  get 'search/documents', to: 'access#search_document'

  #payer une contravention
  get 'paiements/pay/:id/sent', to: 'access#buy_document'

  #
  get 'search/documents/by_cni/:cni/search', to: 'access#search_cni'

  #lire une contravention
  get 'search/documents/:contravention_id/read', to: 'access#read_document'

  #affichage des requetes pour une ville
  get 'villes/ville/:ville_id/show', to: 'gestion_alerte#tri_ville'

  resources :carrefours
  resources :affectations
  get 'affectations/agent/home', to: 'affectations#home'
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
    #============================== retourner le type d'infraction ===============================
    get 'alert/types/type', to: 'convocations#api_type'
    #----------------------sending alert and return status----------------------------------
    get 'alert/new/:matricule/:type/:lon/:lat/:photo/:description/:ville', to: 'convocations#new_alerte'
    #========== lire les alertes publiées =============
    get 'alert/read/all/:matricule/:ville_id', to: 'convocations#read_alertes'
    #================= gestion du token ===================
    get 'epolice/verification/token/:matricule', to: 'convocation#verify_token'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
