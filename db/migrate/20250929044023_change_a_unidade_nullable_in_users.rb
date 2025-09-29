class ChangeAUnidadeNullableInUsers < ActiveRecord::Migration[7.2]
  def change
    if column_exists?(:users, :a_unidade_id)
      change_column_null :users, :a_unidade_id, true
    end
  end
end
