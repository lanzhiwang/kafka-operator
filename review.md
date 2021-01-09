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

```


