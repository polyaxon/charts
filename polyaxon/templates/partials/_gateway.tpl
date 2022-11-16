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

{{- define "config.gateway.platformHost" -}}
{{- if eq .Values.gateway.service.type "NodePort" -}}
http://{{ template "polyaxon.fullname" . }}-gateway:{{ .Values.gateway.service.nodePort }}
{{- else -}}
http://{{ template "polyaxon.fullname" . }}-gateway:{{ .Values.gateway.service.port }}
{{- end -}}
{{- end -}}
