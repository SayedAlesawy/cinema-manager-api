# frozen_string_literal: true

require 'active_support/concern'

module ScreeningParams
  extend ActiveSupport::Concern

  def screening_params
    permitted_params = %i[start_time end_time movie_id screen_id]

    user_params = params.require(:data).permit permitted_params

    user_params
  end
end
