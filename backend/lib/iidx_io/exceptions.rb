# frozen_string_literal: true

module IIDXIO
  class Error < StandardError; end
  class InvalidFirebaseIdTokenError < Error; end
  class InvalidViewerError < Error; end
end
