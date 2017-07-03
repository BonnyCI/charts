{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create hostnames for zookeeper hosts that were defined via dependency.
*/}}
{{/*
{{- define "zookeeperServers" -}}
{{- $relName := .Release.Name  }}
{{- range $i := until (default 3 .Values.myimport.zookeeper.serverCount | int) }}
      - host: {{ printf "zk-%s" $relName | trunc 24 }}-{{ $i }}.{{ printf "zk-hsvc-%s" $relName  | trunc 24 }}
        port: 2181
{{- end }}
{{- end -}}
*/}}
