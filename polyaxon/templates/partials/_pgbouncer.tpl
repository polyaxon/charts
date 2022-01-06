{{- /*
Config pgbouncer scheduling
*/}}
{{- define "config.pgbouncer.scheduling" -}}
{{- if .Values.pgbouncer.nodeSelector }}
nodeSelector:
{{ toYaml .Values.pgbouncer.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.pgbouncer.affinity }}
affinity:
{{ toYaml .Values.pgbouncer.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.pgbouncer.tolerations }}
tolerations:
{{ toYaml .Values.pgbouncer.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.pgbouncer.imagePullSecrets" -}}
{{- if .Values.pgbouncer.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.pgbouncer.imagePullSecrets }}
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
