desc "Install limechat solarized theme"
task 'limechat-solarized-theme:install' do
  dest = "~/Library/Application\ Support/LimeChat/Themes"
  orig = File.dirname(__FILE__)
  sh "mkdir -p '#{dest}'"
  sh "cp #{orig}/*.js #{orig}/*.coffee #{orig}/*.yaml #{orig}/*.css '#{dest}'"
end
