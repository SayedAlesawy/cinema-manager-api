# frozen_string_literal: true

require 'active_support/concern'

module MovieParams
  extend ActiveSupport::Concern

  def movie_params
    permitted_params = %i[name genre duration]

    user_params = params.require(:data).permit permitted_params

    user_params
  end
end
