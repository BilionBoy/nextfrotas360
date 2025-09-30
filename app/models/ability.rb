class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    tipo = user.a_tipo_usuario&.descricao&.downcase

    case tipo
    when 'admin'
      Abilities::AdminAbility.new(self, user)
    when 'gestor'
      Abilities::GestorAbility.new(self, user)
    when 'fornecedor'
      Abilities::FornecedorAbility.new(self, user)
    end

    # Restrição geral: apenas admins podem gerenciar TTaxa
    cannot :manage, TTaxa unless user.admin?
  end
end
