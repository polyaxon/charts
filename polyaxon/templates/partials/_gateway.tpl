{{- /*
Config gateway scheduling
*/}}
{{- define "config.gateway.scheduling" -}}
{{- if .Values.gateway.nodeSelector }}
nodeSelector:
{{ toYaml .Values.gateway.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.gateway.affinity }}
affinity:
{{ toYaml .Values.gateway.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.gateway.tolerations }}
tolerations:
{{ toYaml .Values.gateway.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.gateway.imagePullSecrets" -}}
{{- if .Values.gateway.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.gateway.imagePullSecrets }}
  - name: {{ . }}
{{- end }}
{{- else }}
{{- if .Values.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.imagePullSecrets }}
  - name: {{ . }}
{{- end }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.gateway.priorityClassName" -}}
{{- if .Values.gateway.priorityClassName }}
priorityClassName: {{ .Values.gateway.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.gateway.annotations" -}}
{{- if .Values.gateway.annotations }}
{{ toYaml .Values.gateway.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.gateway.labels" -}}
{{- if .Values.gateway.labels }}
{{ toYaml .Values.gateway.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.gateway.platformHost" -}}
{{- if eq .Values.gateway.service.type "NodePort" -}}
http://{{ template "polyaxon.fullname" . }}-gateway.{{ .Release.Namespace }}.svc.{{ .Values.dns.customCluster }}:{{ .Values.gateway.service.nodePort }}
{{- else -}}
http://{{ template "polyaxon.fullname" . }}-gateway.{{ .Release.Namespace }}.svc.{{ .Values.dns.customCluster }}:{{ .Values.gateway.service.port }}
{{- end -}}
{{- end -}}
