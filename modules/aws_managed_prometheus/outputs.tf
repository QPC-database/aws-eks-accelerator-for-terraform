
//output "amp_workspace_arn" {
//  description = "Prometheus workspace ARN"
//  value       = aws_prometheus_workspace.amp_workspace.arn
//}

output "service_account_amp_ingest_role_arn" {
  value = aws_iam_role.service_account_amp_ingest_role.arn
}

output "service_account_amp_query_role_arn" {
  value = aws_iam_role.service_account_amp_query_role.arn
}

output "amp_workspace_id" {
  description = "Prometheus workspace ID"
    value       = aws_prometheus_workspace.amp_workspace.id
//  value       = concat(aws_prometheus_workspace.amp_workspace.*.id, [""])[0]
}
