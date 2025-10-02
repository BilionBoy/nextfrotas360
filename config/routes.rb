Rails.application.routes.draw do
  # Recursos principais
  resources :o_propostas
  resources :o_cotacoes_itens
  resources :o_cotacoes do
    collection do
      get :propostas_enviar, as: :enviar_proposta
    end
  end
  resources :o_solicitacoes  

  # Devise para autenticação
  devise_for :users

  # Recursos de usuários
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

  # Root e home
  root 'home#index'
  get 'home/index'

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Rotas scaffold administrativas
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

  # Financeiro
  resources :f_financeiros
  resources :f_empresas_servicos
  resources :f_empresas_fornecedoras
  resources :f_financeiros_movimentos

  # Gestão
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

  # Ordens e solicitações
  resources :o_tipos_solicitacoes
  resources :o_status
  resources :o_categorias_servicos
  resources :o_visibilidades
  resources :o_urgencias

  # Taxas
  resources :t_taxas
  resources :t_taxas_empresas_fornecedoras
end
