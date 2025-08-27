{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "frontend-middleware.names.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "frontend-middleware.names.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "frontend-middleware.names.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Kubernetes standard labels
*/}}
{{- define "frontend-middleware.labels.standard" -}}
app.kubernetes.io/name: {{ include "frontend-middleware.names.name" . }}
helm.sh/chart: {{ include "frontend-middleware.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Chart.AppVersion }}
app.kubernetes.io/version: {{ . | quote }}
{{- end -}}
{{- end -}}

{{/*
Labels used on immutable fields such as deploy.spec.selector.matchLabels or svc.spec.selector
{{ include "frontend-middleware.labels.matchLabels" -}}

We don't want to loop over custom labels appending them to the selector
since it's very likely that it will break deployments, services, etc.
However, it's important to overwrite the standard labels if the user
overwrote them on metadata.labels fields.
*/}}
{{- define "frontend-middleware.labels.matchLabels" -}}
app.kubernetes.io/name: {{ include "frontend-middleware.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "frontend-middleware.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "frontend-middleware.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "application" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
