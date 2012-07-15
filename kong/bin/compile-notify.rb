#!/usr/local/bin/ruby

require 'rubygems'
require 'ruby_gntp'

status = ARGV[0]

GNTP.notify({
  :app_name => "Compilation Notifier",
  :title    => "Compilation", 
  :text     => status
})
