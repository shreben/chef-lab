# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :debug
log_location             STDOUT
node_name                "admin"
client_key               "#{current_dir}/admin_private_key.pem"
chef_server_url          "https://chef-server/organizations/lab"
cookbook_path            ["#{current_dir}/cookbooks"]
knife[:editor] = 'vim'
data_bag_encrypt_version 2
knife[:secret_file] = "#{current_dir}/databag_secret_key"
validation_key		"#{current_dir}/lab-validator.pem"
