--waf status
config_waf_enable = "on"
--log dir
config_log_dir = "/usr/local/openresty/nginx/logs"
--rule setting
config_rule_dir = "/usr/local/openresty/nginx/conf/waf/rule-config"
--enable/disable white url
config_white_url_check = "on"
--enable/disable white ip
config_white_ip_check = "on"
--enable/disable block ip
config_black_ip_check = "on"
--enable/disable url filtering
config_url_check = "on"
--enalbe/disable url args filtering
config_url_args_check = "on"
--enable/disable user agent filtering
config_user_agent_check = "on"
--enable/disable cookie deny filtering
config_cookie_check = "on"
--enable/disable cc filtering
config_cc_check = "on"
--cc rate the xxx of xxx seconds
config_cc_rate = "10/60"
--enable/disable post filtering
config_post_check = "on"
--config waf output redirect/shtml
config_waf_output = "shtml"
--if config_waf_output ,setting url
config_waf_redirect_url = "https://www.google.com"
config_output_html=[[
<!DOCTYPE html>
<html lang="en">
    <head> 
    <meta charset="UTF-8" /> 
    <link rel="apple-touch-icon" type="image/png" href=".png" /> 
    <link rel="shortcut icon" type="image/x-icon" href=".ico" /> 
    <link rel="mask-icon" type="image/x-icon" href=".svg" color="#111" /> 
    <title>403 Forbidden</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <style>
    @import url("https://fonts.googleapis.com/css?family=Comfortaa");
    * {
        box-sizing: border-box;
    }
    
    body,
    html {
        margin: 0;
        padding: 0;
        height: 100%;
        overflow: hidden;
    }
    
    body {
        background-color: #a74006;
        font-family: sans-serif;
    }
    
    .container {
        z-index: 1;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        padding: 10px;
        min-width: 300px;
    }
    .container div {
        display: inline-block;
    }
    .container .lock {
        opacity: 1;
    }
    .container h1 {
        font-family: "Comfortaa", cursive;
        font-size: 100px;
        text-align: center;
        color: #eee;
        font-weight: 100;
        margin: 0;
    }
    .container p {
        color: #fff;
    }
    
    .lock {
        transition: 0.5s ease;
        position: relative;
        overflow: hidden;
        opacity: 0;
    }
    .lock.generated {
        transform: scale(0.5);
        position: absolute;
        -webkit-animation: 2s move linear;
                animation: 2s move linear;
        -webkit-animation-fill-mode: forwards;
                animation-fill-mode: forwards;
    }
    .lock ::after {
        content: "";
        background: #a74006;
        opacity: 0.3;
        display: block;
        position: absolute;
        height: 100%;
        width: 50%;
        top: 0;
        left: 0;
    }
    .lock .bottom {
        background: #D68910;
        height: 40px;
        width: 60px;
        display: block;
        position: relative;
        margin: 0 auto;
    }
    .lock .top {
        height: 60px;
        width: 50px;
        border-radius: 50%;
        border: 10px solid #fff;
        display: block;
        position: relative;
        top: 30px;
        margin: 0 auto;
    }
    .lock .top::after {
        padding: 10px;
        border-radius: 50%;
    }
    
    @-webkit-keyframes move {
        to {
        top: 100%;
        }
    }
    
    @keyframes move {
        to {
        top: 100%;
        }
    }
    @media (max-width: 420px) {
        .container {
        transform: translate(-50%, -50%) scale(0.8);
        }
    
        .lock.generated {
        transform: scale(0.3);
        }
    }
    </style> 
    <script>
        window.console = window.console || function(t) {};
    </script> 
    <script>
        if (document.location.search.match(/type=embed/gi)) {
        window.parent.postMessage("resize", "*");
        }
    </script> 
    </head> 
    <body translate="no"> 
    <div class="container"> 
    <h1>4
    <div class="lock">
        <div class="top"></div>
        <div class="bottom"></div> 
    </div>3</h1>
    <p>Access denied</p> 
    </div> 
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script> 
    <script id="rendered-js">
    const interval = 500;
    
    function generateLocks() {
        const lock = document.createElement('div'),
        position = generatePosition();
        lock.innerHTML = '<div class="top"></div><div class="bottom"></div>';
        lock.style.top = position[0];
        lock.style.left = position[1];
        lock.classList = 'lock'; // generated';
        document.body.appendChild(lock);
        setTimeout(() => {
        lock.style.opacity = '1';
        lock.classList.add('generated');
        }, 100);
        setTimeout(() => {
        lock.parentElement.removeChild(lock);
        }, 2000);
    }
    function generatePosition() {
        const x = Math.round(Math.random() * 100 - 10) + '%';
        const y = Math.round(Math.random() * 100) + '%';
        return [x, y];
    }
    setInterval(generateLocks, interval);
    generateLocks();
    //# sourceURL=pen.js
        </script>   
    </body>
</html>
]]
