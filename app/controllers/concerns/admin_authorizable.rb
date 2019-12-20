# frozen_string_literal: true

require 'active_support/concern'

module AdminAuthorizable
  extend ActiveSupport::Concern

  def authorized?
    render json: {}, status: 401 unless current_user.is_admin?
  end
end
