class AddBankFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :banco, null: true unless column_exists?(:users, :banco)
      t.string :agencia, null: true unless column_exists?(:users, :agencia)
      t.string :conta, null: true unless column_exists?(:users, :conta)
      t.string :chave_pix, null: true unless column_exists?(:users, :chave_pix)
    end
  end
end
