Rails.application.routes.draw do
  resources :g_bairros
  resources :g_municipios
  resources :g_estados
  root 'home#index'
  get 'home/index'
  
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  
  # Rotas Scaffold
  resources :a_tipos_unidades
  resources :a_tipo_usuarios
  resources :a_status
  resources :g_status
  resources :g_tipos_veiculos
  resources :g_tipos_centros_custos
  resources :g_paises
  resources :o_tipos_solicitacoes
  resources :o_status
  resources :o_categorias_servicos
  resources :o_visibilidades
  resources :o_urgencias
  resources :t_taxas
  
end
