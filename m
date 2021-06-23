Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E09C3B18AA
	for <lists+linux-doc@lfdr.de>; Wed, 23 Jun 2021 13:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhFWLQl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Jun 2021 07:16:41 -0400
Received: from m32-153.88.com ([43.250.32.153]:58762 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230473AbhFWLQd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=04sO4xF6SN29l5yUy3OIL2lQXOaGqwgYLbpSn
        v25ntQ=; b=kXjhHtrOYiNU1TwRJFyv5NsQ3XgE9RlmMRvrKgnDR+JzlkisBNDGx
        Pk/Vx0tcZev/eUmeLJEFB5d5BsDhA38FKrNgKoPmTreXaJxe8oO/49xBe2RP0/Lo
        jSZzasYlas52x24+7JBQ1WBumF+mHWd2EjZYdYWlBhdKqoudU/CPLU=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAn_ft6F9NgoC4mAA--.7709S2;
        Wed, 23 Jun 2021 19:14:05 +0800 (CST)
Date:   Wed, 23 Jun 2021 19:14:02 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] docs/zh_CN: Add translation
 zh_CN/admin-guide/initrd.rst
Message-ID: <0904d86edeb241ba88f210ab5b0bd88d38f17871.1624434673.git.bobwxc@email.cn>
References: <cover.1624434673.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1624434673.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAn_ft6F9NgoC4mAA--.7709S2
X-Coremail-Antispam: 1UD129KBjvAXoW3KrWxAw1rCFW8Zr15Ar13Arb_yoW8WFyUXo
        WIyw4rC3ykGan3XF15Kws3ZasrA3WxuFyDZ39rCrn5Cr1UGw4F9r1qyF15G3yYvF95Arnx
        tr1ft345Zay3Jrn5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5k7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gw4l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07jGjgxUUUUU=
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/admin-guide/initrd.rst
and link it to zh_CN/admin-guide/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 .../translations/zh_CN/admin-guide/initrd.rst | 321 ++++++++++++++++++
 2 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/initrd.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index d74f5e864898..843f0ced97a3 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -66,6 +66,7 @@ Todolist:
    clearing-warn-once
    cpu-load
    efi-stub
+   initrd
    lockup-watchdogs
    unicode
 
@@ -93,7 +94,6 @@ Todolist:
    gpio/index
    highuid
    hw_random
-   initrd
    iostats
    java
    jfs
