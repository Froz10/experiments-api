# frozen_string_literal: true
##
# This is general module API.
module Api
  ##
  # This class application service.
  class ApplicationService
    # Calls service.
    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end
