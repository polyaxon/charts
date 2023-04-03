{{- /*
Config annotations common pod
*/}}
{{- define "config.annotations.custom" -}}
{{- with .Values.annotations }}
{{- toYaml . }}
{{- end }}
{{- end -}}
