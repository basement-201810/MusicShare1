class ManagerChecker
    def self.matches?(request)
      if warden = request.env['warden'].presence
        warden.try(:user).try(:manager) == true
      else
        false
      end
    end
end