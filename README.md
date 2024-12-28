# sample_cloud_formation

EC2にアクセスするためのkeyペアは事前に作成しておく。
```bash
$ tree
.
├── Makefile
├── README.md
├── altair-key.pem
└── infrastructure.yaml

0 directories, 4 files
```

```bash
$ make create
aws cloudformation create-stack \
        --stack-name sample-aws-stack \
        --template-body file://01_create_network.yaml \
        --region ap-northeast-1 \
        --profile miyabiii_terraform | jq .
{
  "StackId": "arn:aws:cloudformation:ap-northeast-1:xxxxxxxxxxxx:stack/sample-aws-stack/4fab60b0-c4de-11ef-bc9e-0aab0e5be0e7"
}
```
