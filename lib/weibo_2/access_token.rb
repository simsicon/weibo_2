module WeiboOAuth2
  class AccessToken < OAuth2::AccessToken
    
    def validated?
      !!@expires_at && !expired?
    end

    def expired?
      puts "expired? time time_convertion"
      puts time_convertion(Time.now, '+08:00').to_i
      expires? && (expires_at < time_convertion(Time.now, '+08:00').to_i)
    end
    

    #Convert Time from a time zone to another time zone
    #'+08:00' or '-08:00'
    #return Time
    def self.time_convertion(time, time_zone)
      t = time.utc
      Time.new(t.year, t.month, t.day, t.hour, t.min, t.sec, time_zone)
    end  
  end
end