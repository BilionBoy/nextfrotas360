class AddTaxaToOOrdemServico < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:o_ordem_servicos, :taxa_aplicada)
      add_column :o_ordem_servicos, :taxa_aplicada, :decimal, precision: 10, scale: 2, default: 0.0, null: false
    end

    unless column_exists?(:o_ordem_servicos, :tipo_taxa)
      add_column :o_ordem_servicos, :tipo_taxa, :string
    end
  end
end
