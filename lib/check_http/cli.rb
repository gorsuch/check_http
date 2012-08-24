module CheckHTTP
  class CLI
    def run
      opts = {}
      ARGV.options do |o|
        o.banner = 'Usage: check_http <url>'
        o.parse!
        url = ARGV.shift

        abort("Error: url not provided.\n\n#{o}") unless url

        result = CheckHTTP.check(url)
        puts KV.unparse(result)
      end            
    end
  end
end
