set -o xtrace
set -e
export AWS=ubuntu@ec2-35-157-37-37.eu-central-1.compute.amazonaws.com
export GTfolder=/var/www/html/gt/
export build_zip=$(ls GToolkit-64-*.zip)
scp GToolkit64.zip $AWS:$GTfolder
scp GToolkitWin64.zip $AWS:$GTfolder
scp GToolkitOSX64.zip $AWS:$GTfolder
scp GToolkitLinux64.zip $AWS:$GTfolder
scp $build_zip $AWS:$GTfolder
ssh $AWS -t "cd ${GTfolder}; ls -tp | grep -v '/$' | tail -n +40 | xargs -d '\n' -r rm --"
set +e