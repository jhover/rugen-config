#!/bin/bash -e
echo "Installing condor..."
cd /etc/yum.repos.d
wget https://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor
rpm --import RPM-GPG-KEY-HTCondor
wget https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo
sleep 5
yum install condor
sleep 5
cd /etc/condor/config.d
mkdir unused
mv * unused
cp ~/git/rugen-config/etc/condor_config /etc/condor_config
cp ~/git/rugen-config/etc/config.d/* /etc/condor/config.d/
sleep 5
firewall-cmd --permanent --add-port=9618/tcp
service firewalld restart
firewall-cmd --list-all
echo "Done. Place password file and start..."


