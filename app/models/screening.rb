# frozen_string_literal: true

class Screening < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :movie
  belongs_to :screen

  def init_seat_map
    rows = screen.rows
    cols = screen.columns

    self.seat_map = Array.new(rows * cols, 0).to_json

    save!
  end

  def reserve_seat(seat_number)
    seat_map = JSON.parse(self.seat_map)

    if seat_number.negative? || seat_map[seat_number].nil?
      raise InvalidSeatNumber
    end

    raise ResourceReserved if seat_map[seat_number] == 1

    seat_map[seat_number] = 1
    self.seat_map = seat_map.to_json

    save!
  end

  class ResourceReserved < StandardError; end
  class InvalidSeatNumber < StandardError; end
end
