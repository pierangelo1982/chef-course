package 'ntp' do
  action :install
end

package 'tree'

#file '/etc/motd' do
#  content 'This server is property of a funny guy named pierangelo orizio
#  HOSTNAME: localhost.localdomain
#  IPADDRESS: 10.0.2.15
#  CPU: 3100.000
#  MEMORY: 500780
#'
#  action :create
#  owner 'root'
#  group 'root'
#end


template '/etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'pierangelo'
  )
  action :create
end


user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end


group 'admins' do
  members 'user1'
end
