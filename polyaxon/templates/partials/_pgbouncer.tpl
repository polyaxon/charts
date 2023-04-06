{{- /*
Config pgbouncer scheduling
*/}}
{{- define "config.pgbouncer.scheduling" -}}
{{- if .Values.externalServices.postgresql.pgbouncer }}
{{- if .Values.externalServices.postgresql.pgbouncer.nodeSelector }}
nodeSelector:
{{ toYaml .Values.externalServices.postgresql.pgbouncer.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.externalServices.postgresql.pgbouncer.affinity }}
affinity:
{{ toYaml .Values.externalServices.postgresql.pgbouncer.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.externalServices.postgresql.pgbouncer.tolerations }}
tolerations:
{{ toYaml .Values.externalServices.postgresql.pgbouncer.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.pgbouncer.imagePullSecrets" -}}
{{- if .Values.externalServices.postgresql.pgbouncer }}
{{- if .Values.externalServices.postgresql.pgbouncer.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.externalServices.postgresql.pgbouncer.imagePullSecrets }}
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
{{- end }}
{{- end -}}

{{- define "config.pgbouncer.priorityClassName" -}}
{{- if .Values.pgbouncer.priorityClassName }}
priorityClassName: {{ .Values.pgbouncer.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.pgbouncer.annotations" -}}
{{- if .Values.pgbouncer.annotations }}
{{ toYaml .Values.pgbouncer.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.pgbouncer.labels" -}}
{{- if .Values.pgbouncer.labels }}
{{ toYaml .Values.pgbouncer.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}
