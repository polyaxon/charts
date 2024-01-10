{{- /*
Define singleNamespace based on the length of additionalNamespaces
*/}}
{{- define "config.singleNamespace" -}}
{{- if and .Values.agent.additionalNamespaces (gt (len .Values.agent.additionalNamespaces) 0) }}
{{- false -}}
{{- else -}}
{{- true -}}
{{- end -}}
{{- end -}}
