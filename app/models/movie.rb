# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :name, presence: true
  validates :duration, presence: true

  has_many :screenings, dependent: :destroy
end
