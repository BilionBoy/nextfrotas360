module Abilities
  class FornecedorAbility
    include CanCan::Ability

    def initialize(main_ability, user)
      # Fornecedores só podem ler solicitações
      main_ability.can :read, OSolicitacao

      # Fornecedores só podem ler usuários da própria empresa fornecedora
      main_ability.can :read, User, f_empresa_fornecedora_id: user.f_empresa_fornecedora_id
    end
  end
end
