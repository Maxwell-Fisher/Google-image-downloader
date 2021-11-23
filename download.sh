while :
do
url=$(curl -v --silent https://login-test.corp.google.com 2>&1 | grep "login-image" | sed -n 's/.*src="//p' | sed -n 's/" .*$//p')
name=$(echo $url | sed -n 's/.*\///p')
if [ ! -f ./files/$name ]
then
    wget $url -P ./files
else
    echo Exists
fi
echo $url
done
