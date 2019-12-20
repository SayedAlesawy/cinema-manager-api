# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { message: 'record not found' }, status: 404
  end

  rescue_from ActiveRecord::RecordNotSaved,
              ActiveRecord::RecordInvalid do |exception|
    render json: {
      message: exception.record.errors.full_messages.join(', ')
    }, status: 422
  end

  rescue_from ActiveRecord::NotNullViolation do |_exception|
    render json: { message: 'parameters invalid' }, status: 422
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { message: exception.message }, status: 400
  end
end
