
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "scala" do |v|
    v.vm.provider "docker" do |d|
      d.image = "internal_registry:5000/scala"
    end
  end

#  config.vm.provision "docker" do |d|
#    d.build_dir = "./images"
#    d.build_image "oracle-java7", args: "-t oracle-java7"
#    d.run "scala"
#  end
end