require_relative 'basic_response'

module CSClient
  class HTMLResponse < BasicResponse
    def doc
      @doc ||= Nokogiri.HTML(body)
    end
  end
end
