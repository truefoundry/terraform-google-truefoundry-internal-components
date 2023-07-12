resource "google_service_account" "svcfoundry_sa" {
  account_id   = "${var.cluster_name}-svf"
  display_name = "Service account for svcfoundry"
  project      = var.project
}

resource "google_service_account_iam_binding" "svcfoundry_iam_identity" {
  service_account_id = google_service_account.svcfoundry_sa.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[${var.svcfoundry_k8s_namespace}/${var.svcfoundry_k8s_service_account}]"
  ]
}

resource "google_storage_bucket_iam_member" "svcfoundry_bucket_bind" {
  bucket     = var.truefoundry_bucket_name
  role       = "roles/storage.admin"
  member     = "serviceAccount:${google_service_account.svcfoundry_sa.email}"
  depends_on = [google_service_account.svcfoundry_sa]
}

resource "google_project_iam_member" "svcfoundry_storage" {

  member  = "serviceAccount:${google_service_account.svcfoundry_sa.email}"
  project = var.project
  role    = "roles/storage.admin"
}

resource "google_project_iam_member" "svcfoundry_secretmanager" {

  member  = "serviceAccount:${google_service_account.svcfoundry_sa.email}"
  project = var.project
  role    = "roles/secretmanager.admin"
}

resource "google_project_iam_member" "svcfoundry_iam_token" {

  member  = "serviceAccount:${google_service_account.svcfoundry_sa.email}"
  project = var.project
  role    = "roles/iam.serviceAccountTokenCreator"
}