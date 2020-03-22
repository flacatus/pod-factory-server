package common

import (
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"sigs.k8s.io/controller-runtime/pkg/client/config"
)

type C struct {
	rest *rest.Config
}

// New creates H, a client used to expose common testing functions.
func New() *C {
	helper := &C{}

	return helper
}

// Kube returns the clientset for Kubernetes upstream.
func (c *C) Kube() kubernetes.Interface {
	cfg, _ := config.GetConfig()
	client, _ := kubernetes.NewForConfig(cfg)
	//Expect(err).ShouldNot(HaveOccurred(), "failed to configure Kubernetes clientset")
	return client
}
