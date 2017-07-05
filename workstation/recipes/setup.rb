package 'ntp' do
  action :install
end

package 'tree'

file '/etc/motd' do
  content 'This server is property of a funny guy named pierangelo orizio'
  action :create
  owner 'root'
  group 'root'
end
