#!/usr/bin/env ruby

require 'mail'

date = ARGV[0]

branches = `yesterday #{date} | awk '{print $3}' | grep -v master | sort -u`
detail = `yesterday #{date}`

textbody = """
Branches
--------

#{branches}

Detail
------

#{detail}
"""

Mail.new do
  to 'pete@bugsplat.info'
  from 'pkeenatkongregate@bugsplat.info'
  subject "Summary for #{date}"
  body textbody
  delivery_method :smtp, {
    :address => 'smtp.mandrillapp.com',
    :user_name => 'peter.keen@gmail.com',
    :port => 587,
    :enable_starttls_auto => true,
    :password => ENV['MANDRILL_PASSWORD']
  }
end.deliver

puts textbody
