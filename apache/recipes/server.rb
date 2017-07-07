package 'git'

package 'httpd'


#file '/var/www/html/index.html' do
#  content "<h1>Hello, World!</h1>
#  <h3>#{node['hostname']}</h3>
#  <h3>#{node['ipaddress']}</h3>
#"
#end


template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => 'pierangelo',
    :email => 'pierangelo1982@gmail.com'
  )
  action :create
end

cookbook_file '/var/www/html/test.html' do
  source 'test.html'
  #action :create
end


service 'httpd' do
  action :start
end
