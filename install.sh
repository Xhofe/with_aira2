apk add --no-cache aria2 curl

mkdir -p /opt/aria2
cd /opt/aria2
mkdir -p data Download completed
cd ./data
wget https://github.com/P3TERX/aria2.conf/archive/refs/heads/master.tar.gz
tar -zxvf master.tar.gz --strip-components=1
rm -rf master.tar.gz
sed -i 's|rpc-secret|#rpc-secret|g' ./aria2.conf
sed -i 's|/root/.aria2|/opt/aria2/data|g' ./aria2.conf
sed -i 's|/root/.aria2|/opt/aria2/data|g' ./script.conf
sed -i 's|/root|/opt/aria2|g' ./aria2.conf
sed -i 's|/root|/opt/aria2|g' ./script.conf
touch /opt/aria2/data/aria2.session
./tracker.sh