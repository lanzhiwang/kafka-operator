https://github.com/lanzhiwang/kafka-operator/commits/master?before=36f0d408121508822ab3a895c6e1fe2c9ba097a4+595&branch=master

Use the latest kubebuilder v2.0.0

```
# Install kubebuilder
install-kubebuilder:
	@ if ! which bin/kubebuilder/bin/kubebuilder &>/dev/null; then\
		scripts/install_kubebuilder.sh;\
	fi

# find or download controller-gen
CONTROLLER_GEN=/Users/huzhi/go/bin/controller-gen

# Generate code
generate
	$(CONTROLLER_GEN) object:headerFile=./hack/boilerplate.go.txt paths="./..."

/Users/huzhi/go/bin/controller-gen object:headerFile=./hack/boilerplate.go.txt paths="./..."

# Run go fmt against code
fmt:
	go fmt ./...

# Run go vet against code
vet:
	go vet ./...

# Generate manifests e.g. CRD, RBAC etc.
manifests
	$(CONTROLLER_GEN) $(CRD_OPTIONS) rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases

/Users/huzhi/go/bin/controller-gen crd:trivialVersions=true rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases

# Run tests
test
	KUBEBUILDER_ASSETS="$${PWD}/bin/kubebuilder/bin" go test ./... -coverprofile cover.out

# Build manager binary
manager
	go build -o bin/manager main.go


$ tree -a api
api
└── v1alpha1
    ├── common_types.go  package v1alpha1
    ├── groupversion_info.go  package v1alpha1
    ├── kafkacluster_types.go  package v1alpha1
    └── zz_generated.deepcopy.go  package v1alpha1

1 directory, 4 files
$
$ tree -a controllers
controllers
├── alertmanager_controller.go  package controllers
├── kafkacluster_controller.go  package controllers
└── suite_test.go  package controllers

0 directories, 3 files
$
$ tree -a internal
internal
└── alertmanager
    ├── app.go  package alertmanager
    ├── currentalert
    │   ├── current_alerts.go  package currentalert
    │   ├── current_alerts_test.go  package currentalert
    │   └── process.go  package currentalert
    ├── dispatcher
    │   └── dispatcher.go  package dispatcher
    └── receiver
        ├── http_handler.go  package receiver
        └── receiver.go  package receiver

4 directories, 7 files
$
$ tree -a pkg
pkg
├── k8sutil
│   ├── cr.go  package k8sutil
│   ├── resource.go package k8sutil
│   ├── status.go  package k8sutil
│   └── zoneandregion.go  package k8sutil
├── resources
│   ├── cruisecontrol
│   │   ├── configmap.go  package cruisecontrol
│   │   ├── cruisecontrol.go  package cruisecontrol
│   │   ├── deployment.go  package cruisecontrol
│   │   ├── service.go  package cruisecontrol
│   │   └── topicManager.go  package cruisecontrol
│   ├── cruisecontrolmonitoring
│   │   ├── configmap.go  package cruisecontrolmonitoring
│   │   └── cruisecontrol_monitoring.go  package cruisecontrolmonitoring
│   ├── envoy
│   │   ├── build
│   │   │   ├── Dockerfile
│   │   │   └── docker-entrypoint.sh
│   │   ├── configmap.go  package envoy
│   │   ├── deployment.go package envoy
│   │   ├── envoy.go  package envoy
│   │   └── loadbalancer.go  package envoy
│   ├── kafka
│   │   ├── allBrokerService.go  package kafka
│   │   ├── configmap.go  package kafka
│   │   ├── headlessService.go  package kafka
│   │   ├── kafka.go  package kafka
│   │   ├── pod.go  package kafka
│   │   ├── pvc.go  package kafka
│   │   └── service.go  package kafka
│   ├── kafkamonitoring
│   │   ├── configmap.go  package kafkamonitoring
│   │   └── kafka_monitoring.go  package kafkamonitoring
│   ├── reconciler.go  package resources
│   └── templates
│       └── templates.go package templates
├── scale
│   └── scale.go  package scale
└── util
    ├── backoff
    │   ├── backoff.go  package backoff
    │   └── backoff_config.go  package backoff
    └── util.go  package util

12 directories, 32 files
$

```


