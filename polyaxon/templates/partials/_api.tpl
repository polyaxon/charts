{{- /*
Config api scheduling
*/}}
{{- define "config.api.scheduling" -}}
{{- if .Values.api.nodeSelector }}
nodeSelector:
{{ toYaml .Values.api.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.api.affinity }}
affinity:
{{ toYaml .Values.api.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.api.tolerations }}
tolerations:
{{ toYaml .Values.api.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.api.imagePullSecrets" -}}
{{- if .Values.api.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.api.imagePullSecrets }}
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
