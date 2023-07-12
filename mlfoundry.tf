resource "google_service_account" "mlfoundry_sa" {
  account_id   = "${var.cluster_name}-mlf"
  display_name = "Service account for mlfoundry"
  project      = var.project
}

resource "google_service_account_iam_binding" "mlfoundry_iam_identity" {
  service_account_id = google_service_account.mlfoundry_sa.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[${var.mlfoundry_k8s_namespace}/${var.mlfoundry_k8s_service_account}]"
  ]
}

resource "google_storage_bucket_iam_member" "mlfoundry_bucket_bind" {
  bucket     = var.truefoundry_bucket_name
  role       = "roles/storage.admin"
  member     = "serviceAccount:${google_service_account.mlfoundry_sa.email}"
  depends_on = [google_service_account.mlfoundry_sa]
}

resource "google_project_iam_member" "mlfoundry_iam_token" {

  member  = "serviceAccount:${google_service_account.mlfoundry_sa.email}"
  project = var.project
  role    = "roles/iam.serviceAccountTokenCreator"
}