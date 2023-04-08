{{- /*
Manager
*/}}
{{- define "config.envs.manage" -}}
- name: POLYAXON_MANAGE
  value: "true"
{{- end -}}

{{- /*
Db no check flag
*/}}
{{- define "config.envs.dbNoCheck" -}}
- name: POLYAXON_DB_NO_CHECK
  value: "true"
{{- end -}}
