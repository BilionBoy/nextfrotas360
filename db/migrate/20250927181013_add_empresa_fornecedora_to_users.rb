class AddEmpresaFornecedoraToUsers < ActiveRecord::Migration[7.0]
  def up
    unless column_exists?(:users, :f_empresa_fornecedora_id)
      add_reference :users, :f_empresa_fornecedora, null: true, foreign_key: true
    end
  end

  def down
    if column_exists?(:users, :f_empresa_fornecedora_id)
      remove_reference :users, :f_empresa_fornecedora, foreign_key: true
    end
  end
end
