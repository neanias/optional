# frozen_string_literal: true

module Optional
  class Some
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def to_s
      "Optional::Some(#{value})"
    end
  end
end
