class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    elsif user.gestor?
      can :manage, User, a_unidade_id: user.a_unidade_id
    elsif user.fornecedor?
      can :read, User, f_empresa_fornecedora_id: user.f_empresa_fornecedora_id
    end

    cannot :manage, TTaxa unless user.admin?
  end
end
