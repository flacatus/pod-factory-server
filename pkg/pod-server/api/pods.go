package api

import (
	"context"
	srv "github.com/PodatorFactory/pod-factory-server/pkg/common"
	"github.com/gorilla/mux"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"net/http"
)

// Env godoc
// @Summary Environment
// @Description returns pods from a specific namespace
// @Tags HTTP API
// @Accept json
// @Produce json
// @Router /pods/{namespace} [get]
// @Success 200 {object} api.ArrayResponse
func (s *Server) pods(w http.ResponseWriter, r *http.Request) {
	client := srv.New()
	vars := mux.Vars(r)
	s.logger.Info("Getting info from namespace "+vars["name"])
	namespaces, _ := client.Kube().CoreV1().Pods(vars["name"]).List(context.TODO(), metav1.ListOptions{})
	s.JSONResponse(w, r, namespaces)
}


// Env godoc
// @Summary Environment
// @Description returns the environment variables as a JSON array
// @Tags HTTP API
// @Accept json
// @Produce json
// @Router /pods [get]
// @Success 200 {object} api.ArrayResponse
func (s *Server) PodsAll(w http.ResponseWriter, r *http.Request) {
	client := srv.New()

	namespaces, _ := client.Kube().CoreV1().Pods("").List(context.TODO(), metav1.ListOptions{})
	s.JSONResponse(w, r, namespaces)
}