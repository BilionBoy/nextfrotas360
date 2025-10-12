class AddTTaxaToOOrdemServicos < ActiveRecord::Migration[7.2]
  def change
    # Só adiciona se a tabela existir
    if table_exists?(:o_ordem_servicos)
      # Só adiciona a coluna se não existir
      unless column_exists?(:o_ordem_servicos, :t_taxa_id)
        add_reference :o_ordem_servicos, :t_taxa, foreign_key: true, index: true
      end
    end
  end
end
