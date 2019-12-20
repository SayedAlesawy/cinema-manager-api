# frozen_string_literal: true

class Screening < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :movie
  belongs_to :screen
end
