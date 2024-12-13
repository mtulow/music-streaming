
# Create the pipeline service account
gcloud iam service-accounts create <prefect-service-account> \
    --description="Service account to use for the prefect worker." \
    --display-name="prefect-service-account"

#  service account has the proper permissions to execute flow runs as Cloud Run jobs
gcloud projects add-iam-policy-binding <PROJECT-ID> \
    --member="serviceAccount:<SERVICE-ACCOUNT-NAME>@<PROJECT-ID>.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"

gcloud projects add-iam-policy-binding <PROJECT-ID> \
    --member="serviceAccount:<SERVICE-ACCOUNT-NAME>@<PROJECT-ID>.iam.gserviceaccount.com" \
    --role="roles/run.admin"
    