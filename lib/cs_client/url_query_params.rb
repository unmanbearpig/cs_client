module CSClient
  class URLQueryParams
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def to_s
      params
        .map { |k, v| "#{k}=#{v}" }
        .join('&')
    end

    alias_method :to_h, :params

    def self.parse string_or_params
      return string_or_params if string_or_params.kind_of? self.class

      new URI.decode_www_form(string_or_params).to_h
    end
  end
end
