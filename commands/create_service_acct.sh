
# Create the infrastructure service account
gcloud iam service-accounts create infra-service-account \
    --description="Service account to use for the terraform client." \
    --display-name="infra-service-account"

# Create the pipeline service account
gcloud iam service-accounts create prefect-service-account \
    --description="Service account to use for the prefect worker." \
    --display-name="prefect-service-account"

#  service account has the proper permissions to execute flow runs as Cloud Run jobs
gcloud projects add-iam-policy-binding music-streaming-project-444609 \
    --member="serviceAccount:prefect-service-account@music-streaming-project-444609.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"

gcloud projects add-iam-policy-binding music-streaming-project-444609 \
    --member="serviceAccount:prefect-service-account@music-streaming-project-444609.iam.gserviceaccount.com" \
    --role="roles/run.admin"
    