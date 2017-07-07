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
  #notifies :restart, 'service[httpd]', :immediately
end


cookbook_file '/var/www/html/test.html' do
  source 'test.html'
  #action :create
end


bash "inline script" do
  user "root"
  code "mkdir -p /var/www/mysites && chown -R apache /var/www/mysite"
  #not_if '[ -d /var/www/mysites ]'
  not_if do
    File.directory?('/var/www/mysites/')
  end
end


execute "run a script" do
  user "root"
  command <<-EOH
  mkdir -p /var/www/mysites/ /
  chown -R apache /var/www/mysites
  EOH
end


#execute "run script" do
#  user "root"
#  command './myscript.sh'
#end


directory "/var/www/mysites" do
  owner "apache"
  recursive true
end

remote_file '/var/www/html/pierangelo.jpg' do
  source 'https://avatars3.githubusercontent.com/u/4020950'
end


service 'httpd' do
  action [:enable, :start]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end



