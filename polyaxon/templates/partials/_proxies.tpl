{{- /*
Proxies envFrom
*/}}
{{- define "config.envFrom.proxies" -}}
- configMapRef:
    name: {{ template "polyaxon.fullname" . }}-proxies-config
{{- end -}}

{{- /*
Proxies hosts
*/}}
{{- define "proxies.gateway.host" -}}
{{- if .Values.externalServices.gateway.host }}
{{- .Values.externalServices.gateway.host }}
{{- else }}
{{- template "polyaxon.fullname" . }}-gateway
{{- end }}
{{- end -}}

{{- define "proxies.gateway.port" -}}
{{- if .Values.externalServices.gateway.host }}
{{- default 443 .Values.externalServices.gateway.port }}
{{- else }}
{{- default 80 .Values.gateway.service.port -}}
{{- end }}
{{- end -}}

{{- define "proxies.gateway.targetPort" -}}
{{- if .Values.externalServices.gateway.host }}
{{- default 443 .Values.externalServices.gateway.port }}
{{- else }}
{{- default 8000 .Values.gateway.service.targetPort -}}
{{- end }}
{{- end -}}

{{- define "proxies.gateway.useResolver" -}}
{{- if .Values.externalServices.gateway.host }}
{{- default "false" .Values.externalServices.gateway.useResolver -}}
{{- else }}
{{- default "false" .Values.gateway.useResolver -}}
{{- end }}
{{- end -}}

{{- define "proxies.gateway.scheme" -}}
{{- if .Values.externalServices.gateway.host }}
{{- if eq ((default 443 .Values.externalServices.gateway.port) | toString) "443" }}
{{- printf "https" -}}
{{- else }}
{{- printf "http" -}}
{{- end }}
{{- else }}
{{- if eq ((default 80 .Values.gateway.service.port) | toString) "443" }}
{{- printf "https" -}}
{{- else }}
{{- printf "http" -}}
{{- end }}
{{- end }}
{{- end -}}

{{- define "proxies.api.host" -}}
{{- if .Values.externalServices.api.host }}
{{- .Values.externalServices.api.host }}
{{- else }}
{{- template "polyaxon.fullname" . }}-gateway
{{- end }}
{{- end -}}

{{- define "proxies.api.port" -}}
{{- if .Values.externalServices.api.host }}
{{- default 443 .Values.externalServices.api.port }}
{{- else }}
{{- default 80 .Values.gateway.service.port -}}
{{- end }}
{{- end -}}

{{- define "proxies.api.targetPort" -}}
{{- if .Values.externalServices.api.host }}
{{- default 443 .Values.externalServices.api.port }}
{{- else }}
{{- default 8000 .Values.gateway.service.targetPort -}}
{{- end }}
{{- end -}}

{{- define "proxies.api.useResolver" -}}
{{- if .Values.externalServices.api.host }}
{{- default "false" .Values.externalServices.api.useResolver -}}
{{- else }}
{{- default "false" .Values.gateway.useResolver -}}
{{- end }}
{{- end -}}

{{- define "proxies.api.scheme" -}}
{{- if .Values.externalServices.api.host }}
{{- if eq ((default 443 .Values.externalServices.api.port) | toString) "443" }}
{{- printf "https" -}}
{{- else }}
{{- printf "http" -}}
{{- end }}
{{- else }}
{{- if eq ((default 80 .Values.gateway.service.port) | toString) "443" }}
{{- printf "https" -}}
{{- else }}
{{- printf "http" -}}
{{- end }}
{{- end }}
{{- end -}}

{{- define "proxies.streams.host" -}}
{{- if .Values.externalServices.streams.host }}
{{- .Values.externalServices.streams.host }}
{{- else }}
{{- template "polyaxon.fullname" . }}-gateway
{{- end }}
{{- .Values.externalServices.streams.host }}
{{- end -}}

{{- define "proxies.streams.port" -}}
{{- if .Values.externalServices.streams.host }}
{{- default 443 .Values.externalServices.streams.port }}
{{- else }}
{{- default 80 .Values.gateway.service.port -}}
{{- end }}
{{- end -}}

{{- define "proxies.streams.targetPort" -}}
{{- if .Values.externalServices.streams.host }}
{{- default 443 .Values.externalServices.streams.port }}
{{- else }}
{{- default 8000 .Values.gateway.service.targetPort -}}
{{- end }}
{{- end -}}

{{- define "proxies.streams.useResolver" -}}
{{- if .Values.externalServices.streams.host }}
{{- default "false" .Values.externalServices.streams.useResolver -}}
{{- else }}
{{- default "false" .Values.gateway.useResolver -}}
{{- end }}
{{- end -}}

{{- define "proxies.streams.scheme" -}}
{{- if .Values.externalServices.streams.host }}
{{- if eq ((default 443 .Values.externalServices.streams.port) | toString) "443" }}
{{- printf "https" -}}
{{- else }}
{{- printf "http" -}}
{{- end }}
{{- else }}
{{- if eq ((default 80 .Values.gateway.service.port) | toString) "443" }}
{{- printf "https" -}}
{{- else }}
{{- printf "http" -}}
{{- end }}
{{- end }}
{{- end -}}

{{- /*
Proxy Host
*/}}
{{- define "proxies.host" -}}
{{- if .Values.gateway.routes.gateway -}}
"{{ template "proxies.gateway.scheme" . }}://{{ template "proxies.gateway.host" . }}:{{ template "proxies.gateway.port" . }}"
{{- else if .Values.gateway.routes.api -}}
"{{ template "proxies.api.scheme" . }}://{{ template "proxies.api.host" . }}:{{ template "proxies.api.port" . }}"
{{- else if .Values.gateway.routes.streams -}}
"{{ template "proxies.streams.scheme" . }}://{{ template "proxies.streams.host" . }}:{{ template "proxies.streams.port" . }}"
{{- else -}}
localhost
{{- end -}}
{{- end -}}
