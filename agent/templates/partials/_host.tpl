{{- /*
Config host name
*/}}
{{- define "config.platformHost" -}}
{{- if .Values.ingress.enabled -}}
{{- .Values.ingress.hostName | quote }}
{{- else -}}
{{- if .Values.hostName -}}
{{- .Values.hostName | quote }}
{{- else -}}
{{- template "config.gateway.platformHost" . }}
{{- end -}}
{{- end -}}
{{- end -}}

{{- /*
local IP hosts config
*/}}
{{- define "config.hostIps" -}}
{{- if .Values.includeHostIps }}
- name: POLYAXON_POD_IP
  valueFrom:
    fieldRef:
      fieldPath: status.podIP
- name: POLYAXON_HOST_IP
  valueFrom:
    fieldRef:
      fieldPath: status.hostIP
{{- end }}
{{- end -}}
