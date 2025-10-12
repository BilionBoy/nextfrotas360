module Abilities
  class GestorAbility
    include CanCan::Ability

    def initialize(main_ability, user)
      # -----------------------------
      # Solicitações (OSolicitacao)
      # -----------------------------
      main_ability.can :create, OSolicitacao

      # Pode gerenciar apenas solicitações da própria unidade
      main_ability.can [:read, :update, :destroy], OSolicitacao,
                       solicitante: { a_unidade_id: user.a_unidade_id }

      # -----------------------------
      # Usuários
      # -----------------------------
      main_ability.can :manage, User, a_unidade_id: user.a_unidade_id

      # -----------------------------
      # Propostas (OProposta)
      # -----------------------------
      main_ability.can :manage, OProposta
      main_ability.can :aprovar, OProposta
      main_ability.can :recusar, OProposta
      main_ability.can :index, OProposta
      main_ability.can :show, OProposta

      # -----------------------------
      # Ordens de Serviço (OOrdemServico)
      # -----------------------------
      # Pode ler todas as OS da sua unidade (vinculadas a veículos da unidade)
      main_ability.can [:read, :show], OOrdemServico,
                       g_veiculo: { a_unidade_id: user.a_unidade_id }

      # Pode validar (e, consequentemente, atualizar) quando o status for "Atendida"
      main_ability.can [:validar_servico, :update], OOrdemServico do |os|
        os.o_status&.descricao == "Atendida" &&
          os.g_veiculo&.a_unidade_id == user.a_unidade_id
      end
    end
  end
end
