module YrNo
  class Client

    # Creates a connection if there is none, otherwise returns the existing connection.
    #
    # @return [Faraday::Connection] Faraday connection for the client
    def connection
      @connection ||= build_connection
      return @connection
    end

    # Called by {#connection} to build a connection. Can be overwritten in a
    # subclass to add additional middleware and make other configuration
    # changes.
    #
    # Uses middleware according to configuration options.
    #
    # Request logger if logger is not nil
    #
    # Retry middleware if retry is true
    def build_connection
      Faraday.new do |conn|
        conn.options.params_encoder = self
        # conn.response :logger                  # log requests to STDOUT
        # conn.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        conn.adapter :net_http
      end
    end

    def encode(params)
      return Faraday::FlatParamsEncoder.encode(params)
    end

    def decode(query)
      return CGI.parse(query)
    end

  end
end
