require 'rubygems'
require 'httparty'
require 'net/netrc'
require 'uri'

class Notes
  include HTTParty
  base_uri 'https://notes.bugsplat.info'

  def initialize
    rc = Net::Netrc.locate('notes.bugsplat.info') or raise ".netrc missing"
    self.class.basic_auth rc.login, rc.password
  end

  def append(id, body)
    self.class.post("/notes/#{id}/append.json", :body => {:body => body})
  end

  def all
    self.class.get("/notes.json").parsed_response
  end

  def search(query)
    escaped = URI.escape(query)
    self.class.get("/notes/search.json?q=#{escaped}").parsed_response
  end

  def get(id)
    self.class.get("/notes/#{id}.json")
  end

  def update(id, body)
    puts self.class.put("/notes/#{id}.json", :body => {:note => {:body => body}}).parsed_response
  end
end
