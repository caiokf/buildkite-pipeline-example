package lib_test

import (
	"github.com/caiokf/buildkite-pipeline-example/lib"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestMain(t *testing.T) {
	result := lib.Print("This is the best Golang program, ever!\n")

	assert.Equal(t, result, "This is the best Golang program, ever!\n")
}
