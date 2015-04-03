package "python-pip"
execute "pip install awscli"

file "/usr/bin/backup_mongodb" do
  mode '0755'
  content <<-EOF
#! /bin/bash
backup_path=/data/db/backup/$(date +%F-%s)
/usr/bin/mongodump -o $backup_path
/bin/tar -zcvf $(date +%F-%s).tar.gz $backup_path
EOF
end

