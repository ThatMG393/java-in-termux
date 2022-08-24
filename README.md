[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FThatMG393%2Fjava-in-termux&count_bg=%233DACC8&title_bg=%23555555&icon=github.svg&icon_color=%23F0F0F0&title=Visits&edge_flat=true)](https://hits.seeyoufarm.com)

# Introduction
Hello people, today I bring to you a script to install Java in [Termux](https://termux.com) without root!

# Availability
**You can check your CPU architecture by using: `uname -m`**
| CPU Architecture | Java support |
| ---------------- | ------------ |
| `aarch64/armv8a` | `11` & `8` |
| `arm64` | `11` & `8` |
| `armhf` | `8` |
| `armv7l` | `8` |
| `arm/arm32/arm-v7a` | `8` |
| `armv8l` | `8` |

_Note: JDK 8 May be buggy, Any help to fix bugs would be appreciated._

# Installation
```
git clone --depth 1 https://github.com/ThatMG393/java-in-termux.git && cd java-in-termux && bash install.sh
```
- Java will be installed, check it by running `java --version` command from terminal after you restart
- JDK size is around ~231MB(JDK11), 70MB(JDK8) or just 20MB (incase of partial installation for 64-bit cpus) and needs stable internet for proper installation
- Restart Termux after installation

# Credits
- JDK 8 is made by [Hax4us](https://github.com/Hax4us/java) and compiled to debian package by me.
- JDK11(partial) is from [JVDroid](https://play.google.com/store/apps/details?id=ru.iiec.jvdroid)
- JDK11 is from Lzhiyong's [Termux-ndk](https://github.com/Lzhiyong/termux-ndk/tree/master/openjdk-build) repo
- JDK 9 is from archived Termux's disabled package
