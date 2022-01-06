{{- /*
Scheduler celery config
*/}}
{{- define "config.scheduler.celery" -}}
{{- if .Values.scheduler.celery.taskTrackStarted }}
- name: POLYAXON_CELERY_TASK_TRACK_STARTED
  value: {{ .Values.scheduler.celery.taskTrackStarted | quote }}
{{- end }}
{{- if .Values.scheduler.celery.brokerPoolLimit }}
- name: POLYAXON_CELERY_BROKER_POOL_LIMIT
  value: {{ .Values.scheduler.celery.brokerPoolLimit | quote }}
{{- end }}
{{- if .Values.scheduler.celery.confirmPublish }}
- name: POLYAXON_CELERY_CONFIRM_PUBLISH
  value: {{ .Values.scheduler.celery.confirmPublish | quote }}
{{- end }}
{{- if .Values.scheduler.celery.workerPrefetchMultiplier }}
- name: POLYAXON_CELERY_WORKER_PREFETCH_MULTIPLIER
  value: {{ .Values.scheduler.celery.workerPrefetchMultiplier | quote }}
{{- end }}
{{- if .Values.scheduler.celery.workerMaxTasksPerChild }}
- name: POLYAXON_CELERY_WORKER_MAX_TASKS_PER_CHILD
  value: {{ .Values.scheduler.celery.workerMaxTasksPerChild | quote }}
{{- end }}
{{- if .Values.scheduler.celery.workerMaxMemoryPerChild }}
- name: POLYAXON_CELERY_WORKER_MAX_MEMORY_PER_CHILD
  value: {{ .Values.scheduler.celery.workerMaxMemoryPerChild | quote }}
{{- end }}
{{- if .Values.scheduler.celery.taskAlwaysEager }}
- name: POLYAXON_CELERY_TASK_ALWAYS_EAGER
  value: {{ .Values.scheduler.celery.taskAlwaysEager | quote }}
{{- end }}
{{- end -}}

{{- /*
Config scheduler scheduling
*/}}
{{- define "config.scheduler.scheduling" -}}
{{- if .Values.scheduler.nodeSelector }}
nodeSelector:
{{ toYaml .Values.scheduler.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.scheduler.affinity }}
affinity:
{{ toYaml .Values.scheduler.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.scheduler.tolerations }}
tolerations:
{{ toYaml .Values.scheduler.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.scheduler.imagePullSecrets" -}}
{{- if .Values.scheduler.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.scheduler.imagePullSecrets }}
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
