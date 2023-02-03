{{- define "rabbitmq.fullname" -}}
{{- $name := default "rabbitmq" -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rabbitmq.host" -}}
{{- if .Values.rabbitmq.enabled }}
{{- template "rabbitmq.fullname" . }}
{{- else }}
{{- .Values.externalServices.rabbitmq.host }}
{{- end }}
{{- end -}}

{{- define "rabbitmq.port" -}}
{{- if .Values.rabbitmq.enabled }}
{{- default 5672 .Values.rabbitmq.service.port -}}
{{- else }}
{{- default 5672 .Values.externalServices.rabbitmq.port }}
{{- end }}
{{- end -}}

{{- define "rabbitmq.user" -}}
{{- if .Values.rabbitmq.enabled }}
{{- default "" .Values.rabbitmq.auth.username -}}
{{- else }}
{{- default "" .Values.externalServices.rabbitmq.user }}
{{- end }}
{{- end -}}
