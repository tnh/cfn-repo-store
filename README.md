# cfn-repo-store

This creates a cloudformation yaml that generates an S3 bucket with cross account perms.

The purpose of this bucket is to store cloudformation configs to be used in a multi account strategy


## step 1 - set up this bucket

- set up this bucket via your ci system

## step 2 - publish subsequent cloudformation files to this bucket in your build step

- Publish content into this bucket
- Use the `template-url` api  to deploy from the artefact

```
aws s3 cp some-project-deploy.yaml s3://{bucket-created-by-this}/<project>/<buildid>/deploy.yaml
aws cloudformation create-stack --stack-namme somestack --template-url http://url-for-the-bucket

```

