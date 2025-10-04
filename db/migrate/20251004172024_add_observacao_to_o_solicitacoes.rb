# frozen_string_literal: true

class AddObservacaoToOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    if table_exists?(:o_solicitacoes)
      unless column_exists?(:o_solicitacoes, :observacao)
        add_column :o_solicitacoes, :observacao, :text
      end
    end
  end

  def down
    if table_exists?(:o_solicitacoes)
      if column_exists?(:o_solicitacoes, :observacao)
        remove_column :o_solicitacoes, :observacao
      end
    end
  end
end
