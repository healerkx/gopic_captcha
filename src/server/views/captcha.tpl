<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Captcha Demo</title>

    <style>
        body {
            text-align: center;
            font-family: "Microsoft Yahei", sans-serif;
            font-size: 18px;
        }

        input {
            font-family: "Microsoft Yahei", sans-serif;
        }

        .inp {
            border: 1px solid #000;
            padding: 0 10px;
            width: 200px;
            height: 30px;
            font-size: 18px;
        }

        .btn {
            border: 1px solid #000;
            width: 100px;
            height: 30px;
            font-size: 18px;
            cursor: pointer;
        }

        #captcha {
            width: 290px;
            margin: 30px auto
        }

        .show {
            display: block;
        }

        .hide {
            display: none;
        }

        #notice {
            color: red;
        }

        .gt_holder.popup .gt_popup_wrap, .gt_holder.popup .gt_popup_cross, .gt_holder .gt_holder_top, .gt_holder .gt_box_tips, .gt_holder.en .gt_box_tips, .gt_holder .gt_curtain_button, .gt_holder .gt_curtain_button.moving, .gt_holder .gt_curtain_button.success, .gt_holder .gt_curtain_button.fail, .gt_holder .gt_flash, .gt_holder .gt_ie_success, .gt_holder .gt_loading, .gt_holder.en .gt_loading, .gt_holder .gt_info, .gt_holder .gt_info .success .gt_info_icon, .gt_holder .gt_info .fail .gt_info_icon, .gt_holder .gt_info .abuse .gt_info_icon, .gt_holder .gt_info .forbidden .gt_info_icon, .gt_holder .gt_info .error .gt_info_icon, .gt_holder .gt_bottom, .gt_holder.en .gt_bottom, .gt_holder .gt_refresh_button, .gt_holder .gt_refresh_button:hover, .gt_holder .gt_refresh_button .gt_refresh_tips, .gt_holder .gt_help_button, .gt_holder .gt_help_button:hover, .gt_holder .gt_help_button .gt_help_tips, .gt_holder .gt_ajax_tip, .gt_holder .gt_ajax_tip.success, .gt_holder .gt_ajax_tip.lock, .gt_holder .gt_ajax_tip.ready, .gt_holder .gt_ajax_tip.fail, .gt_holder .gt_ajax_tip.forbidden, .gt_holder .gt_ajax_tip.error, .gt_holder .gt_slider, .gt_holder .gt_slider_knob, .gt_holder .gt_slider_knob.moving, .gt_holder .gt_curtain_knob
        {background-repeat:no-repeat;background-image:url('http://static.geetest.com/static/golden/sprite.3.0.16.png');_background-image:url('http://static.geetest.com/static/golden/sprite.3.0.16.gif')}

        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
        {.gt_holder.popup .gt_popup_wrap,.gt_holder.popup .gt_popup_cross,.gt_holder .gt_holder_top,.gt_holder .gt_box_tips,.gt_holder.en .gt_box_tips,.gt_holder .gt_curtain_button,.gt_holder .gt_curtain_button.moving,.gt_holder .gt_curtain_button.success,.gt_holder .gt_curtain_button.fail,.gt_holder .gt_flash,.gt_holder .gt_ie_success,.gt_holder .gt_loading,.gt_holder.en .gt_loading,.gt_holder .gt_info,.gt_holder .gt_info .success .gt_info_icon,.gt_holder .gt_info .fail .gt_info_icon,.gt_holder .gt_info .abuse .gt_info_icon,.gt_holder .gt_info .forbidden .gt_info_icon,.gt_holder .gt_info .error .gt_info_icon,.gt_holder .gt_bottom,.gt_holder.en .gt_bottom,.gt_holder .gt_refresh_button,.gt_holder .gt_refresh_button:hover,.gt_holder .gt_refresh_button .gt_refresh_tips,.gt_holder .gt_help_button,.gt_holder .gt_help_button:hover,.gt_holder .gt_help_button .gt_help_tips,.gt_holder .gt_ajax_tip,.gt_holder .gt_ajax_tip.success,.gt_holder .gt_ajax_tip.lock,.gt_holder .gt_ajax_tip.ready,.gt_holder .gt_ajax_tip.fail,.gt_holder .gt_ajax_tip.forbidden,.gt_holder .gt_ajax_tip.error,.gt_holder .gt_slider,.gt_holder .gt_slider_knob,.gt_holder .gt_slider_knob.moving,.gt_holder .gt_curtain_knob{background-image:url('http://static.geetest.com/static/golden/sprite2x.3.0.16.png');-moz-background-size:354px auto;-o-background-size:354px auto;-webkit-background-size:354px auto;background-size:354px auto}}

        .gt_box_holder, .gt_box, .gt_holder
        {box-sizing:content-box;-webkit-box-sizing:content-box}

        .gt_holder{overflow:visible;position:relative;zoom:1;letter-spacing:0 !important}
        .gt_holder.gt_clone{position:absolute !important}
        .gt_holder.gt_clone .gt_widget{position:relative;left:0;top:0}
        .gt_holder.popup{display:none;opacity:0;position:absolute;left:0;top:0;width:100%;_height:800px}
        .gt_holder.popup.gt_hide{display:none;opacity:0}
        .gt_holder.popup.gt_animate{display:block;opacity:0;transition:opacity 0.4s;-webkit-transition:opacity 0.4s}
        .gt_holder.popup.gt_show{display:block;opacity:1}
        .gt_holder.popup .gt_mask{position:fixed;width:100%;height:100%;top:0;left:0;background-color:black;opacity:0.6;filter:alpha(opacity=60);_display:none}
        .gt_holder.popup .gt_popup_wrap
        {height:286px;width:354px;background-position:0 -878px;position:fixed;margin-left:-177px;margin-top:-143px;top:50%;left:50%;z-index:999999;_position:absolute}

        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){

            .gt_holder.popup .gt_popup_wrap{background-position:0 -878px}
        }

        .gt_holder.popup .gt_popup_box{margin:28px auto;width:300px}
        .gt_holder.popup .gt_popup_header{position:relative;height:42px;line-height:42px;padding-left:20px;font:14px/42px "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif !important;text-align:left !important}

        .gt_holder.popup .gt_popup_cross
        {height:14px;width:14px;background-position:0 -1164px;cursor:pointer;position:absolute;right:20px;top:14px}

        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder.popup .gt_popup_cross{background-position:0 -1164px}}
        .gt_holder.popup .gt_popup_finish{display:none}
        .gt_holder.popup .gt_popup_finish.gt_show{display:block}

        .gt_holder.popup .gt_popup_finish.gt_hide{display:none}
        .gt_holder.popup .gt_popup_ready.gt_show{display:block}
        .gt_holder.popup .gt_popup_ready.gt_hide{display:none}
        .gt_holder a{text-decoration:none;background-color:transparent !important;-webkit-tap-highlight-color:transparent}
        .gt_holder.float{width:261px}
        .gt_holder.float .gt_slider{left:0}
        .gt_holder.float .gt_widget{position:absolute;left:0 !important;margin-left:-15px;_margin-left:0;bottom:28px;_width:290px;display:none;opacity:0}
        .gt_holder.float .gt_widget.gt_hide{display:none;opacity:0}
        .gt_holder.float .gt_widget.gt_animate{display:block;opacity:0;transition:opacity 0.4s;-webkit-transition:opacity 0.4s}
        .gt_holder.float .gt_widget.gt_show{opacity:1;display:block !important;zoom:1;z-index:398}
        .gt_holder .gt_widget.clean .gt_box_tips, .gt_holder .gt_widget.clean .gt_help_button{display:none !important}
        .gt_holder .gt_widget.clean .gt_bg, .gt_holder .gt_widget.clean .gt_fullbg{cursor:default !important}
        .gt_holder .gt_holder_top
        {height:14px;width:290px;background-position:0 -1366px;position:relative}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){
            .gt_holder .gt_holder_top{background-position:0 -1366px}}
        .gt_holder .gt_box_holder{width:260px;height:116px;padding:0 15px 2px 13px;position:relative;background-color:#f2ece1;border-left:1px solid #e4ddd1;border-right:1px solid #e4ddd1;_margin-top:-5px;_padding:0 13px 0 13px}
        .gt_holder .gt_box{border:1px solid #e2d7c7;height:100%;width:260px;overflow:hidden;background-color:#fcfbf8;text-align:center;position:relative}
        .gt_holder .gt_box:hover .gt_box_tips{display:block;_display:none}
        .gt_holder .gt_box_tips
        {height:16px;width:73px;background-position:0 -846px;display:none;position:absolute;right:0;bottom:0;opacity:0.7;filter:alpha(opacity=70);zoom:1}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_box_tips{background-position:0 -846px}}
        .gt_holder.en .gt_box_tips
        {height:16px;width:73px;background-position:0 -862px}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){
            .gt_holder.en .gt_box_tips{background-position:0 -862px}}
        .gt_holder a.gt_bg{position:absolute;display:inline-block;width:100%;height:100%;left:0;top:0;margin:0 !important}
        .gt_holder a.gt_bg.gt_animate{-webkit-transition:opacity 0.3s;transition:opacity 0.3s}
        .gt_holder a.gt_bg.gt_hide{opacity:0;display:none \9 !important}
        .gt_holder a.gt_bg.gt_show{opacity:1}
        .gt_holder a.gt_bg.clean{cursor:default}
        .gt_holder .gt_slice{position:absolute;display:inline-block;left:0;background-repeat:no-repeat;width:60px;height:60px}
        .gt_holder .gt_slice.moving{opacity:0.9}
        .gt_holder .gt_slice.gt_show{opacity:1}
        .gt_holder .gt_slice.gt_animate{-webkit-transition:-webkit-transform 0.4s ease-in, left 0.4s ease-in, opacity 0.1s;transition:transform 0.4s ease-in, left 0.4s ease-in, opacity 0.1s}
        .gt_holder .gt_slice.gt_hide{opacity:0}
        .gt_holder .gt_slice.wait{opacity:0.6}
        .gt_holder a.gt_fullbg{position:absolute;display:block;width:260px;height:100%;left:0;top:0;margin:0 !important}
        .gt_holder a.gt_fullbg.gt_animate{-webkit-transition:opacity 0.3s;transition:opacity 0.3s}
        .gt_holder a.gt_fullbg.gt_hide{opacity:0;display:none \9 !important}
        .gt_holder a.gt_fullbg.gt_show{opacity:1}
        .gt_holder .gt_cut_fullbg, .gt_holder .gt_cut_bg, .gt_holder .gt_cut_curtain{height:100%}
        .gt_holder .gt_cut_fullbg.gt_hide, .gt_holder .gt_cut_bg.gt_hide, .gt_holder .gt_cut_curtain.gt_hide{display:none}
        .gt_holder .gt_cut_fullbg_slice, .gt_holder .gt_cut_bg_slice, .gt_holder .gt_cut_curtain_slice{float:left;width:20px;height:50%;margin:0 !important}
        .gt_holder a.gt_curtain{position:absolute;height:100%;width:100%;margin:0 !important;left:0;visibility:hidden;-webkit-transform:translate(100%, 0);transform:translate(100%, 0);display:inline-block}
        .gt_holder a.gt_curtain.gt_animate{-webkit-transition:-webkit-transform 0.6s;transition:transform 0.6s}
        .gt_holder a.gt_curtain.gt_show{visibility:visible;-webkit-transform:translate(0, 0);transform:translate(0, 0)}
        .gt_holder .gt_curtain_bg_wrap{overflow:hidden;position:absolute;width:100%;height:100%;left:0;top:0;display:inline-block}
        .gt_holder .gt_curtain_bg_wrap.gt_animate{-webkit-transition:left 0.4s, opacity 0.5s;transition:left 0.4s, opacity 0.5s}
        .gt_holder .gt_curtain_bg_wrap.gt_hide{opacity:0;display:none \9;z-index:-1 \9}
        .gt_holder .gt_curtain_bg_wrap.gt_show{opacity:1;display:inline-block}
        .gt_holder .gt_curtain_bg, .gt_holder .gt_cut_curtain{position:absolute;right:0;top:0;height:100%;width:260px;display:inline-block}
        .gt_holder .gt_cut_curtain{left:0 !important}
        .gt_holder .gt_curtain_button
        {position:absolute;display:inline-block;margin-top:-22px;margin-left:-22px;cursor:pointer;opacity:0;height:44px;width:44px;background-position:0 -84px;_height:44px !important}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){
            .gt_holder .gt_curtain_button{background-position:0 -84px}}

        .gt_holder .gt_curtain_button.gt_animate{-webkit-transition:left 0.4s, top 0.4s, opacity 0.3s;transition:left 0.4s, top 0.4s, opacity 0.3s}                        
        .gt_holder .gt_curtain_button.gt_show{opacity:1}
        .gt_holder .gt_curtain_button.gt_hide{opacity:0;display:none \9}
        .gt_holder .gt_curtain_button.moving
        {height:44px;width:44px;background-position:0 -172px}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){
            .gt_holder .gt_curtain_button.moving{background-position:0 -172px}}
            .gt_holder .gt_curtain_button.success.gt_animate, .gt_holder .gt_curtain_button.fail.gt_animate{-webkit-transition-duration:0.15s;transition-duration:0.15s}
                                    .gt_holder .gt_curtain_button.success
                                        {height:44px;width:44px;background-position:0 -260px}
        
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){
            .gt_holder .gt_curtain_button.success{background-position:0 -260px}}
        .gt_holder .gt_curtain_button.fail
        {height:44px;width:44px;background-position:0 -128px}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_curtain_button.fail{background-position:0 -128px}}
                                            .gt_holder .gt_flash

        {height:116px;width:272px;background-position:0 -440px;position:absolute;left:100%;top:0}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_flash{background-position:0 -440px}}
        .gt_holder .gt_flash.gt_animate{display:block;-webkit-transition:left 1.5s;transition:left 1.5s}
        .gt_holder .gt_flash.gt_show{left:-100%}
        .gt_holder .gt_ie_success

        {height:64px;width:64px;background-position:0 -610px;display:none;position:absolute;left:196px;top:0;height:64px !important}

        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_ie_success{background-position:0 -610px}}
        .gt_holder .gt_ie_success.gt_show{display:block !important;zoom:1}
        .gt_holder .gt_loading
        {height:62px;width:130px;background-position:0 -696px;position:absolute;top:50%;left:50%;margin-top:-30px;margin-left:-60px}

        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_loading{background-position:0 -696px}}
                .gt_holder.en .gt_loading

                    {height:62px;width:130px;background-position:0 -758px}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder.en .gt_loading{background-position:0 -758px}}
                    .gt_holder .gt_info

                        {height:22px;width:260px;background-position:0 -674px;height:0;overflow:hidden;position:absolute;bottom:1px;margin-left:1px}
        @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_info{background-position:0 -674px}}
                        .gt_holder .gt_info.gt_animate{-webkit-transition:height 200ms;transition:height 200ms;-webkit-transform:translateZ(0)}
                        .gt_holder .gt_info.gt_show{height:22px}
                        .gt_holder .gt_info .gt_info_icon{width:26px !important;float:left}
                        .gt_holder .gt_info .gt_info_tip{-webkit-font-smoothing:subpixel-antialiased;font-size:12px !important;line-height:22px !important;font-family:Helvetica, SimSun, monospace !important;margin:0 auto;position:relative}
                        .gt_holder .gt_info .gt_info_text{text-align:left !important;color:#4b3f33}
                        .gt_holder .gt_info .gt_info_text span{font-size:12px !important;line-height:22px !important;font-family:Helvetica, SimSun, monospace !important}
                        .gt_holder .gt_info .success .gt_info_icon

                            {height:22px;width:21px;background-position:0 -1232px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_info .success .gt_info_icon{background-position:0 -1232px}}
                            .gt_holder .gt_info .success .gt_info_type{color:green}
                            .gt_holder .gt_info .fail .gt_info_icon

                                {height:22px;width:21px;background-position:0 -1254px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_info .fail .gt_info_icon{background-position:0 -1254px}}
                                .gt_holder .gt_info .fail .gt_info_type{color:red}
                                .gt_holder .gt_info .abuse .gt_info_icon

                                    {height:22px;width:21px;background-position:0 -1276px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_info .abuse .gt_info_icon{background-position:0 -1276px}}
                                    .gt_holder .gt_info .abuse .gt_info_type{color:#ffb84c}
                                    .gt_holder .gt_info .forbidden .gt_info_icon

                                        {height:22px;width:21px;background-position:0 -1298px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_info .forbidden .gt_info_icon{background-position:0 -1298px}}
                                        .gt_holder .gt_info .forbidden .gt_info_type{color:#ff9d4c}
                                        .gt_holder .gt_info .error .gt_info_icon

                                            {height:22px;width:21px;background-position:0 -1320px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_info .error .gt_info_icon{background-position:0 -1320px}}
        .gt_holder .gt_info .error .gt_info_type{color:#ffb84c}
        .gt_holder .gt_info .gt_info_content{margin-left:6px}
        .gt_holder .gt_bottom
        {height:28px;width:290px;background-position:0 -56px;line-height:14px !important;position:relative;text-align:left;overflow:visible}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){
        .gt_holder .gt_bottom{background-position:0 -56px}}
        .gt_holder .gt_bottom a{overflow:visible;display:block;zoom:1;display:inline-block;vertical-align:bottom;cursor:pointer;margin-right:16px !important}
        .gt_holder.en .gt_bottom
        {height:28px;width:290px;background-position:0 -56px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder.en .gt_bottom{background-position:0 -56px}}
                                                    .gt_holder .gt_refresh_button

                                                        {background-color:#f1e9de;margin:6px 0 0 18px !important;height:14px;width:14px;background-position:0 -1204px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_refresh_button{background-position:0 -1204px}}
                                                        .gt_holder .gt_refresh_button:hover

                                                            {height:14px;width:14px;background-position:0 -1218px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_refresh_button:hover{background-position:0 -1218px}}
                                                                                                    
    .gt_holder .gt_refresh_button:hover .gt_refresh_tips{display:block}
    .gt_holder .gt_refresh_button .gt_refresh_tips
    {display:none;height:24px;width:58px;background-position:0 -1342px;position:relative;left:-10px;top:-28px}
    
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_refresh_button .gt_refresh_tips{background-position:0 -1342px}}
    .gt_holder .gt_help_button

    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_help_button{background-position:0 -582px}}
                                                                                                            
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_help_button:hover{background-position:0 -596px}}
    .gt_holder .gt_help_button:hover .gt_help_tips{display:block}                                                                                                                
    .gt_holder .gt_help_button .gt_help_tips
    {display:none;height:24px;width:58px;background-position:0 -1342px;position:absolute;left:-10px;top:-28px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_help_button .gt_help_tips{background-position:0 -1342px}}
    .gt_holder .gt_refresh_tips, .gt_holder .gt_help_button{text-align:center !important;color:white !important;font:12px/20px Helvetica, SimSun, monospace !important} 
    .gt_holder .gt_logo_button{width:65px;height:16px;position:absolute;right:0;top:6px;background-color:transparent}
    .gt_holder .gt_logo_button.no_logo{background-color:#f2ece1 !important;cursor:default}
    .gt_holder .gt_ajax_tip

        {height:26px;width:26px;background-position:0 -1178px;position:absolute;right:-35px;top:2px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip{background-position:0 -1178px}}
    .gt_holder .gt_ajax_tip.success                                                                                                                        
    {height:26px;width:26px;background-position:0 -304px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip.success{background-position:0 -304px}}
    .gt_holder .gt_ajax_tip.lock
        {height:26px;width:26px;background-position:0 -820px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip.lock{background-position:0 -820px}}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip.ready{background-position:0 -1178px}}

    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip.fail{background-position:0 -414px}}

    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip.forbidden{background-position:0 -556px}}

    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_ajax_tip.error{background-position:0 -388px}}
    .gt_holder .gt_slider
    {height:28px;width:261px;background-position:0 0;position:relative;left:15px;overflow:visible}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_slider{background-position:0 0}}
    .gt_holder .gt_slider_knob

        {height:44px;width:44px;background-position:0 -84px;cursor:pointer;display:block;position:absolute;left:6px;top:-9px;-moz-box-shadow:none;box-shadow:none;border-radius:13px;z-index:399}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_slider_knob{background-position:0 -84px}}
        .gt_holder .gt_slider_knob.gt_animate{-webkit-transition:-webkit-transform 0.4s ease-in, left 0.4s ease-in, opacity 0.5s;transition:transform 0.4s ease-in, left 0.4s ease-in, opacity 0.5s}
        .gt_holder .gt_slider_knob.gt_hide{opacity:0;visibility:hidden}
        .gt_holder .gt_slider_knob.moving

            {height:44px;width:44px;background-position:0 -216px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx)
    {.gt_holder .gt_slider_knob.moving{background-position:0 -216px}}
    .gt_holder .gt_guide_tip{cursor:default;position:absolute;left:56px;font-family:Helvetica, SimSun, monospace !important;font-size:12px !important;color:#486c80;opacity:1;filter:alpha(opacity=100);height:28px;line-height:28px !important;text-align:center;width:190px}
    .gt_holder .gt_guide_tip.gt_animate{-webkit-transition:opacity 0.5s;-moz-transition:opacity 0.5s;-o-transition:opacity 0.5s;transition:opacity 0.5s}
    .gt_holder .gt_guide_tip.gt_hide{opacity:0;filter:alpha(opacity=0)}
    .gt_holder .gt_curtain_knob
        {height:28px;width:260px;background-position:0 -360px}
    @media (-webkit-min-device-pixel-ratio: 1.5), (min-device-pixel-ratio: 1.5), (min-resolution: 192dpi), (min-resolution: 1.5dppx){.gt_holder .gt_curtain_knob{background-position:0 -360px}}    
    .gt_holder .gt_curtain_tip, .gt_holder .gt_curtain_knob
    {cursor:default;position:absolute;left:0;width:100%;text-align:center;font-family:SimSun, monospace !important;font-size:12px !important;color:#b6a998;opacity:1;height:28px;line-height:28px !important}
    .gt_holder .gt_curtain_tip.gt_hide, .gt_holder .gt_curtain_knob.gt_hide{opacity:0;visibility:hidden}
    .gt_holder .gt_curtain_tip.gt_show, .gt_holder .gt_curtain_knob.gt_show{opacity:1}
    .gt_holder .gt_curtain_tip.gt_animate, .gt_holder .gt_curtain_knob.gt_animate{-webkit-transition:opacity 0.3s;-moz-transition:opacity 0.3s;-o-transition:opacity 0.3s;transition:opacity 0.3s}
    .gt_holder .gt_input{display:none} .gt_flash2 {
        position: absolute;
        width: 260px;
        z-index: 1000;
        top: 0px;
        height: 116px !important;
        text-align: left;
    }


    </style>

<body>
<h1>验证码 Demo</h1>

<div id="captcha">
    <div id="geetest_1450748238692" class="gt_holder embed zh-cn">
        <div class="gt_widget">
            <div class="gt_holder_top"></div>
            <div class="gt_box_holder" style="height: 116px;">
                <div class="gt_box">
                    <div class="gt_loading"></div>
                    <a class="gt_bg gt_show" style="background-image: none;">
                        <div class="gt_cut_bg gt_show">

                        </div>
                        <div class="gt_flash2" style="height: 94px;"></div>
                        <div class="gt_ie_success"></div>
                    </a>
                    <a class="gt_curtain gt_hide" style="background-image: none;">
                        <div class="gt_curtain_bg_wrap">
                            <div class="gt_curtain_bg">
                                <div class="gt_cut_curtain"></div>
                            </div>
                        </div>
                        <div class="gt_curtain_button gt_hide"></div>
                    </a><a class="gt_box_tips" style="display: none;"></a></div>
                <div class="gt_info">
                    <div class="gt_info_tip">
                        <div class="gt_info_icon"></div>
                        <div class="gt_info_text"></div>
                    </div>
                </div>
            </div>
            <div class="gt_bottom"><a class="gt_refresh_button">
                    <div class="gt_refresh_tips">刷新验证</div>
                </a><a class="gt_help_button" href="http://old.geetest.com/contact/#report" target="_blank">
                    <div class="gt_help_tips">帮助反馈</div>
                </a><a class="gt_logo_button" href="http://www.geetest.com" target="_blank"></a></div>
        </div>
        <div class="gt_input"><input type="hidden" class="geetest_challenge" name="geetest_challenge">
            <input type="hidden" class="geetest_validate" name="geetest_validate">
            <input type="hidden" class="geetest_seccode" name="geetest_seccode">
        </div>
        <div class="gt_slider">
            <div class="gt_guide_tip gt_show">&gt;&gt;&gt; 拖动滑块完成验证 &gt;&gt;&gt;</div>
            <div class="gt_slider_knob gt_show" style="transform: translate(0px, 0px);">
            </div>
            <div class="gt_curtain_tip gt_hide">点击上图按钮并沿道路拖动到终点处</div>
            <div class="gt_curtain_knob gt_hide">移动到此开始验证</div>
            <div class="gt_ajax_tip ready"></div>
        </div>
    </div>
</div>
<p class="hide" id="wait">正在加载验证码......</p>

<p class="hide" id="notice">请先拖动验证码到相应位置</p>
<input type="submit" value="提交" id="submit" class="btn">
<div id='ddd'></div>
<div id='part-template'></div>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>

<script>

    var _x = 0;
    var gdata;
    var start_time = 0;
    var true_pos = 0;

    $('.gt_refresh_button').click(function () {
        window.location.reload();
    });

    function matchPosition(offsetX) {
        var result = 0;
        $.ajax({
            url: "/captcha/validate?offsetX=" + offsetX + "&key=" + setPictures.key,
            async: false,
            type: "get",
            dataType: "json",
            success: function (data) {
                result = data.success;
            }

        });

        return result;
    }

    function showPiece() {
        console.log('showPiece')
        $('.gt_flash2>img').show();
        $('.gt_flash2').show(500);
    }

    function setShuffledBackground(index, wall) {        
		for (var i in index) {
			var x = index.codePointAt(i) - 65;
			var y = 0;
			if (parseInt(x / 13) == 1) {
				x -= 13, y = 1;
			}

			// console.log(i, v, String.fromCharCode(65 + v), x, y, x*20, y*58)
			var div = $('#part-template').clone()
                .removeAttr('id')
				.addClass('gt_cut_fullbg_slice')
				.css('background-image', 'url(' + wall + ')')
				.css('background-position-x', '-' + x * 20 + 'px')
				.css('background-position-y', y * 58 + 'px')
			div.appendTo($('.gt_cut_bg'));
		}
	}

    function setPictures(info) {
    	console.log(info.index)
        setPictures.key = info.key;

    	setShuffledBackground(info.index, info.wall);

        $('.gt_flash2').html('<img src="' + info.piece + '" />').hide();
        $('.gt_flash2>img').css('margin-top', info.offsetY + "px");
        
    }

    $(function() {
    	$.ajax({
    	    // when DEBUG, the action with params key and index supports loading a certain picture.
            url: "/captcha/pictures?shuffle=1&key=c274209a801a97178e381364a2076767&index=ZHMIKXDEWVGNUPLSCBRAOJFYQT&_t=" + (new Date()).getTime(),
            // ...
            url: "/captcha/pictures?shuffle=1&_t=" + (new Date()).getTime(),
            type: "get",
            dataType: "json",
            success: function (data) {
            	setPictures(data);
            }
        });

        $('.gt_slider_knob').mousedown(function (e) {
            
            showPiece();

            $(document).bind("mousemove", function (ev) {
                
                var offset = $('.gt_holder').offset();
                var x = offset.left;
                var offsetX = ev.pageX - x - 30;
				console.log("MV")
                start_time = Date.parse(new Date()) / 1000;

                offsetX = offsetX > 0 ? offsetX : 0;
                offsetX = offsetX > 233 ? 233 : offsetX;

                $('.gt_slider_knob').css({left: offsetX});
                $('.gt_flash2>img').css({marginLeft: offsetX});
            });

            $('.gt_slider_knob').mouseup(function (ev) {
                $(document).unbind("mousemove");
                $('.gt_slider_knob').unbind('mouseup');

                var offset = $('.gt_holder').offset();
                var x = offset.left;
                var offsetX = ev.pageX - x - 30;
                console.log('UP', offsetX)
                var time = Date.parse(new Date()) / 1000 - start_time;
                
                if (matchPosition(offsetX)) {
                    $('.gt_slider_knob').unbind("mousedown");
                    $('.gt_ajax_tip').attr('class', 'gt_ajax_tip success');
                } else {
                    $('.gt_slider_knob').animate({left: 0}, 500);
                    $('.gt_flash2>img').animate({marginLeft: 0}, 500);
                    $('.gt_flash2>img').fadeOut(500);
                }
            });

        });        
    });

</script>
</body>
</html>