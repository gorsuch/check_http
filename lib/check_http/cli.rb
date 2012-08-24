STDOUT.sync = true

module CheckHTTP
  class CLI
    def perform(url)
      result = CheckHTTP.check(url.strip)
      puts KV.unparse(result)
      STDOUT.flush
    end

    def run
      opts = {}
      ARGV.options do |o|
        o.banner = 'Usage: check_http [url]'
        o.parse!

        if url = ARGV.shift
          perform(url)
        else
          ARGF.each_line do |url|
            perform(url)
          end
        end       
      end            
    end
  end
end
