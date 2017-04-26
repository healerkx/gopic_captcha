package controllers

import (
	"github.com/astaxie/beego"
	"server/mask"
	"crypto/md5" 
    "encoding/hex" 
	"fmt"
	"time"
	"math/rand"
	"image/draw"
)

type CaptchaController struct {
	beego.Controller
}

type PictureInfo struct {
	Wall 	string		`json:"wall"`
	Piece 	string		`json:"piece"`
	Key 	string		`json:"key"`
	Index 	string		`json:"index"`
	Shuffle string		`json:"shuffle"`
	OffsetY int         `json:"offsetY"`

}

// PictureController.Get
func (c *CaptchaController) Get() {
	c.TplName = "captcha.tpl"
}

func (c *CaptchaController) GetPicturesInfo() {

	var key = c.Input().Get("key")
    var shuffle = c.Input().Get("shuffle")
    var index []rune = nil
	var f1 = ""
	var f2 = ""
	var offsetY = 40
	// TODO: Load image from disk cache
	if key == "" {
		var c1, c2 draw.Image = nil, nil
		c1, c2, offsetY, _ = mask.GetDefaultBackgroundAfterMask()

		rand.Seed(time.Now().UnixNano())
		var secret = fmt.Sprintf("%d%d", time.Now().UnixNano(), rand.Intn(100))
		h := md5.New()

		h.Write([]byte(secret)) // 需要加密的字符串为 123456

		cipherStr := h.Sum(nil)

		var key = hex.EncodeToString(cipherStr)
		f1 = fmt.Sprintf("static/pictures/wall_%s.png", key)
		f2 = fmt.Sprintf("static/pictures/piece_%s.png", key)

		index = []rune("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

		c1, index = mask.ShuffleImage(c1, index, shuffle == "1")

		mask.CreateImageFile(f1, c1)
		mask.CreateImageFile(f2, c2)
	} else {
		f1 = fmt.Sprintf("static/pictures/wall_%s.png", key)
		f2 = fmt.Sprintf("static/pictures/piece_%s.png", key)
        index = []rune(c.Input().Get("index"))
	}

	var pi PictureInfo
	pi = PictureInfo {
		Wall: f1,
		Piece: f2,
		Key: key,
		Index: string(index),
		Shuffle: shuffle,
		OffsetY: offsetY,
	}

	c.Data["json"] = pi
	c.ServeJSON()
}