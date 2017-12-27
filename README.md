# cordova-plugin-epub
cordova epub reader

Usage(用法)

1 添加文件夹 EPUBReadModular 和 thirdparty 到工程 。 其中 thirdparty 里所用到的开源工程， 如果工程已有，则不用添加

2 EPUBReadModular 文件夹 为 arc 编译

3 工程的 info.plist 里 添加 "View controller-based status bar appearance" 值为NO

4 添加framework ： libz.tbd , libxml2.tbd, libstdc++.tbd

5 build setting 里 设置 header search paths 追加 “/usr/include/libxml2”
