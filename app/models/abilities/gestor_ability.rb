module Abilities
  class GestorAbility
    include CanCan::Ability

    def initialize(main_ability, user)
      # Permitir criar novas solicitações
      main_ability.can :create, OSolicitacao

      # Permitir gerenciar apenas solicitações da própria unidade
      main_ability.can [:read, :update, :destroy], OSolicitacao, solicitante: { a_unidade_id: user.a_unidade_id }

      # Gestores podem gerenciar usuários da própria unidade
      main_ability.can :manage, User, a_unidade_id: user.a_unidade_id

      # -----------------------------
      # Permissões para OPropostas
      # -----------------------------
      main_ability.can :manage, OProposta
      main_ability.can :aprovar, OProposta
      main_ability.can :recusar, OProposta
      main_ability.can :index, OProposta
      main_ability.can :show, OProposta
    end
  end
end
