# frozen_string_literal: true

class AddCreatedByToUsers < ActiveRecord::Migration[7.2]
  def up
    unless column_exists?(:users, :created_by)
      add_column :users, :created_by, :string
    end
  end

  def down
    if column_exists?(:users, :created_by)
      remove_column :users, :created_by
    end
  end
end
