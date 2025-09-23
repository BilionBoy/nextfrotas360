# frozen_string_literal: true

class OVisibilidade < ApplicationRecord
  validates :descricao, presence: true
end
