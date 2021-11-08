{{- /*
Config pod securityContext
*/}}
{{- define "securityContext.pod" -}}
{{- if .Values.securityContext.enabled }}
securityContext:
  runAsUser: {{ .Values.securityContext.user }}
  runAsGroup: {{ .Values.securityContext.group }}
  fsGroup: {{ .Values.securityContext.fs }}
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
