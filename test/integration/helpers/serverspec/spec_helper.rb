require 'serverspec'

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
  set :path, '/sbin:/bin:/usr/sbin:/usr/bin:$PATH'
  set :env, LANG: 'C', LC_MESSAGES: 'C'
else
  set :backend, :cmd
  set :os, family: 'windows'
end
