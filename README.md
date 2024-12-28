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


実行例:
```bash
$ make create-stack
aws cloudformation create-stack \
        --stack-name altair-infrastructure-stack \
        --region ap-northeast-1 \
        --template-body file://infrastructure.yaml \
        --parameters ParameterKey=KeyName,ParameterValue=<your-key-pair> \
                    ParameterKey=ImageId,ParameterValue=ami-0ab02459752898a60 \
        --on-failure DELETE | jq .
{
  "StackId": "arn:aws:cloudformation:ap-northeast-1:xxxxxxxxxxxx:stack/altair-infrastructure-stack/922bb320-c4ef-11ef-98ba-0e6bd735f2d3"
}
```
