{{- /*
apiHooks
*/}}
{{- define "config.apiHooks.image" -}}
{{- default .Values.gateway.image .Values.apiHooks.image -}}
{{- end -}}

{{- define "config.apiHooks.imageTag" -}}
{{- default .Values.gateway.imageTag .Values.apiHooks.imageTag -}}
{{- end -}}

{{- define "config.apiHooks.imagePullPolicy" -}}
{{- default .Values.gateway.imagePullPolicy .Values.apiHooks.imagePullPolicy -}}
{{- end -}}
