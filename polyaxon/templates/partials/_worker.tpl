{{- /*
Worker celery config
*/}}
{{- define "config.worker.celery" -}}
{{- if .Values.worker.celery.taskTrackStarted }}
- name: POLYAXON_CELERY_TASK_TRACK_STARTED
  value: {{ .Values.worker.celery.taskTrackStarted | quote }}
{{- end }}
{{- if .Values.worker.celery.brokerPoolLimit }}
- name: POLYAXON_CELERY_BROKER_POOL_LIMIT
  value: {{ .Values.worker.celery.brokerPoolLimit | quote }}
{{- end }}
{{- if .Values.worker.celery.confirmPublish }}
- name: POLYAXON_CELERY_CONFIRM_PUBLISH
  value: {{ .Values.worker.celery.confirmPublish | quote }}
{{- end }}
{{- if .Values.worker.celery.workerPrefetchMultiplier }}
- name: POLYAXON_CELERY_WORKER_PREFETCH_MULTIPLIER
  value: {{ .Values.worker.celery.workerPrefetchMultiplier | quote }}
{{- end }}
{{- if .Values.worker.celery.workerMaxTasksPerChild }}
- name: POLYAXON_CELERY_WORKER_MAX_TASKS_PER_CHILD
  value: {{ .Values.worker.celery.workerMaxTasksPerChild | quote }}
{{- end }}
{{- if .Values.worker.celery.workerMaxMemoryPerChild }}
- name: POLYAXON_CELERY_WORKER_MAX_MEMORY_PER_CHILD
  value: {{ .Values.worker.celery.workerMaxMemoryPerChild | quote }}
{{- end }}
{{- if .Values.worker.celery.taskAlwaysEager }}
- name: POLYAXON_CELERY_TASK_ALWAYS_EAGER
  value: {{ .Values.worker.celery.taskAlwaysEager | quote }}
{{- end }}
{{- end -}}

{{- /*
Config worker scheduling
*/}}
{{- define "config.worker.scheduling" -}}
{{- if .Values.worker.nodeSelector }}
nodeSelector:
{{ toYaml .Values.worker.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.worker.affinity }}
affinity:
{{ toYaml .Values.worker.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.worker.tolerations }}
tolerations:
{{ toYaml .Values.worker.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.worker.imagePullSecrets" -}}
{{- if .Values.worker.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.worker.imagePullSecrets }}
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

{{- define "config.worker.priorityClassName" -}}
{{- if .Values.worker.priorityClassName }}
priorityClassName: {{ .Values.worker.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.worker.annotations" -}}
{{- if .Values.worker.annotations }}
{{ toYaml .Values.worker.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.worker.labels" -}}
{{- if .Values.worker.labels }}
{{ toYaml .Values.worker.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}
