package controllers

import (
	"server/mask"

	"github.com/astaxie/beego"
)

type PictureController struct {
	beego.Controller
}

// PictureController.Get
func (c *PictureController) Get() {

	var c1, c2, _, _, _ = mask.GetDefaultBackgroundAfterMask()

	mask.SendImage(c.Ctx.ResponseWriter, c1)
	mask.CreateImageFile("examples/c2.png", c2)
}
