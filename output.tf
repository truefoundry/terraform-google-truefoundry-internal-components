output "mlfoundry_sa_name" {
  value = google_service_account.mlfoundry_sa.name
}

output "mlfoundry_sa_email" {
  value = google_service_account.mlfoundry_sa.email
}

output "svcfoundry_sa_name" {
  value = google_service_account.svcfoundry_sa.name
}

output "svcfoundry_sa_email" {
  value = google_service_account.svcfoundry_sa.email
}