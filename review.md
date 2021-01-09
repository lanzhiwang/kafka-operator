https://github.com/lanzhiwang/kafka-operator/commits/master?after=36f0d408121508822ab3a895c6e1fe2c9ba097a4+769&branch=master

generate the operator skeleton


```bash
go mod init github.com/lanzhiwang/kafka-operator


# Generate code
generate:
	go generate ./pkg/... ./cmd/...

# Run go fmt against code
fmt:
	go fmt ./pkg/... ./cmd/...

# Run go vet against code
vet:
	go vet ./pkg/... ./cmd/...

# Generate manifests e.g. CRD, RBAC etc.
manifests:
	go run vendor/sigs.k8s.io/controller-tools/cmd/controller-gen/main.go all

# Run tests
test: generate fmt vet manifests
	go test ./pkg/... ./cmd/... -coverprofile cover.out

# Build manager binary
manager: generate fmt vet
	go build -o bin/manager github.com/banzaicloud/kafka-operator/cmd/manager



huzhideMacBook-Pro:kafka-operator huzhi$ tree -a cmd/
cmd/
└── manager
    └── main.go  package main

1 directory, 1 file
huzhideMacBook-Pro:kafka-operator huzhi$ tree -a pkg/
pkg/
├── apis
│   ├── addtoscheme_banzaicloud_v1beta1.go  package apis
│   ├── apis.go  package apis
│   └── banzaicloud
│       ├── group.go  package banzaicloud
│       └── v1beta1
│           ├── doc.go  package v1beta1
│           ├── kafkacluster_types.go  package v1beta1
│           ├── kafkacluster_types_test.go  package v1beta1
│           ├── register.go package v1beta1
│           ├── v1beta1_suite_test.go  package v1beta1
│           └── zz_generated.deepcopy.go  package v1beta1
├── controller
│   ├── add_kafkacluster.go  package controller
│   ├── controller.go  package controller
│   └── kafkacluster
│       ├── kafkacluster_controller.go  package kafkacluster
│       ├── kafkacluster_controller_suite_test.go  package kafkacluster
│       └── kafkacluster_controller_test.go  package kafkacluster
└── webhook
    └── webhook.go  package webhooks

6 directories, 15 files
huzhideMacBook-Pro:kafka-operator huzhi$



package main

import (
	"github.com/banzaicloud/kafka-operator/pkg/apis"
		github.com/banzaicloud/kafka-operator/pkg/apis/banzaicloud/v1beta1

	"github.com/banzaicloud/kafka-operator/pkg/controller"
		github.com/banzaicloud/kafka-operator/pkg/controller/kafkacluster
			github.com/banzaicloud/kafka-operator/pkg/apis
			github.com/banzaicloud/kafka-operator/pkg/apis/banzaicloud/v1beta1

	"github.com/banzaicloud/kafka-operator/pkg/webhook"


)




```


package main
	apis.AddToScheme()
	controller.AddToManager(mgr)
	webhook.AddToManager(mgr)

