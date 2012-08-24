# CheckHTTP

A simple interface to gather curl stats on a given HTTP interface.

## Installation

Add this line to your application's Gemfile:

    gem 'check_http'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install check_http

## Usage

### Via the command line:

```bash
$ check_http http://www.github.com
# return_code=ok total_time=0.209625 connect_time=0.111266 namelookup_time=0.028197 effective_url=http://www.github.com primary_ip=207.97.227.243 response_code=301 redirect_count=0 url=http://www.github.com
```

You can also stream urls into it:

```bash
$ cat list_of_urls.txt | check_http
```

### Via the lib:

```ruby
require 'check_http'
CheckHTTP.check('http://github.com')
# => {:return_code=>:ok, :total_time=>0.143415, :connect_time=>0.080599, :namelookup_time=>0.023286, :effective_url=>"http://github.com", :primary_ip=>"207.97.227.239", :response_code=>301, :redirect_count=>0, :url=>"http://github.com"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
