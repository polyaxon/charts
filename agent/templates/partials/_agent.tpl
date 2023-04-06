{{- /*
Agent envFrom
*/}}
{{- define "config.envFrom.agent" -}}
- configMapRef:
    name: {{ template "polyaxon.fullname" . }}-agent-config
{{- if .Values.agentSecret }}
- secretRef:
    name: {{ .Values.agentSecret }}
{{- else if .Values.agent.token }}
- secretRef:
    name: {{ template "polyaxon.fullname" . }}-agent-secret
{{- end }}
{{- end -}}

{{- /*
Agent checksum
*/}}
{{- define "config.checksum.agent" -}}
checksum/common-config: {{ include (print $.Template.BasePath "/common-cm.yaml") . | sha256sum }}
checksum/agent-config: {{ include (print $.Template.BasePath "/agent-cm.yaml") . | sha256sum }}
checksum/proxies-config: {{ include (print $.Template.BasePath "/proxies-cm.yaml") . | sha256sum }}
{{- if (not .Values.secret) }}
checksum/agent-secrets: {{ include (print $.Template.BasePath "/agent-secrets.yaml") . | sha256sum }}
{{- end }}
{{- end -}}

{{- /*
service account
*/}}
{{- define "config.agent.sa" -}}
{{- if and .Values.rbac.enabled (or .Values.agent.enabled (not .Values.organizationKey)) }}
serviceAccountName: {{ template "polyaxon.fullname" . }}-agent-sa
{{- end }}
{{- end -}}

{{- /*
Config agent scheduling
*/}}
{{- define "config.agent.scheduling" -}}
{{- if .Values.agent.nodeSelector }}
nodeSelector:
{{ toYaml .Values.agent.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.agent.affinity }}
affinity:
{{ toYaml .Values.agent.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.agent.tolerations }}
tolerations:
{{ toYaml .Values.agent.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.agent.imagePullSecrets" -}}
{{- if .Values.agent.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.agent.imagePullSecrets }}
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

{{- define "config.agent.priorityClassName" -}}
{{- if .Values.agent.priorityClassName }}
priorityClassName: {{ .Values.agent.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.agent.annotations" -}}
{{- if .Values.agent.annotations }}
{{ toYaml .Values.agent.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.agent.labels" -}}
{{- if .Values.agent.labels }}
{{ toYaml .Values.agent.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}
