package mask

import (
	"fmt"
	"image"
	"image/color"
	"image/draw"
	"image/png"
	"os"
	"math/rand"
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
func GetDefaultBackgroundAfterMask() (draw.Image, draw.Image, int, int,  error) {

	src := LoadSrcImage("examples/origin.png")
	mask := LoadMaskImage("examples/mask.png")
	x := 80 + rand.Intn(60)
	y := 30 + rand.Intn(15)
	copy1, _ := GetWallImage(src, mask, image.Pt(x, y))
	copy2, _ := GetPieceImage(src, mask, image.Pt(x, y))
	return copy1, copy2, x, y, nil
}

func GetWallImage(src, mask image.Image, copyPoint image.Point) (draw.Image, error) {
	srcBounds := src.Bounds()
	maskBounds := mask.Bounds()

	white := image.Uniform{
        C: color.RGBA{ 255, 255, 255, 255 },
    }
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

func ShuffleImage(src image.Image, index []rune, shuffle bool) (draw.Image, []rune) {

    dest := make([]rune, 26)
	perm := rand.Perm(26)

	srcBounds := src.Bounds()
	partWidth := srcBounds.Dx() / 13
	partHeight := srcBounds.Dy() / 2
	partBounds := image.Rectangle{
        Min: srcBounds.Min,
        Max: image.Point{
            X: partWidth,
            Y: partHeight,
        },
    }

    copy := image.NewRGBA(srcBounds)

	for i, v := range perm {
        if !shuffle {
            v = i
        }
        x1 := i
        y1 := 0
        x2 := v
        y2 := 0

        if i / 13 == 1 {
            x1 = x1 - 13
            y1 = 1
        }

        if v / 13 == 1 {
            x2 = v - 13
            y2 = 1
        }

        p1 := image.Point{
            X: x1 * partWidth,
            Y: y1 * partHeight,
        }

        p2 := image.Point{
            X: x2 * partWidth,
            Y: y2 * partHeight,
        }

        draw.Draw(copy, partBounds.Add(p1), src, p2, draw.Over)
		dest[v] = index[i]
	}

	return copy, dest
}
