package controllers

import (
	"github.com/astaxie/beego"
	"server/mask"
)

type CaptchaController struct {
	beego.Controller
}

type PictureInfo struct {
	Wall string		`json:"wall"`
	Piece string	`json:"piece"`
}

// PictureController.Get
func (c *CaptchaController) Get() {
	c.TplName = "captcha.tpl"
}

func (c *CaptchaController) GetPicturesInfo() {

	// TODO: Load image from disk cache
	var c1, c2, _ = mask.GetDefaultBackgroundAfterMask()

	mask.CreateImageFile("examples/c1.png", c1)
	mask.CreateImageFile("examples/c2.png", c2)

	var pi PictureInfo
	pi = PictureInfo {
		Wall: "12",
		Piece: "22",
	}

	c.Data["json"] = pi
    c.ServeJSON()
}