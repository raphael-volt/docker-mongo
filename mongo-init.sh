#!/bin/bash

if [ -z ${MONGO_INITDB_ROOT_USERNAME+x} ]; then 
    MONGO_INITDB_ROOT_USERNAME='root' 
fi

if [ -z ${MONGO_INITDB_ROOT_PASSWORD+x} ]; then 
    MONGO_INITDB_ROOT_PASSWORD='rootpwd' 
fi

if [ -z ${MONGO_USER_NAME+x} ]; then 
    MONGO_USER_NAME='default-user' 
fi

if [ -z ${MONGO_USER_PWD+x} ]; then 
    MONGO_USER_PWD='default-pwd' 
fi

if [ -z ${MONGO_DBNAME+x} ]; then 
    MONGO_DBNAME='defaultdb' 
fi

root=$MONGO_INITDB_ROOT_USERNAME
rootpwd=$MONGO_INITDB_ROOT_PASSWORD
user=$MONGO_USER_NAME
pwd=$MONGO_USER_PWD
dbname=$MONGO_DBNAME

createUserAndDb() {
    mongo admin -u $root -p $rootpwd --eval "db.getSiblingDB('$dbname').createUser({user: '$user', pwd: '$pwd', roles: [{role: 'readWrite', db: '$dbname'}]});"
}

createUserAndDb

user="test-$user"
dbname="test-$dbname"

createUserAndDb