#!/bin/bash
bucket="my-test-bucket-qwertyuipo"
key="helloworld"
fin="./files/hello_world_put.txt"
fout="./files/hello_world_get.txt"

if ! [ -f $fin ]
then
    mkdir -p $(dirname $fin) && touch $fin
    echo "Hello World" > $fin
fi

aws s3api create-bucket --bucket $bucket
aws s3api list-buckets
aws s3api put-object --bucket $bucket --key $key --body $fin
aws s3api list-objects-v2 --bucket $bucket
aws s3api get-object --bucket $bucket --key $key $fout
aws s3api delete-object --bucket $bucket --key $key
aws s3api list-objects-v2 --bucket $bucket
aws s3api delete-bucket --bucket $bucket
aws s3api list-buckets