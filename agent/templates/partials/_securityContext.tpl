{{- /*
Config pod securityContext
*/}}
{{- define "securityContext.pod" -}}
{{- if .Values.securityContext.enabled }}
securityContext:
{{- if .Values.securityContext.user }}
  runAsUser: {{ .Values.securityContext.user }}
{{- else }}
  runAsUser: {{ .Values.securityContext.runAsUser }}
{{- end }}
{{- if .Values.securityContext.group }}
  runAsGroup: {{ .Values.securityContext.group }}
{{- else }}
  runAsGroup: {{ .Values.securityContext.runAsGroup }}
{{- end }}
  fsGroup: {{ .Values.securityContext.fsGroup }}
{{- if .Values.securityContext.fsGroupChangePolicy }}
  fsGroupChangePolicy: {{ .Values.securityContext.fsGroupChangePolicy }}
{{- end }}
{{- end }}
{{- end -}}


{{- /*
Config container securityContext
*/}}
{{- define "securityContext.container" -}}
{{- if .Values.securityContext.enabled }}
securityContext:
  allowPrivilegeEscalation: {{ .Values.securityContext.allowPrivilegeEscalation }}
  runAsNonRoot: {{ .Values.securityContext.runAsNonRoot }}
{{- end }}
{{- end -}}
