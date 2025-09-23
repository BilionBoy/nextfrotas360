# frozen_string_literal: true

class OStatus < ApplicationRecord
  validates :descricao, presence: true
end
