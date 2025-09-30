Rails.application.routes.draw do
  resources :f_financeiros_movimentos
  devise_for :users
  
  resources :users, path: "usuarios" do
    collection do
      get  :novo_gestor,       to: 'users#new_gestor'
      post :create_gestor,     to: 'users#create_gestor'
      get  :novo_fornecedor,   to: 'users#new_fornecedor'
      post :create_fornecedor, to: 'users#create_fornecedor'
    end
    
    member do
      delete :remove_foto_perfil
      delete :remove_foto_rg
    end
  end
  
  root 'home#index'
  get 'home/index'
  
  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
  
  # Rotas Scaffold
  resources :a_tipos_unidades
  resources :a_tipo_usuarios
  resources :a_usuarios_papeis
  resources :a_status
  resources :a_papeis_permissoes
  resources :a_usuarios_historicos_cargos_unidades
  resources :a_permissoes
  resources :a_papeis
  resources :a_cargos
  resources :a_unidades
  resources :f_financeiros
  resources :f_empresas_servicos
  resources :f_empresas_fornecedoras
  resources :g_status
  resources :g_tipos_veiculos
  resources :g_tipos_centros_custos
  resources :g_condutores
  resources :g_condutores_veiculos
  resources :g_carteiras_orgaos_emissores
  resources :g_categorias_carteiras_condutores
  resources :g_veiculos
  resources :g_paises
  resources :g_localidades
  resources :g_distritos
  resources :g_bairros
  resources :g_municipios
  resources :g_estados
  resources :g_centros_custos_movimentos
  resources :g_tipos_movimentos
  resources :g_centros_custos
  resources :o_tipos_solicitacoes
  resources :o_status
  resources :o_categorias_servicos
  resources :o_visibilidades
  resources :o_urgencias
  resources :t_taxas
  resources :t_taxas_empresas_fornecedoras
end
