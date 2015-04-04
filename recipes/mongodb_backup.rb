package 'python-pip'
execute 'pip install awscli'

file '/usr/bin/mongodb_s3_backup' do
  mode '0755'
  content <<-EOM
#! /bin/bash
filename=$(date +%F-%s)
backup_path=/data/db/backup/$filename
/usr/bin/mongodump -o $backup_path
/bin/tar -zcvf $filename.tar.gz $backup_path
/usr/local/bin/aws s3 cp $filename.tar.gz s3://dev.polygon.city/backups/
  EOM
end

cron 'mongo_backup' do
  action :create
  command '/usr/bin/mongodb_s3_backup'
  minute '0'
  hour '*/2'
end

