#!/bin/bash

echo "Mongo admin $ROOT_USER:$ROOT_PWD"
echo "Creating new mongo db: $APP_DB"
echo "Creating new mongo user"
echo "username: $APP_USER"
echo "password: $APP_PWD"

mongo admin -u $ROOT_USER -p $ROOT_PWD --eval "db.getSiblingDB('$APP_DB').createUser({user: '$APP_USER', pwd: '$APP_PWD', roles: [{role: 'readWrite', db: '$APP_DB'}]});"

echo "Creating new mongo db: test-$APP_DB"
echo "Creating new mongo user"
echo "username: test-$APP_USER"
echo "password: $APP_PWD"

mongo admin -u $ROOT_USER -p $ROOT_PWD --eval "db.getSiblingDB('test-$APP_DB').createUser({user: 'test-$APP_USER', pwd: '$APP_PWD', roles: [{role: 'readWrite', db: 'test-$APP_DB'}]});"
