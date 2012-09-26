$stdout.sync = true

module CheckHTTP
  class CLI
    def perform(url, opts={})
      if opts[:advanced]
	data = KV.parse(url)
	result = CheckHTTP.check(data['url'], data)
        puts KV.unparse(result)
      else
        result = CheckHTTP.check(url.strip)
        puts KV.unparse(result)
      end
    end

    def run
      opts = {}
      ARGV.options do |o|
        o.banner = 'Usage: check_http [url]'
	o.set_summary_indent('  ')
	o.on('-a', '--advanced', 'enable advanced input mode') { opts[:advanced] = true }
        o.parse!

        if url = ARGV.shift
          perform(url, opts)
        else
          ARGF.each_line do |url|
            perform(url, opts)
          end
        end       
      end            
    end
  end
end
