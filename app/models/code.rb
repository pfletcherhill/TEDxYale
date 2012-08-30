class Code < ActiveRecord::Base
  def self.authenticate(code)
    code = find_by_code(code)
    if code
      code
    else
      nil
    end
  end
end
