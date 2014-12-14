git "/tmp/hayai" do
  repository node[:hayai][:git]
  action :checkout
  reference "master"
end

bash "install_hayai" do
  cwd "/tmp/hayai"
  user "root"
  code <<-EOS
    cmake .
    make
    make install
    cd ..
  EOS

  creates "/usr/local/include/hayai/hayai.hpp"
end