diff --git a/Documentation/translations/zh_CN/admin-guide/initrd.rst b/Documentation/translations/zh_CN/admin-guide/initrd.rst
new file mode 100644
index 000000000000..fc60721f9b0c
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/initrd.rst
@@ -0,0 +1,321 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/initrd.rst
+
+:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+使用初始化RAM磁盘（initrd）
+===========================
+
+Werner Almesberger <werner.almesberger@epfl.ch> 和
+Hans Lermen <lermen@fgan.de> 写于1996、2000年。
+
+
+初始化RAM磁盘（initial RAM disk，initrd）提供了由引导加载程序加载RAM磁盘的
+能力。此RAM磁盘可被挂载为根文件系统并于其上运行程序。然后再从另一个不同的设备
+挂载新的根文件系统。前根文件系统（来自initrd）则被移动到一个目录并随后卸载。
+
+initrd主要设计为允许系统分两个阶段启动，其中内核以一最小内建驱动程序集启动，
+再从initrd加载其他模块。
+
+本文档简述了initrd的用法。更详细的有关引导过程的讨论见 [#f1]_ 。
+
+
+操作
+----
+
+使用initrd时，系统通常按如下步骤启动：
+
+  1) 引导加载程序加载内核和初始化RAM磁盘（initrd）
+  2) 内核将initrd转换为“普通”RAM磁盘，然后释放initrd使用的内存
+  3) 如果根设备不是 ``/dev/ram0`` ，则遵循旧的（已弃用）change_root 步骤。
+     请参阅“过时的根更改”“机制”一节
+  4) 根设备已挂载。如果是 ``/dev/ram0`` ，则initrd映像作为根目录挂载
+  5) 执行 ``/sbin/init`` （这可以是任何有效的可执行文件，包括shell脚本；
+     它以uid 0运行，基本可以执行所有初始化操作）
+  6) init挂载“真正的”根文件系统
+  7) init使用pivot_root系统调用将根文件系统放到根目录
+  8) init在新的根文件系统上执行 ``/sbin/init`` ，如同普通引导顺序
+  9) 移除initrd文件系统
+
+请注意，更改根目录并不涉及卸载它。因此在此期间可以继续让进程在initrd上运行。
+同时initrd下挂载的文件系统也仍可访问。
+
+
+启动命令行选项
+--------------
+
+initrd加入了以下新选项::
+
+  initrd=<path>    (例如 LOADLIN)
+
+    加载指定的文件作为initrd。使用LILO时，您必须在/etc/lilo.conf中使用
+    INITRD配置变量指定RAM磁盘映像文件。
+
+  noinitrd
+
+    initrd数据会被保留但不转换为RAM磁盘，并挂载“普通”根文件系统。可以从/dev/initrd
+    读取initrd数据。注意此种情况下initrd中的数据可以为任意结构，不一定要是文件
+    系统映像。
+    此选项主要用于调试。
+
+    注意：/dev/initrd为只读，且只能使用一次。当最后一个进程关闭它时，所有数据
+    都将被释放，/dev/initrd不再可打开。
+
+  root=/dev/ram0
+
+    initrd挂载为根目录，并以initrd为根目录执行普通的引导流程。
+
+压缩的cpio映像
+--------------
+
+内核现已支持从压缩的cpio存档文件提取数据到ramdisk。在这种系统上，创建ramdisk
+映像无需涉及特殊的块设备或回环；您只需在磁盘上创建一个包含所需initrd内容的目录，
+cd到该目录，然后运行（示例如下）::
+
+	find . | cpio --quiet -H newc -o | gzip -9 -n > /boot/imagefile.img
+
+检查现有映像文件的内容同样很简单::
+
+	mkdir /tmp/imagefile
+	cd /tmp/imagefile
+	gzip -cd /boot/imagefile.img | cpio -imd --quiet
+
+安装
+----
+
+首先，必须在“普通”根文件系统上创建一个给initrd文件系统的目录，例如::
+
+	# mkdir /initrd
+
+名字无关紧要。更多细节参见 :manpage:`pivot_root(2)` 手册页。
+
+如果根文件系统是在引导过程中创建的（例如你正在构建一个安装软盘），根文件系统
+的创建过程应创建 ``/initrd`` 目录。
+
+如果initrd在某些情况下不被挂载，则此时若已创建以下设备，其内容仍可访问::
+
+	# mknod /dev/initrd b 1 250
+	# chmod 400 /dev/initrd
+
+然后，内核必须在编译时启用RAM磁盘支持并打开initrd支持选项。此外至少所有从initrd
+执行程序依赖的组件（例如可执行格式和文件）都必须编译到内核中。
+
+最后，必须创建RAM磁盘映像。先创建一个块设备上的文件系统，将所需文件复制到其中，
+然后再将此块设备的内容复制进initrd文件。现时内核中至少有三种类型的设备适合于此：
+
+ - 软盘（兼容性强但速度慢得令人痛苦）
+ - RAM磁盘（快速但需要分配物理内存）
+ - 回环设备（最优雅的解决方案）
+
+我们将讲述使用回环设备的方法：
+
+ 1) 确保回环块设备被配置进内核了
+ 2) 创建一个适合大小的空文件系统，例如::
+
+	# dd if=/dev/zero of=initrd bs=300k count=1
+	# mke2fs -F -m0 initrd
+
+    （如果空间紧缺，您可能希望使用Minux FS来代替Ext2）
+ 3) 挂载此文件系统，例如::
+
+	# mount -t ext2 -o loop initrd /mnt
+
+ 4) 创建控制台设备::
+
+    # mkdir /mnt/dev
+    # mknod /mnt/dev/console c 5 1
+
+ 5) 复制正常使用initrd环境所需的所有文件。别忘了最重要的文件， ``/sbin/init``
+
+    .. note:: ``/sbin/init`` 必须有 ``x`` （执行）权限。
+
+ 6) 使用以下命令正确操作initrd环境可以频繁测试而无需重启::
+
+	# chroot /mnt /sbin/init
+
+    当然，这仅限于不干扰一般系统状态的initrd（例如通过重新配置网络接口、覆盖
+    已安装的设备、尝试启动已运行的守护进程等。不过请注意，在此类chroot的initrd
+    环境中，通常可以使用pivot_root）。
+
+ 7) 卸载此文件系统::
+
+	# umount /mnt
+
+ 8) initrd现在在文件“initrd”中。现在可以选择是否压缩::
+
+	# gzip -9 initrd
+
+使用initrd进行测试，您可能需要一张只添加了从 ``/sbin/init`` 到 ``/bin/sh`` 的
+符号链接的救援软盘。或者你可以尝试实验性的newlib环境 [#f2]_ 来创建一个小initrd。
+
+最后，必须引导内核并加载initrd。几乎所有Linux引导加载程序都支持initrd。因为
+引导过程仍然兼容旧的机制，以下引导命令行参数必须给出::
+
+  root=/dev/ram0 rw
+
+（只有在需要写入initrd文件系统时才需要rw）
+
+使用LOADLIN，你只需要执行::
+
+     LOADLIN <kernel> initrd=<disk_image>
+
+例如::
+
+	LOADLIN C:\LINUX\BZIMAGE initrd=C:\LINUX\INITRD.GZ root=/dev/ram0 rw
+
+W使用LILO，可以添加选项 ``INITRD=<path>`` 到 ``/etc/lilo.conf`` 全局设置部分
+或者相应内核的部分，然后通过使用APPEND传递选项，例如::
+
+  image = /bzImage
+    initrd = /boot/initrd.gz
+    append = "root=/dev/ram0 rw"
+
+并运行 ``/sbin/lilo``
+
+对应其他的启动引导加载器，请参考相关文档。
+
+现在你可以启动并愉快的玩耍initrd了。
+
+
+更改根设备
+----------
+
+完成任务后，init通常会更改根设备然后在“真正的”根设备上启动Linux系统。
+
+该流程包括以下步骤：
+ - 挂载新的根文件系统
+ - 把它切换成根文件系统
+ - 移除对旧（initrd）根文件系统的所有访问
+ - 卸载initrd文件系统并释放RAM磁盘
+
+挂载新的根文件系统很容易：只需将其挂载到当前根目录下的目录中。
+例如::
+
+	# mkdir /new-root
+	# mount -o ro /dev/hda1 /new-root
+
+更改根目录是通过 ``pivot_root`` 系统调用完成的，该调用也可以通过 ``pivot_root``
+实用程序使用（参见 :manpage:`pivot_root(8)` 手册页； ``pivot_root`` 与util-linux
+2.10h或更高版本一起分发 [#f3]_ ）。 ``pivot_root`` 根将当前根目录移到新根下的
+一个目录里，并设置好新根目录。调用它之前必须准备好给旧根的目录。
+例如::
+
+	# cd /new-root
+	# mkdir initrd
+	# pivot_root . initrd
+
+现在，init进程仍然可以通过其执行、共享库、标准输入/输出/错误流访问旧根目录和
+现在的根目录。所有这些引用都可被以下命令卸载::
+
+	# exec chroot . what-follows <dev/console >dev/console 2>&1
+
+what-follows是一个新根下的程序，例如 ``/sbin/init`` 。
+如果新根文件系统将与udev一起使用，并且无有效的 ``/dev`` 目录，则udev必须在按顺
+序调用chroot之前完成初始化以提供 ``/dev/console`` 。
+
+注意：pivot_root的实现细节可能会在未来出现变化。为确保兼容性，应遵守以下几点：
+
+ - 在调用pivot_root之前，调用进程的现目录应该指向新的根目录
+ - 使用 ``.`` 作为第一个参数，旧根目录的 *相对路径* 作为第二个参数
+ - chroot程序必须在新旧根目录下均可用
+ - 之后再chroot到新根目录
+ - 在exec命令中对dev/console使用相对路径
+
+现在，可以卸载initrd并释放分配的RAM内存磁盘::
+
+	# umount /initrd
+	# blockdev --flushbufs /dev/ram0
+
+也可以将initrd与NFS挂载的根目录一起使用，详细请参阅 :manpage:`pivot_root(8)`
+手册页。
+
+
+使用场景
+--------
+
+实现initrd的主要动机是在系统安装时允许模块化的内核配置。流程如下：
+
+  1) 系统用软盘或其他媒介上的最小内核引导（例如RAM磁盘支持、initrd、a.out和ext2
+     FS）并加载初始值
+  2) ``/sbin/init`` 确定需要（1）装入“真正”根文件系统的内容（即设备类型、
+     设备驱动程序、文件系统）和（2）分发介质（如CD-ROM、网络、磁带等）。
+     这可以通过询问用户、自动探测或混合使用来完成。
+  3) ``/sbin/init`` 加载必要的内核模块
+  4) ``/sbin/init`` 创建并填充根文件系统（这不必为一个非常有用的系统）
+  5) ``/sbin/init`` 调用 ``pivot_root`` 更改根文件系统并通过chroot执行一个程序
+     继续此安装
+  6) 引导加载程序已安装
+  7) 引导加载程序被配置为加载包含一系列模块、可用于启动系统的initrd。例如
+     ``/initrd`` 可被修改，然后卸载，最后映像被从 ``/dev/ram0`` 或 ``/dev/rd/0``
+     写入文件）
+  8) 现在系统可以启动，可以执行其他安装任务
+
+initrd的关键作用在于：无需使用臃肿的“通用”内核或重新编译/重新链接内核即可
+复用普通系统操作过程中的配置数据。
+
+第二个场景是在运行于单个管理域中不同硬件配置上的Linux安装。在在这种情况下，
+最好只生成很少一系列内核（最好就一个）并使配置信息中系统特定部分尽可能少。
+而公共initrd可以生成所有必要的模块。这样只有 ``/sbin/init`` 或者它读取的一个
+文件才必须是不同的。
+
+第三种情况是更方便的恢复磁盘。因为像根文件系统分区的位置之类的信息无需在引导
+时提供，但是从initrd加载的系统可以调用用户友好的对话框，它还可以执行一些健全
+性检查（或者甚至某种形式的自动检测）。
+
+最后一点也很重要，CD-ROM发行商可能会使用它以更好地从CD安装。例如使用引导软盘
+并通过CD上的initrd引导一个更大的RAM磁盘；或者通过像 ``LOADLIN`` 这样的启动器
+或者直接从CD-ROM中引导，以及在无需软盘的情况下直接从CD加载RAM磁盘。
+
+
+过时的根变更机制
+----------------
+
+在引入pivot_root之前，曾使用以下机制。当前的内核仍然支持它，但是你 *不应* 继续
+依赖它。
+
+它在linuxrc退出时挂载“真正的”根设备（即带有rdev的内核映像或启动命令行中的
+root=...）来工作在内核映像中或在引导命令行中使用root=…）作为根文件系统。
+initrd文件系统即行卸载，或若仍在忙，则将其移动到 ``/initrd`` 目录，如果这样
+的目录存在于新的根文件系统上的话。
+
+要使用此机制，您不必指定引导命令选项root、init或rw（如果指定，它们将影响真正的
+根文件系统，而不是initrd环境）。
+
+如果挂载了 ``/proc`` ，则可以通过将新根文件系统设备编号写入
+``/proc/sys/kernel/real-root-dev`` ，从linuxrc内部更改“真正的”根设备，例如::
+
+  # echo 0x301 >/proc/sys/kernel/real-root-dev
+
+请注意，该机制不兼容NFS及类似的文件系统。
+
+此过时的旧机制通常被称为 ``change_root`` ，同时新的、受支持的机制称为 ``pivot_root`` 。
+
+
+混用change_root和pivot_root机制
+-------------------------------
+
+如果你不想使用 ``root=dev/ram0`` 触发pivot_root机制，你可以在initrd映像中同时
+创建 ``/linuxrc`` 和 ``/sbin/init`` 。
+
+``/linuxrc`` 只包含以下内容::
+
+	#! /bin/sh
+	mount -n -t proc proc /proc
+	echo 0x0100 >/proc/sys/kernel/real-root-dev
+	umount -n /proc
+
+一旦linuxrc退出，内核将再次以根用户身份挂载initrd，并执行 ``/sbin/init`` 。
+此次初始化要在最终执行真正的 ``/sbin/init`` 之前建立正确的环境（可能是使用
+``root=device`` 传递命令行）。
+
+
+参考资料
+--------
+
+.. [#f1] Almesberger, Werner; "Booting Linux: The History and the Future（启动Linux，历史与未来）"
+    https://www.almesberger.net/cv/papers/ols2k-9.ps.gz
+.. [#f2] newlib包（实验性），附带initrd样例
+    https://www.sourceware.org/newlib/
+.. [#f3] util-linux：Linux的其他实用程序
+    https://www.kernel.org/pub/linux/utils/util-linux/
-- 
2.20.1

