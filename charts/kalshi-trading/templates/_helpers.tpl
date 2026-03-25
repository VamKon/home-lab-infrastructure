{{/*
Common label helpers
*/}}

{{- define "kalshi.labels" -}}
app.kubernetes.io/managed-by: Helm
app.kubernetes.io/instance: {{ .Release.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "kalshi.backend.selectorLabels" -}}
app: kalshi-backend
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "kalshi.streamlit.selectorLabels" -}}
app: kalshi-streamlit
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "kalshi.postgres.selectorLabels" -}}
app: kalshi-postgres
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
