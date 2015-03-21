module CSClient
  class User
    attr_reader :username, :password

    def initialize(username, password)
      @username = username
      @password = password
    end

    def to_s
      username
    end
  end
end
