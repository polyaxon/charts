{{- /*
Ingress
*/}}
{{- define "config.ingress.backend" -}}
pathType: {{ default "Prefix" .Values.ingress.pathType }}
backend:
  service:
    name: {{ template "polyaxon.fullname" . }}-gateway
    port:
      number: {{ .Values.gateway.service.port }}
{{- end -}}
