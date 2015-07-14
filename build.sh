#!/bin/bash
mvn clean package deploy

rm -rf maven-metadata.xml
wget http://repository.fit2cloud.com/content/repositories/fit2cloud/com/fit2cloud/samples/wordpress-devops-demo/maven-metadata.xml

version=`grep "\<version\>" maven-metadata.xml | tail -n 1 | awk -F">" '{print $2}' | awk -F"<" '{print $1}'`

echo version=$version

rm -rf *.zip

wget http://repository.fit2cloud.com/content/repositories/fit2cloud/com/fit2cloud/samples/wordpress-devops-demo/$version/wordpress-devops-demo-$version-bin.zip

/usr/bin/osscmd put eventagent-$version-source.zip oss://f2c-sample-apps/wordpress-devops-demo/wordpress-devops-demo-$version-bin.zip
/usr/bin/osscmd put maven-metadata.xml oss://f2c-sample-apps/wordpress-devops-demo/maven-metadata.xml

rm -rf *.md5
wget http://repository.fit2cloud.com/content/repositories/fit2cloud/com/fit2cloud/samples/wordpress-devops-demo/$version/wordpress-devops-demo-$version-bin.zip.md5
/usr/bin/osscmd put wordpress-devops-demo-$version-bin.zip.md5 oss://f2c-sample-apps/wordpress-devops-demo/wordpress-devops-demo-$version-bin.zip.md5
