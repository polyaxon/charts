{{- /*
Compiler celery config
*/}}
{{- define "config.compiler.celery" -}}
{{- if .Values.compiler.celery.taskTrackStarted }}
- name: POLYAXON_CELERY_TASK_TRACK_STARTED
  value: {{ .Values.compiler.celery.taskTrackStarted | quote }}
{{- end }}
{{- if .Values.compiler.celery.brokerPoolLimit }}
- name: POLYAXON_CELERY_BROKER_POOL_LIMIT
  value: {{ .Values.compiler.celery.brokerPoolLimit | quote }}
{{- end }}
{{- if .Values.compiler.celery.confirmPublish }}
- name: POLYAXON_CELERY_CONFIRM_PUBLISH
  value: {{ .Values.compiler.celery.confirmPublish | quote }}
{{- end }}
{{- if .Values.compiler.celery.workerPrefetchMultiplier }}
- name: POLYAXON_CELERY_WORKER_PREFETCH_MULTIPLIER
  value: {{ .Values.compiler.celery.workerPrefetchMultiplier | quote }}
{{- end }}
{{- if .Values.compiler.celery.workerMaxTasksPerChild }}
- name: POLYAXON_CELERY_WORKER_MAX_TASKS_PER_CHILD
  value: {{ .Values.compiler.celery.workerMaxTasksPerChild | quote }}
{{- end }}
{{- if .Values.compiler.celery.workerMaxMemoryPerChild }}
- name: POLYAXON_CELERY_WORKER_MAX_MEMORY_PER_CHILD
  value: {{ .Values.compiler.celery.workerMaxMemoryPerChild | quote }}
{{- end }}
{{- if .Values.compiler.celery.taskAlwaysEager }}
- name: POLYAXON_CELERY_TASK_ALWAYS_EAGER
  value: {{ .Values.compiler.celery.taskAlwaysEager | quote }}
{{- end }}
{{- end -}}

{{- /*
Config compiler scheduling
*/}}
{{- define "config.compiler.scheduling" -}}
{{- if .Values.compiler.nodeSelector }}
nodeSelector:
{{ toYaml .Values.compiler.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.compiler.affinity }}
affinity:
{{ toYaml .Values.compiler.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.compiler.tolerations }}
tolerations:
{{ toYaml .Values.compiler.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.compiler.imagePullSecrets" -}}
{{- if .Values.compiler.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.compiler.imagePullSecrets }}
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
