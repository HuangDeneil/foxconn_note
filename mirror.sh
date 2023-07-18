#!/bin/sh

set -ex

# version="7"
version="7.9.2009"
#src=http://centos.mirrors.proxad.net/${version}
#src=http://ftp.ksu.edu.tw/pub/CentOS/${version}
src=http://ftp.twaren.net/Linux/CentOS/${version}
dest=downloads

for arch in "x86_64"
do
	for folder in "os" "extras" "updates" "centosplus"
	do
		arch_src="$src/$folder/$arch"
		arch_dest="$dest"
		
		if [ ! -d "arch_dest" ]; then
			mkdir -p "$arch_dest"
		fi
		
		echo -e "wget --mirror -nH --cut-dirs=1  --convert-links --adjust-extension --page-requisites --no-parent $arch_src --directory-prefix=$arch_dest"
	done
done

#wget --mirror -nH --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent http://ftp.twaren.net/Linux/CentOS/7.9.2009/os/x86_64 --directory-prefix=downloads
#wget --mirror -nH --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent http://ftp.twaren.net/Linux/CentOS/7.9.2009/extras/x86_64 --directory-prefix=downloads
#wget --mirror -nH --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent http://ftp.twaren.net/Linux/CentOS/7.9.2009/updates/x86_64 --directory-prefix=downloads
#wget --mirror -nH --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent http://ftp.twaren.net/Linux/CentOS/7.9.2009/centosplus/x86_64 --directory-prefix=downloads

# scp -i ~/.ssh/keys/deneil_keypair.pem -r centosplus/ rocky@10.62.164.207:/share/data-NFS-77/centos-mirror-docker/mirror/CentOS/7.9.2009/
# scp -i ~/.ssh/keys/deneil_keypair.pem -r extras/ rocky@10.62.164.207:/share/data-NFS-77/centos-mirror-docker/mirror/CentOS/7.9.2009/
# scp -i ~/.ssh/keys/deneil_keypair.pem -r updates/ rocky@10.62.164.207:/share/data-NFS-77/centos-mirror-docker/mirror/CentOS/7.9.2009/



