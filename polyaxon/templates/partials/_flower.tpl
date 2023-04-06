{{- /*
Config flower scheduling
*/}}
{{- define "config.flower.scheduling" -}}
{{- if .Values.flower.nodeSelector }}
nodeSelector:
{{ toYaml .Values.flower.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.flower.affinity }}
affinity:
{{ toYaml .Values.flower.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.flower.tolerations }}
tolerations:
{{ toYaml .Values.flower.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.flower.imagePullSecrets" -}}
{{- if .Values.flower.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.flower.imagePullSecrets }}
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

{{- define "config.flower.priorityClassName" -}}
{{- if .Values.flower.priorityClassName }}
priorityClassName: {{ .Values.flower.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.flower.annotations" -}}
{{- if .Values.flower.annotations }}
{{ toYaml .Values.flower.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.flower.labels" -}}
{{- if .Values.flower.labels }}
{{ toYaml .Values.flower.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}
