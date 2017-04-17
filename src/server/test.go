package main

import (
	"server/mask"
)

func main() {
	var c1, c2, _ = mask.GetDefaultBackgroundAfterMask()

	mask.CreateImageFile("examples/c1.png", c1)
	mask.CreateImageFile("examples/c2.png", c2)
}
