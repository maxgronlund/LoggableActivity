# frozen_string_literal: true

module LoggableActivity
  # Stores current user in a thread variable so is can be accessed from the LoggableActivity::Hook model
  module CurrentUser
    extend ActiveSupport::Concern

    included do
      before_action :set_current_user
      after_action :clear_current_user
    end

    private

    def set_current_user
      # return if request.path == "/users/sign_out"
      return unless current_user

      Thread.current[:current_user] = current_user
    end

    def clear_current_user
      Thread.current[:current_user] = nil
    end
  end
end
