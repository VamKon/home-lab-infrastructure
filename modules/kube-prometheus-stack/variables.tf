variable "kube_prometheus_alert_manager_slack_webhook_url" {
  description = "Slack webhook URL for Alertmanager"
  type        = string
  sensitive   = true
}
