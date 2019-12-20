# frozen_string_literal: true

require 'active_support/concern'

module UserParams
  extend ActiveSupport::Concern

  def sign_up_params
    permitted_params = %i[email password username first_name last_name birthday]

    user_params = params.require(:data).permit permitted_params

    user_params
  end
end
