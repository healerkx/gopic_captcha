package mask

import (
	"fmt"
	"image"
	"image/color"
	"image/draw"
	"image/png"
	"os"
	//"time"
	"io"
)

func CreateImageFile(fileName string, img image.Image) error {
	file, err := os.Create(fileName)
	if err != nil {
		fmt.Println(err)
	}
	defer file.Close()
	return png.Encode(file, img)
}

func SendImage(w io.Writer, img image.Image) error {
	return png.Encode(w, img)
}

func loadPngImage(fileName string) image.Image {
	file, err := os.Open(fileName)
	if err != nil {
		fmt.Println(err)
	}
	defer file.Close()
	img, _ := png.Decode(file)

	return img
}

func LoadMaskImage(fileName string) image.Image {
	return loadPngImage(fileName)
}

func LoadSrcImage(fileName string) image.Image {
	return loadPngImage(fileName)
}

func copySrc(src image.Image) draw.Image {
	srcBounds := src.Bounds()
	copy := image.NewRGBA(srcBounds)
	draw.Draw(copy, srcBounds, src, image.ZP, draw.Over)
	return copy
}

// Test
func GetDefaultBackgroundAfterMask() (draw.Image, draw.Image, error) {

	src := LoadSrcImage("examples/origin.png")
	mask := LoadMaskImage("examples/mask.png")

	copy1, _ := GetWallImage(src, mask, image.Pt(80, 40))
	copy2, _ := GetPieceImage(src, mask, image.Pt(80, 40))
	return copy1, copy2, nil
}

func GetWallImage(src, mask image.Image, copyPoint image.Point) (draw.Image, error) {
	srcBounds := src.Bounds()
	maskBounds := mask.Bounds()

	white := image.Uniform{color.RGBA{255, 255, 255, 255}}
	whiteImg := image.NewRGBA(maskBounds)
	draw.Draw(whiteImg, maskBounds, &white, image.ZP, draw.Over)

	// Create a new image with src bounds for final background
	copy := copySrc(src)
	// Get the src image without mask-bounds-region
	draw.DrawMask(copy, srcBounds.Add(copyPoint), whiteImg, image.ZP, mask, maskBounds.Min, draw.Over)

	return copy, nil
}

func GetPieceImage(src, mask image.Image, copyPoint image.Point) (draw.Image, error) {
	maskBounds := mask.Bounds()
	// Create a new image with mask bounds for final move block
	copy := copySrc(mask)
	// Get the part image in src image with the mask-bounds
	draw.DrawMask(copy, maskBounds, src, copyPoint, mask, maskBounds.Min, draw.Over)

	return copy, nil
}
