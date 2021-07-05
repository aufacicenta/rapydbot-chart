{{/*
Expand the name of the chart.
*/}}
{{- define "rapydbot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rapydbot.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rapydbot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rapydbot.labels" -}}
helm.sh/chart: {{ include "rapydbot.chart" . }}
{{ include "rapydbot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rapydbot.selectorLabels" -}}
#app.kubernetes.io/name: {{ include "rapydbot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if contains "wallet" .Template.Name }}
app.kubernetes.io/name: {{ printf "%s-%s" .Release.Name "wallet" }}
{{ else if contains "user" .Template.Name }}
app.kubernetes.io/name: {{ printf "%s-%s" .Release.Name "user" }}
{{ else if contains "bot" .Template.Name }}
app.kubernetes.io/name: {{ printf "%s-%s" .Release.Name "bot" }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rapydbot.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rapydbot.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}