module UserExceptions
  class WrongPassword < StandardError
    def message
      'wrong_password'
    end
  end

  class Unauthorized < StandardError
    def message
      'unauthorized'
    end
  end
end
