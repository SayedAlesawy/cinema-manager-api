# frozen_string_literal: true

class Screen < ApplicationRecord
  validates :number, presence: true
  validates :rows, presence: true
  validates :columns, presence: true

  has_many :screenings, dependent: :destroy
end
