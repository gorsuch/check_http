module CheckHTTP
  class Checker
    attr_accessor :blacklist

    def initialize
      self.blacklist = default_blacklist
    end

    def default_blacklist
      [:response_header, :response_body, :httpauth_avail, :starttransfer_time, :appconnect_time, :pretransfer_time]  
    end

    def check(url)
      clean(sample(url)).merge(:url => url)
    end

    def clean(result)
      result.reject { |k,v| blacklist.include?(k) }
    end

    def sample(url)
      ethon = Ethon::Easy.new
      ethon.url = url
      ethon.prepare
      ethon.perform
      ethon.to_hash
    end
  end
end
