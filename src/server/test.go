package main

import (
	"server/mask"
	"fmt"
)

func DrawParts() {
	src := mask.LoadSrcImage("examples/origin.png")
	var index = []rune("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
	f, s := mask.ShuffleImage(src, index, true)

	mask.CreateImageFile("examples/a.png", f)
	fmt.Printf(string(s))
}

func main() {
	DrawParts()
	/*
	var c1, c2, _ = mask.GetDefaultBackgroundAfterMask()

	mask.CreateImageFile("examples/c1.png", c1)
	mask.CreateImageFile("examples/c2.png", c2)
	*/
}
