module CheckHTTP
  class Checker
    def blacklist
      [:response_header, :response_body, :httpauth_avail, :starttransfer_time, :appconnect_time, :pretransfer_time]  
    end

    def check(url)
      ethon.reset
      ethon.url = url
      ethon.prepare
      ethon.perform
      ethon.to_hash.reject { |k,v| blacklist.include?(k) }.merge(:url => url)
    end

    def ethon
      @ethon ||= Ethon::Easy.new
    end
  end
end
