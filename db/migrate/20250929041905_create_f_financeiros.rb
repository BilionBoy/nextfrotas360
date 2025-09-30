class CreateFFinanceiros < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:f_financeiros)
     create_table :f_financeiros do |t|
        t.references :f_empresa_fornecedora,   null: false, foreign_key: true
        t.references :o_categoria_servico,     null: false, foreign_key: true
        t.decimal :saldo_total,                precision: 15, scale: 2, default: 0.0, null: false
        t.decimal :saldo_disponivel,           precision: 15, scale: 2, default: 0.0, null: false
        t.decimal :saldo_reservado,            precision: 15, scale: 2, default: 0.0, null: false
  
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :f_financeiros if table_exists?(:f_financeiros) if table_exists?(:f_financeiros)
  end
end
