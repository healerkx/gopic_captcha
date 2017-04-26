package main

import (
	_ "server/routers"
	"github.com/astaxie/beego"
)

func main() {
	beego.BConfig.WebConfig.StaticDir["/static"] = "static"
	beego.Run()
}

