1、 rails应用镜像 启动
docker run --name app -d -p 5001:5001 jinmin/weixin_cor 
浏览器查看 http://127.0.0.1:5001/weixin/first_app/index 页面正常
2、nginx镜像 
在对于dockerfile文件里添加
ADD config/nginx-app.conf /etc/nginx/conf.d/
nginx配置文件 nginx-app.conf
upstream rails-app {
  server app:5001 fail_timeout=0;
}
server {
  listen 8010 default deferred; # for Linux
启动nginx镜像
sudo docker run --name wep -d --link app:app -p 80:8010 nginx
浏览器查看 http://127.0.0.1/weixin/first_app/index 页面正常