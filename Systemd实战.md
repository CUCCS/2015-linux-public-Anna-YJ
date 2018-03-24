# 第三章：动手实战SYSTEMD

----------


## 一、环境配置

* Ubuntu 16.04 Server 64bit
* 注册asciinema账号，在本地安装配置asciinema

## 二、实验过程

### 1、 [Systemd 入门教程：命令篇](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)

* 操作演示：
   * [由来+Systemd概述+系统管理](https://asciinema.org/a/6KUYcW8kd7k1Uk36nILHnWDrE)
      * **设置当前时区失败**  
      * **没有录制3.1 systemctl的指令**
   * [Unit](https://asciinema.org/a/sSBnhLyhaGfgl2AmXjWQ1zqaS)
   * [Unit 的配置文件](https://asciinema.org/a/QzKc4LrI256W2RQwdy9ZM22sH)
   * [Target](https://asciinema.org/a/5Y2D9JiTsWjpJwf0bAivndjqP)
   * [日志管理](https://asciinema.org/a/4yefJNXMB6EBGC5AvDjsmTShO)



### 2、 [Systemd 入门教程：实战篇](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)

* 操作演示：
   * [Systemd实战](https://asciinema.org/a/WIYy3X6YOMz6SMHcju85bGsN4)


### 自查清单

* 如何添加一个用户并使其具备sudo执行程序的权限？
  
   * sudo adduser poiuy[username]
   * sudo vim /etc/sudoers
   * 在# User privilege specification 下加上  poiuy  ALL=(ALL:ALL) ALL



