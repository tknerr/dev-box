
node.set['chef_dk']['version'] = '0.3.5-1'
include_recipe "chef-dk"

bash_profile "chefdk-shell-init" do
  user devbox_user
  content %{eval "$(chef shell-init bash)"}
end


directory "#{devbox_userhome}/.bundle" do
  owner devbox_user
  group devbox_group
  mode "0755"
  action :create
end

template "#{devbox_userhome}/.bundle/config" do
  source "bundler_config.erb"
  owner devbox_user
  group devbox_group
  mode "0644"
end
