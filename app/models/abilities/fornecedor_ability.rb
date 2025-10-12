module Abilities
  class FornecedorAbility
    include CanCan::Ability

    def initialize(main_ability, user)
      # Só ler solicitações
      main_ability.can :read, OSolicitacao

      # Ação customizada para acessar cotações
      main_ability.can :propostas_enviar, OSolicitacao

      # Pode criar novas propostas
      main_ability.can :create, OProposta
      main_ability.can :new, OProposta
      main_ability.can :show, OProposta, f_empresa_fornecedora_id: user.f_empresa_fornecedora_id
      main_ability.can :fornecedor_enviadas, OProposta, f_empresa_fornecedora_id: user.f_empresa_fornecedora_id

      # Não permite acessar index, aprovar ou recusar
      main_ability.cannot :index, OProposta
      main_ability.cannot :aprovar, OProposta
      main_ability.cannot :recusar, OProposta

      # Usuários só podem ler usuários da própria empresa fornecedora
      main_ability.can :read, User, f_empresa_fornecedora_id: user.f_empresa_fornecedora_id

      # --- Permissões para Ordens de Serviço ---
      main_ability.can :read, OOrdemServico, f_empresa_fornecedora_id: user.f_empresa_fornecedora_id

      # Só pode marcar como atendida se estiver aberta e for da empresa dele
      main_ability.can :marcar_como_atendida, OOrdemServico do |os|
        os.o_status&.descricao == "Aberta" && os.f_empresa_fornecedora_id == user.f_empresa_fornecedora_id
      end
    end
  end
end
