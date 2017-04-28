package routers

import (
	"server/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/pic", &controllers.PictureController{})
	beego.Router("/captcha", &controllers.CaptchaController{})
	beego.Router("/captcha/pictures", &controllers.CaptchaController{}, "get:GetPicturesInfo")
	beego.Router("/captcha/validate", &controllers.CaptchaController{}, "get:Validate")
}
