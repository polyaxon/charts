{{- /*
Config beat scheduling
*/}}
{{- define "config.beat.scheduling" -}}
{{- if .Values.beat.nodeSelector }}
nodeSelector:
{{ toYaml .Values.beat.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.beat.affinity }}
affinity:
{{ toYaml .Values.beat.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.beat.tolerations }}
tolerations:
{{ toYaml .Values.beat.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.beat.imagePullSecrets" -}}
{{- if .Values.beat.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.beat.imagePullSecrets }}
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

{{- define "config.beat.priorityClassName" -}}
{{- if .Values.beat.priorityClassName }}
priorityClassName: {{ .Values.beat.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.beat.annotations" -}}
{{- if .Values.beat.annotations }}
{{ toYaml .Values.beat.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.beat.labels" -}}
{{- if .Values.beat.labels }}
{{ toYaml .Values.beat.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}
