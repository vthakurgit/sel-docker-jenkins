# sel-docker-jenkins
Docker image containing Selenium and Browsers, w/ Test Automation code and Jenkins file to Build whole setup.

Issue this command. 
mvn clean package -DskipTests. 

You should see docker-resources under target.
docker-resources should contain following directories. Ensure that files are present under these directories.

    config
    libs
    test-data
    test-suites

Go to docker-resources via command line. Then issue this command. One of them should work.

    java -cp 'libs/*' org.testng.TestNG test-suites/flight-reservation.xml
    java -cp libs/* org.testng.TestNG test-suites/flight-reservation.xml
    java -cp "libs/*" org.testng.TestNG test-suites/flight-reservation.xml

Windows Users

    Try in PS
    Try in regular command prompt. (cmd)

Mac/Linux Users

    Try via bash

Once, Docker-compose up run for selenium-hub, browsers and automation code (all together docker hub image at vthakur239/selenium
, Following commands needs to run from java specific container(without maven) to run packaged automation code:
#1Volume Mapping
vthakur:~/workspace/docker/sel-docker-jenkins$ 
docker run -it -v ${PWD}/results:/home/vthakur/workspace/docker/sel-docker-jenkins/test-output vthakur239/selenium

#2 Once you are at Entry Point: Run java command to run package project:
/home/workspace/docker # 
java -Dselenium.grid.enabled=true -Dselenium.grid.hubHost=192.168.1.153 -cp 'libs/*' org.testng.TestNG test-suite
s/flight-reservation.xml -threadcount 1


