local k = import 'ksonnet/ksonnet.beta.3/k.libsonnet';
local configMapList = k.core.v1.configMapList;

(import 'prometheus.libsonnet') +
(import 'noobaa-mixins/mixin.libsonnet') + {
  kubePrometheus+:: {
    namespace: k.core.v1.namespace.new($._config.namespace),
    name: 'prometheus-noobaa-rules',
  },
} + {
  _config+:: {
    namespace: 'default',

    prometheus+:: {
      rules: $.prometheusRules + $.prometheusAlerts,
    },
  },
}
