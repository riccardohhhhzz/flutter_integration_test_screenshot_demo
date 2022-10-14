# screenshotdemo

该项目演示了在flutter web集成测试环境下如何获取截图

## 安装驱动

* [chromedriver](https://chromedriver.chromium.org/downloads)

## 浏览器默认行为设置

1. 在chrome中指定端口run本项目

   ```
   flutter -d chrome --web-port=56789
   ```

2. 在浏览器中进行以下设置：

   * 更改文件下载位置至screenshots文件夹

     ![image-20221014164604429](D:\typora_image\image-20221014164604429.png)


   * 配置自动下载

     ![image-20221014165000881](D:\typora_image\image-20221014165000881.png)

     ![image-20221014165016393](D:\typora_image\image-20221014165016393.png)


##	运行

1. 控制台开启chromedriver

   ```shell
   chromedriver --port=4444
   ```

2. run集成测试

   ```shell
   flutter drive \
     --driver=test_driver/integration_test.dart \
     --target=integration_test/app_test.dart \
     -d chrome --web-port=56789
   ```

## 预期结果

在screenshots文件夹下可以看到2份截图`tap1.png`、`tap2.png`

