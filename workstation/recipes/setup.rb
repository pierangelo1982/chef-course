package 'ntp' do
  action :install
end

package 'tree'

file '/etc/motd' do
  content 'This server is property of a funny guy named pierangelo orizio
  HOSTNAME: localhost.localdomain
  IPADDRESS: 10.0.2.15
  CPU: 3100.000
  MEMORY: 500780
'
  action :create
  owner 'root'
  group 'root'
end
