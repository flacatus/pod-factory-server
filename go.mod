module github.com/PodatorFactory/pod-factory-server

go 1.14

require (
	github.com/coreos/etcd v3.3.10+incompatible
	github.com/gorilla/mux v1.7.4
	github.com/onsi/gomega v1.8.1
	github.com/openshift/client-go v0.0.0-20200320150128-a906f3d8e723 // indirect
	github.com/prometheus/client_golang v1.5.1
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.6.2
	go.uber.org/zap v1.14.1
	golang.org/x/net v0.0.0-20191209160850-c0dbc17a3553
	golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527 // indirect
	k8s.io/apimachinery v0.18.0-beta.2
	k8s.io/client-go v0.18.0-beta.2
	sigs.k8s.io/controller-runtime v0.5.1
)
