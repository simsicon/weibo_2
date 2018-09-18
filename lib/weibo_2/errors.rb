module WeiboOAuth2
  module Errors
    class WeiboError < StandardError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
    end

    class GeneralError < WeiboError; end
    class RateLimitedError < WeiboError; end
    class UnauthorizedError < WeiboError; end
    class PermissionError < WeiboError; end
  end
end
