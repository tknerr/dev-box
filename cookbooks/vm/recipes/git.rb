
if docker?
  # avoid /dev/fuse issues on circleci
  extra_options = '--no-install-recommends'
end

package 'meld' do
  action :install
  options extra_options || ''
end

package 'git' do
  action :install
end

template "#{vm_user_home}/.gitconfig" do
  source 'git_config.erb'
  owner vm_user
  group vm_group
  mode '0644'
  action :create_if_missing
end
