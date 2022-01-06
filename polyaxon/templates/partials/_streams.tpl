{{- /*
Config streams scheduling
*/}}
{{- define "config.streams.scheduling" -}}
{{- if .Values.streams.nodeSelector }}
nodeSelector:
{{ toYaml .Values.streams.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.streams.affinity }}
affinity:
{{ toYaml .Values.streams.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.streams.tolerations }}
tolerations:
{{ toYaml .Values.streams.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.streams.imagePullSecrets" -}}
{{- if .Values.streams.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.streams.imagePullSecrets }}
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
