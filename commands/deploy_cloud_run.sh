
# Deploy your worker as a service
gcloud run deploy prefect-worker --image=prefecthq/prefect:2-latest \
    --set-env-vars PREFECT_API_URL=$PREFECT_API_URL,PREFECT_API_KEY=$PREFECT_API_KEY \
    --service-account <YOUR-SERVICE-ACCOUNT-NAME> \
    --no-cpu-throttling \
    --min-instances 1 \
    --args "prefect","worker","start","--install-policy","always","--with-healthcheck","-p","<WORK-POOL-NAME>","-t","cloud-run"


