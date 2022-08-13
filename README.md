[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fsuhan-paradkar%2Fjava-in-termux&count_bg=%2367CB1B&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=true)](https://hits.seeyoufarm.com)

# Hello People,
Today I bring to you a script to install Java in [Termux](https://termux.com) without root!

# Downloads Available for
**You can check your CPU architecture by using: `uname -a`**
| CPU Architecture | Java support |
| ---------------- | ------------ |
| `aarch64` | `11` & `8` |
| | |
| `arm64` | `11` & `8` |
| `armhf` | `8` |
| `armv7l` | `8` |
| `arm/arm32/armv7/aarch32` | `8` |
| `armv8l` | `8` |

_Note: JDK 8 May be buggy, Anyhelp would be appreciated._

# Installation
```
git clone https://github.com/ThatMG393/java-in-termux.git --depth=1
cd java-in-termux
chmod +x install.sh
```
**and**
```
  bash install.sh
```
- Java will be installed, check it by running `java --version` command from terminal
- Package is about ~200MB(JDK11), 70MB(JDK8) or just 20MB (incase of partial installation for 64-bit cpus) and needs constant internet for proper installation
- Restart termux after installation

# Note
- JDK 8 is by [Hax4us](https://github.com/Hax4us/java) , compiled by me.
- JDK11(partial) is from [JVDroid](https://play.google.com/store/apps/details?id=ru.iiec.jvdroid)
- JDK11 is from Lzhiyong's repo [Termux-ndk](https://github.com/Lzhiyong/termux-ndk/tree/master/openjdk-build)
- JDK 9 is from archived Termux's disabled package
