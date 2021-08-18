Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD5A3F07F9
	for <lists+linux-doc@lfdr.de>; Wed, 18 Aug 2021 17:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239790AbhHRPXY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Aug 2021 11:23:24 -0400
Received: from m12-18.163.com ([220.181.12.18]:35401 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239659AbhHRPXV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Aug 2021 11:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NFWuP
        t+5+UQKauU4zNDdtzEKlP1wWNgfBYlBgarHjkE=; b=QI0D/Eg/NkW/aE8KDAqRs
        tPG9593NiVMzcMpSsofpFfHTVo4jsyaoljVfXIWJXA5m8DOmAKojNCmU9jkBKQU7
        F/0l15sC5g8d1psFfzANmue4UuHHVizy+W8HjDgrxmmJJPMcRtjIV04NYEzoDzGV
        Y5KGxgZWmvXdSnOpHgjleQ=
Received: from ubuntu.localdomain (unknown [183.220.91.67])
        by smtp14 (Coremail) with SMTP id EsCowADX3c26JR1hzeAw0g--.18918S2;
        Wed, 18 Aug 2021 23:22:35 +0800 (CST)
From:   Junhua Huang <junhuahuangdream@163.com>
To:     alexs@kernel.org, corbet@lwn.net, bobwxc@email.cn
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Junhua Huang <huang.junhua@zte.com.cn>
Subject: [PATCH] docs/zh_CN: Add zh_CN/admin-guide/sysrq.rst
Date:   Wed, 18 Aug 2021 08:22:21 -0700
Message-Id: <20210818152221.208236-1-junhuahuangdream@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=Y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowADX3c26JR1hzeAw0g--.18918S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUDBOJDUUUU
X-Originating-IP: [183.220.91.67]
X-CM-SenderInfo: xmxqx3pdkxt05jguvtrp6rljoofrz/1tbiZRvyZV8ZQcV+BwAAsS
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Junhua Huang <huang.junhua@zte.com.cn>

Add translation zh_CN/admin-guide/sysrq.rst and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Junhua Huang <huang.junhua@zte.com.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 .../translations/zh_CN/admin-guide/sysrq.rst  | 274 ++++++++++++++++++
 2 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/sysrq.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 460034cbc2ab..83db84282562 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -67,6 +67,7 @@ Todolist:
    cpu-load
    lockup-watchdogs
    unicode
+   sysrq
 
 Todolist:
 
@@ -118,7 +119,6 @@ Todolist:
    rtc
    serial-console
    svga
-   sysrq
    thunderbolt
    ufs
    vga-softcursor
diff --git a/Documentation/translations/zh_CN/admin-guide/sysrq.rst b/Documentation/translations/zh_CN/admin-guide/sysrq.rst
new file mode 100644
index 000000000000..c98a308b3cd9
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/sysrq.rst
@@ -0,0 +1,274 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/sysrq.rst
+
+:Translator: huang.junhua <huang.junhua@zte.com.cn>
+
+Linux 魔法系统请求键骇客
+========================
+
+针对 sysrq.c 的文档说明
+
+什么是魔法 SysRq 键？
+~~~~~~~~~~~~~~~~~~~~~
+
+它是一个你可以输入的具有魔法般的组合键。
+无论内核在做什么，内核都会响应 SysRq 键的输入，除非内核完全卡住。
+
+如何使能魔法 SysRq 键？
+~~~~~~~~~~~~~~~~~~~~~~~
+
+在配置内核时，我们需要设置 'Magic SysRq key (CONFIG_MAGIC_SYSRQ)' 为 'Y'。
+当运行的内核已经编译进 sysrq 功能后，/proc/sys/kernel/sysrq 控制着被
+SysRq 键调用的功能许可。这个文件的默认值由 CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE
+配置符号设定，文件本身默认设置为 1。以下是 /proc/sys/kernel/sysrq 中可能的
+值列表：
+
+   -  0 - 完全不使能 SysRq 键
+   -  1 - 使能 SysRq 键的全部功能
+   - >1 - 对于允许的 SysRq 键功能的比特掩码（参见下面更详细的功能描述）::
+
+          2 =   0x2 - 使能对控制台日志记录级别的控制
+          4 =   0x4 - 使能对键盘的控制 (SAK, unraw)
+          8 =   0x8 - 使能对进程的调试导出等
+         16 =  0x10 - 使能同步命令
+         32 =  0x20 - 使能重新挂载只读
+         64 =  0x40 - 使能对进程的信号操作 (term, kill, oom-kill)
+        128 =  0x80 - 允许重启、断电
+        256 = 0x100 - 允许让所有实时任务变普通任务
+
+你可以通过如下命令把值设置到这个文件中::
+
+    echo "number" >/proc/sys/kernel/sysrq
+
+这里被写入的数字可以是 10 进制数，或者是带着 0x 前缀的 16 进制数。
+CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE 必须是以 16 进制数写入。
+
+注意，``/proc/sys/kernel/sysrq`` 的值只影响通过键盘触发 SySRq 的调用，
+对于通过 ``/proc/sysrq-trigger``的任何操作调用都是允许的
+（通过具有系统权限的用户）。
+
+如何使用魔法 SysRq 键？
+~~~~~~~~~~~~~~~~~~~~~~~
+
+在 x86 上
+	你可以按下键盘组合键 :kbd:`ALT-SysRq-<command key>`。
+
+	.. 注意::
+	   一些键盘可能没有标识 'SySRq' 键。'SySRq' 键也被当做 'Print Screen'键。
+	   同时有些键盘无法处理同时按下这么多键，因此你可以先按下键盘 :kbd:`Alt` 键，
+	   然后按下键盘 :kbd:`SysRq` 键，再释放键盘 :kbd:`SysRq` 键，之后按下键盘上命令键
+	   :kbd:`<command key>`，最后释放所有键。
+
+在 SPARC 架构上
+	你可以按下键盘组合键 :kbd:`ALT-STOP-<command key>`。
+
+在串行控制台（只针对 PC 类型的标准串口）
+        你可以发一个 ``BREAK``，然后在 5 秒内发送一个命令键，
+		发送 ``BREAK`` 两次将被翻译为一个正常的 BREAK 操作。
+
+在 PowerPC 上
+	按下键盘组合键 :kbd:`ALT - Print Screen`（或者 :kbd:`F13`）- :kbd:`<命令键>`。
+	:kbd:`Print Screen`（或者:kbd:`F13`）- :kbd:`<命令键>` 或许也能实现。
+
+在其他架构上
+	如果你知道其他架构的组合键，请告诉我，我可以把它们添加到这部分。
+
+在所有平台上
+	写一个字符到 /proc/sysrq-trigger 文件，例如::
+
+		echo t > /proc/sysrq-trigger
+
+这个命令键 :kbd:`<command key>` 是区分大小写的。
+
+什么是命令键？
+~~~~~~~~~~~~~~
+
+=========== ================================================================
+命令键	    功能
+=========== ================================================================
+``b``	    将立即重启系统，不会同步或者卸载磁盘。
+
+``c``	    将执行系统 crash，如果配置了系统 crashdump，将执行 crashdump。
+
+``d``	    显示所有持有的锁。
+
+``e``	    发送 SIGTERM 信号给所有进程，除了 init 进程。
+
+``f``	    将调用 oom killer 杀掉一个过渡占用内存的进程，如果什么任务都没杀，
+			也不会 panic。
+
+``g``	    kgdb 使用（内核调试器）。
+
+``h``	    将会显示帮助。（实际上除了这里列举的键，其他的都将显示帮助，
+			但是 ``h`` 容易记住）:-)
+
+``i``	    发送 SIGKILL 给所有进程，除了 init 进程。
+
+``j``	    强制性的 “解冻它” - 用于被 FIFREEZE ioctl 操作冻住的文件系统。
+
+``k``	    安全访问秘钥(SAK)杀掉在当前虚拟控制台的所有程序，注意：在 SAK 节下
+			查看重要论述。
+
+``l``	    显示所有活动 cpu 的栈回溯。
+
+``m``	    将导出当前内存信息到你的控制台。
+
+``n``	    用于使所有实时任务变成普通任务。
+
+``o``	    将关闭系统（如果配置和支持的话）。
+
+``p``	    将导出当前寄存器和标志位到控制台。
+
+``q``	    将导出每个 cpu 上所有已装备的高精度定时器
+			（不是完整的 time_list 文件显示的 timers）和所有时钟事件设备的
+			详细信息
+
+``r``	    关闭键盘的原始模式，设置为转换模式。
+
+``s``	    将尝试同步所有的已挂载文件系统。
+
+``t``	    将导出当前所有任务列表和它们的信息到控制台。
+
+``u``	    将尝试重新挂载已挂载文件系统为只读。
+
+``v``	    强制恢复帧缓存控制台。
+``v``	    触发 ETM 缓存导出 [ARM 架构特有]
+
+``w``	    导出处于不可中断状态（阻塞）的任务。
+
+``x``	    在 ppc/powerpc 平台上用于 xmon 接口。
+            在 sparc64 平台上用于显示全局的 PMU（性能监控单元） 寄存器。
+            在 MIPS 平台上导出所有的 tlb 条目。
+
+``y``	    显示全局 cpu 寄存器 [SPARC-64 特有]
+
+``z``	    导出 ftrace 缓存信息
+
+``0``-``9`` 设置控制台日志级别，该级别控制什么样的内核信息将被打印到你的
+			控制台。（比如``0``，将使得只有紧急信息，像 PANICs or OOPSes
+			才能到你的控制台。）
+=========== ================================================================
+
+好了，我能用他们做什么呢？
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+嗯，当你的 X 服务端或者 svgalib 程序崩溃，unraw(r) 非原始模式命令键是非常
+方便的。
+
+sak(k)（安全访问秘钥）是有用的，在你想尝试登陆，想确保当前控制台没有可以
+获取你的密码的特洛伊木马程序运行时。它会杀掉给定控制台的所有程序，这样你
+就可以确认当前的登陆提示程序是实际来自 init 进程的程序，而不是某些特洛伊
+木马程序。
+
+.. 重要::
+
+   在其实际的形式中，在兼容 C2 安全标准的系统上，它不是一个真正的 SAK，
+   它也不应该误认为此。
+
+似乎其他人发现其可以作为（系统注意键）当你想退出一个程序，
+同时不会让你切换控制台的方法。（比如，X 服务端或者 svgalib 程序）
+
+``reboot(b)`` 是个好方法，当你不能关闭机器时，他等同于按下"复位"按钮。
+
+``crash(c)`` 可以用于手动触发一个 crashdump，当系统卡住时。
+注意当 crashdump 机制不可用时，这个只是触发一个内核 crash。
+
+``sync(s)`` 很方便，在拔除可移除的介质前，
+或者在使用一个只提供了非优雅关机操作的救援 shell 时--``sync(s)`` 操作
+将确保你的数据是安全的写入到磁盘中。
+注意同步操作直到你看到 "OK" 和 "Done" 出现在屏幕上，才算完成。
+
+``umount(u)`` 可以用来标记文件系统正常卸载，从正在运行的系统角度来看，他们将
+被重新挂载为只读。这个重新挂载动作直到你看到 "OK" 和 "Done" 信息出现在屏幕上
+才算完成。
+
+日志级别``0``-``9``用于当你的控制台被大量的内核信息冲击，你不想看见的时候。
+选择 ``0`` 将禁止除了最紧急的内核信息外的所有的内核信息输出到控制台。（但是如果
+syslogd/klogd 进程是运行的，它们仍将被记录。）
+
+``term(e)`` 和 ``kill(i)`` 用于当你有些有点失控的进程，你无法通过其他方式杀掉
+它们的时候，特别是它正在创建其他进程。
+
+"just thaw ``it(j)``" 用于当你的系统由于一个 FIFREEZE ioctl 调用而产生的文件
+系统冻结，而导致的不响应时。
+
+有的时候 SysRq 键在使用它之后，看起来像是“卡住”了，我能做些什么？
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+这也会发生在我这，我发现轻敲键盘两侧的 shift、alt 和 control 键，然后再次敲击
+一个无效的 SysRq 键序列可以解决问题。（比如，像键盘组合键 :kbd:`alt-sysrq-z`）
+切换到另一个虚拟控制台（键盘操作 :kbd:`ALT+Fn`），然后再切回来应该也有帮助。
+
+我敲击了 SysRq 键，但像是什么都没发生，发生了什么错误？
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+有一些键盘对于 SysRq 键设置了不同的键值，而不是提前定义的 99
+(查看在 ``include/uapi/linux/input-event-codes.h``文件中 ``KEY_SYSRQ`` 的定义)
+或者就根本没有 SysRq 键。在这些场景下，执行 ``showkey -s`` 命令来找到一个合适
+的扫描码序列，然后使用 ``setkeycodes <sequence> 99`` 命令映射这个序列值到通用
+的 SysRq 键编码上（比如 ``setkeycodes e05b 99``）。最好将这个命令放在启动脚本
+中。
+哦，顺便说一句，你十秒钟不输入任何东西就将退出 “showkey”。
+
+我想添加一个 SysRq 键事件到一个模块中，如何去做呢？
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+为了注册一个基础函数到这个表中，首先你必须包含 ``include/linux/sysrq.h`` 头
+文件，这个头文件定义了你所需要的所有东西。然后你必须创建一个 ``sysrq_key_op``
+结构体，然后初始化它使用如下内容，A） 你将使用的这个键的处理函数， B） 一个
+help_msg 字符串，在 SysRq 键打印帮助信息是将打印出来，C） 一个 action_msg 字
+符串，就在你的处理函数调用前打印出来。你的处理函数必须符合在 'sysrq.h' 文件中
+的原型。
+
+在 ``sysrq_key_op`` 结构体被创建后，你可以调用内核函数
+``register_sysrq_key(int key, const struct sysrq_key_op *op_p);``，
+该函数在表中的 'key' 对应位置内容是空的情况下，将通过 ``op_p`` 指针注册这个操作
+函数到表中 'key' 对应位置上。在模块卸载的时候，你必须调用
+``unregister_sysrq_key(int key, const struct sysrq_key_op *op_p)`` 函数，该函数
+只有在当前该键对应的处理函数被注册到了 'key' 对应位置时，才会移除 'op_p' 指针
+对应的键值操作函数。这是为了防止在你注册之后，该位置被改写的情况。
+
+魔法 SysRq 键系统的工作原理是将键对应操作函数注册到键的操作查找表，
+该表定义在 'drivers/tty/sysrq.c' 文件中。
+该键表有需要在编译时候就注册进去的操作，但是是可变的。
+并且有两个函数作为操作该表的接口被导出::
+
+	register_sysrq_key 和 unregister_sysrq_key.
+
+当然，永远不要在表中留下无效指针，即，当你的模块存在调用 register_sysrq_key()
+函数，它一定要调用 unregister_sysrq_key() 来清除它使用过的 SysRq 键表条目。
+表中的空指针是安全的。:)
+
+如果对于某种原因，在 handle_sysrq 调用的处理函数中，你认为有必要调用
+handle_sysrq 函数时，你必须意识到当前你处于一个锁中（你同时也处于一个中断处理
+函数中，这意味着不能睡眠）。所以这时你必须使用 ``__handle_sysrq_nolock`` 替代。
+
+当我敲击一个 SysRq 组合键时，只有标题打印出现在控制台？
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+SysRq 键的输出和所有其他控制台输出一样，受制于控制台日志级别控制。
+这意味着，如果内核以发行版内核中常见的 "quiet" 方式启动，则输出可能不会出现在实际
+的控制台上，即使它会出现在 dmesg 缓存中，也可以通过 dmesg 命令和 ``/proc/kmsg``
+文件的消费访问到。作为一个特例，来自 sysrq 命令的标题行将被传递给所有控制台
+使用者，就好像当前日志级别是最大的一样。如果只发出标题头，则几乎可以肯定内核日志
+级别太低。如果您需要控制台上的输出，那么您将需要临时提高控制台日志级别，通过使用
+键盘组合键 :kbd:`alt-sysrq-8` 或者::
+
+    echo 8 > /proc/sysrq-trigger
+
+在触发了你感兴趣的 SysRq 键命令后，记住恢复日志级别到正常情况。
+
+我有很多问题，我可以问谁？
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+询问在内核邮件列表上人，邮箱：
+	linux-kernel@vger.kernel.org
+
+致谢
+~~~~
+
+- Mydraal <vulpyne@vulpyne.net> 撰写了该文件
+- Adam Sulmicki <adam@cfar.umd.edu> 进行了更新
+- Jeremy M. Dolan <jmd@turbogeek.org> 在 2001/01/28 10:15:59 进行了更新
+- Crutcher Dunnavant <crutcher+kernel@datastacks.com> 进行了相关添加
-- 
2.25.1


