package "python-pip"
execute "pip install awscli"

cron "mongo_backup" do
  action :create
  command %w{
    filename=$(date +%F-%s)
    backup_path=/data/db/backup/$filename
    /usr/bin/mongodump -o $backup_path
    /bin/tar -zcvf $filename.tar.gz $backup_path
    /usr/local/bin/aws s3 cp $filename.tar.gz s3://dev.polygon.city/backups/
  }.join(' ')
end

