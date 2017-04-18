package controllers

import (
	"github.com/astaxie/beego"
	"server/mask"
	"crypto/md5" 
    "encoding/hex" 
	"fmt"
	"time"
	"math/rand"
)

type CaptchaController struct {
	beego.Controller
}

type PictureInfo struct {
	Wall string		`json:"wall"`
	Piece string	`json:"piece"`
	Key string		`json:"key"`

}

// PictureController.Get
func (c *CaptchaController) Get() {
	c.TplName = "captcha.tpl"
}

func (c *CaptchaController) GetPicturesInfo() {

	// TODO: Load image from disk cache
	var c1, c2, _ = mask.GetDefaultBackgroundAfterMask()
	rand.Seed(time.Now().UnixNano())
	var secret = fmt.Sprintf("%d%d", time.Now().UnixNano(), rand.Intn(100))
	h := md5.New()

	h.Write([]byte(secret)) // 需要加密的字符串为 123456

	cipherStr := h.Sum(nil)

	var key = hex.EncodeToString(cipherStr)
	var f1 = fmt.Sprintf("examples/wall_%s.png", key)
	var f2 = fmt.Sprintf("examples/piece_%s.png", key)

	mask.CreateImageFile(f1, c1)
	mask.CreateImageFile(f2, c2)

	var pi PictureInfo
	pi = PictureInfo {
		Wall: f1,
		Piece: f2,
		Key: key,
	}

	c.Data["json"] = pi
	c.ServeJSON()
}