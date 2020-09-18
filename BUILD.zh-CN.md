# 开发环境（minicap-shared)

该开发环境用于编译 minicap-shared 子项目，该项目需要和Android源码一起编译，可调用Android私有API。

​           

环境要求：

* linux开发机
* docker编译镜像（基于openstf/aosp）

​    

目录结构：

* /home/lds/workspace (你的工作目录)
  * aosp  (Android源码目录)
    * android-10.0.0_r2 (Android分支源码目录)
  * miniperf (项目源码目录)

​                

Step 1: 新建一个文件夹作为你的个人 **工作目录** ，例如 `/home/lds/workspace`

​                    

Step 2：在工作目录下新建一个 `aosp` 目录，并从android mirror仓库拉取某个Android版本（在本例中准备编译android-10.0.0_r2）的分支源码到你的 **工作目录** ：

```
mkdir /home/lds/workspace/aosp/android-10.0.0_r2
cd /home/lds/workspace/aosp/android-10.0.0_r2
 
repo init -u /root/mirror/platform/manifest.git -b android-10.0.0_r2
repo sync
```

请耐心等待，同步Android分支源码过程可能需要30分钟。

​                         

目标编译分支：

| Branch            | SDK  | Docker image to build with |
| ----------------- | ---- | -------------------------- |
| android-4.4_r1    | 19   | openstf/aosp:jdk6          |
| android-5.0.1_r1  | 21   | openstf/aosp:jdk7          |
| android-5.1.0_r1  | 22   | openstf/aosp:jdk7          |
| android-6.0.0_r1  | 23   | openstf/aosp:jdk7          |
| android-7.0.0_r1  | 24   | openstf/aosp:jdk8          |
| android-7.1.0_r1  | 25   | openstf/aosp:jdk8          |
| android-8.0.0_r1  | 26   | openstf/aosp:jdk8          |
| android-8.1.0_r1  | 27   | openstf/aosp:jdk8          |
| android-9.0.0_r1  | 28   | openstf/aosp:jdk8          |
| android-10.0.0_r2 | 29   | openstf/aosp:jdk8          |

​                  

Step 4: 拉取项目代码到 **工作目录** ：

```
cd /home/lds/workspace/
git clone https://github.com/sandin/miniperf.git
```

​                     

Step 3：编译项目代码（在Android源码树内），选择需要编译的目标架构：

| 架构        | build-target |
| ----------- | ------------ |
| armeabi-v7a | aosp_arm-eng |
| x86         | aosp_x86-eng |

​                         

使用MakeFile，开始编译动态库，选择Android版本和CPU架构，例如这里我准备编译的是 ：android-10.0.0_r2（android-29)，的armeabi-v7a版本：

```
cd /home/lds/workspace/miniperf
cd jni/minicap-shared/aosp
rm -rf ./libs
make aosp_dir=/home/lds/workspace/aosp/ libs/android-29/armeabi-v7a/minicap.so
```

请耐心等待，该命令会将进入docker进行编译，第1次编译时间大概5分钟。

编译后的so文件在target所指目录。

​                 

# 开发环境(minicap)

该环境用于编译 minicap 子项目，只需要NDK开发环境。

​                

环境要求：

* windows, linux, mac开发机。
* ndk r10e 2015, [下载地址](https://developer.android.com/ndk/downloads/older_releases)

​              

Step 1： 新建本地的 **工作目录** , 例如 “e:\project\android”， 拉取项目源码：

```
cd e:\project\android
git clone git@github.com:sandin/miniperf.git
cd miniperf
git submodule update --init --recursive
```

​                  

Step 2：在项目根目录miniperf, 编译代码 ：

```
ndk-build NDK_Debug=1
```

编译产出文件为:

* libs/armeabi-v7a/minicap
* libs/armeabi-v7a/minicap-nopie
* libs/armeabi-v7a/minicap.so (mock版本)

​                     

该项目编译minicap项目时候，其实是依赖的mock的minicap-shared动态库，而在运行的时候是拷贝和Android源码一起编译的真实的minicap-shared动态库。因此单独编译minicap项目时是不需要android源码编译环境的，可以直接在有NDK的任何开发环境下进行编译。