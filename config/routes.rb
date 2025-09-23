Rails.application.routes.draw do
  resources :g_tipos_centros_custos
  root 'home#index'
  get 'home/index'
  
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :a_tipos_unidades
  resources :a_tipo_usuarios
  resources :a_status
  resources :g_status
  resources :g_tipos_veiculos
  # Rotas Scaffold
  
end
