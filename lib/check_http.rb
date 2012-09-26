require 'ethon'
require 'kv'
require 'optparse'

require 'check_http/checker'
require 'check_http/cli'
require 'check_http/version'

module CheckHTTP
  extend self

  def checker
    @checker ||= Checker.new
  end

  def check(url,opts={})
    checker.check(url,opts)
  end
end
