{{- /*
Config connections volumes/mounts/secrets/configmap
*/}}
{{- define "config.connections.envFrom" -}}
{{- if and .Values.mountConnections .Values.connections -}}
{{- $context := . -}}
{{- range $c := .Values.connections }}
{{- if and (not $c.isAlias) (has $c.name $context.Values.mountConnections) }}
{{- if $c.secret }}
{{- if (empty $c.secret.mountPath) }}
- secretRef:
    name: {{ $c.secret.name | quote }}
{{- end }} {{- /* endif */ -}}
{{- end }} {{- /* endif */ -}}
{{- if $c.configMap }}
{{- if (empty $c.configMap.mountPath) }}
- configMapRef:
    name: {{ $c.configMap.name | quote }}
{{- end }} {{- /* endif */ -}}
{{- end }} {{- /* endif */ -}}
{{- end }}
{{- end }} {{- /* endrange connections */ -}}
{{- end }} {{- /* endif mountConnections */ -}}
{{- end -}} {{- /* end def connections envFrom */ -}}

{{- define "config.connections.env" -}}
{{- if and .Values.mountConnections .Values.connections -}}
{{- $context := . -}}
{{- range $c := .Values.connections }}
{{- if and (not $c.isAlias) (has $c.name $context.Values.mountConnections) }}
{{- if $c.env }}
{{ toYaml $c.env }}
{{- end }} {{- /* endif */ -}}
{{- end }}
{{- end }} {{- /* endrange connections */ -}}
{{- end }} {{- /* endif mountConnections */ -}}
{{- end -}} {{- /* end def connections envFrom */ -}}

{{- define "config.connections.mounts" -}}
{{- if and .Values.mountConnections .Values.connections -}}
{{- $context := . -}}
{{- range $c := .Values.connections }}
{{- if and (not $c.isAlias) (has $c.name $context.Values.mountConnections) }}
{{- if or (eq $c.kind "host_path") (eq $c.kind "volume_claim") }}
- mountPath: {{ $c.schema.mountPath | quote }}
  name: {{ $c.name }}
  {{ if $c.schema.subPath -}}
  subPath: {{ $c.schema.subPath | quote }}
  {{- end }}
{{- end }}
{{- if $c.secret }}
{{- if $c.secret.mountPath }}
- mountPath: {{ $c.secret.mountPath | quote }}
  name: {{ $c.secret.name | quote }}
  readOnly: true
{{- end }}
{{- end }}
{{- if $c.configMap }}
{{- if $c.configMap.mountPath }}
- mountPath: {{ $c.configMap.mountPath | quote }}
  name: {{ $c.configMap.name | quote }}
  readOnly: true
{{- end }}
{{- end }}
{{- end }}
{{- end }} {{- /* endrange connections */ -}}
{{- end }} {{- /* endif mountConnections */ -}}
{{- end -}} {{- /* end def connections volume mounts */ -}}

{{- define "config.connections.volumes" -}}
{{- if and .Values.mountConnections .Values.connections -}}
{{- $context := . -}}
{{- range $c := .Values.connections }}
{{- if and (not $c.isAlias) (has $c.name $context.Values.mountConnections) }}
{{- if or (eq $c.kind "host_path") (eq $c.kind "volume_claim") }}
- name: {{ $c.name }}
{{- if eq $c.kind "volume_claim" }}
  persistentVolumeClaim:
    claimName: {{ $c.schema.volumeClaim | quote }}
{{- else }}
  hostPath:
    path: {{ $c.schema.hostPath | quote }}
{{- end }} {{- /* end store check */ -}}
{{- end }}
{{- if $c.secret }}
{{- if $c.secret.mountPath }}
- name: {{ $c.secret.name | quote }}
  secret:
    secretName: {{ $c.secret.name | quote }}
{{- end }}
{{- end }}
{{- if $c.configMap }}
{{- if $c.configMap.mountPath }}
- name: {{ $c.configMap.name | quote }}
  configMap:
    name: {{ $c.configMap.name | quote }}
{{- end }}
{{- end }}
{{- end }}
{{- end }} {{- /* endrange connections */ -}}
{{- end }} {{- /* endif mountConnections */ -}}
{{- end -}}  {{- /* end def connections volume mounts */ -}}
