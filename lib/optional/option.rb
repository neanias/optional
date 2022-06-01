# frozen_string_literal: true

require_relative "some"
require_relative "none"

module Optional
  class Option
    class Error < StandardError; end

    class ContentsIsNoneError < Error; end

    def initialize(value = nil)
      @contents = if !value.nil?
        Some.new(value)
      else
        None.new
      end
    end

    def unwrap
      raise ContentsIsNoneError if contents.is_a?(None)

      contents.value
    end

    def unwrap_or(alternative)
      if contents.is_a?(None)
        alternative
      else
        contents.value
      end
    end

    def unwrap_or_else(&blk)
      if contents.is_a?(None)
        blk.call
      else
        contents.value
      end
    end

    private

    attr_reader :contents
  end
end
