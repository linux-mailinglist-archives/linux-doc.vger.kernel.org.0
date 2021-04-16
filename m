Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2EA361DFA
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 12:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239256AbhDPKc1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Apr 2021 06:32:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40384 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238743AbhDPKc0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 06:32:26 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxucmRZ3lgFq8IAA--.15956S10;
        Fri, 16 Apr 2021 18:31:52 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: [PATCH v7 08/11] docs/zh_CN: add openrisc openrisc_port.rst translation
Date:   Fri, 16 Apr 2021 18:32:31 +0800
Message-Id: <e116b3020dfd181c15a59ecf41673cd4dbeea3b2.1618568135.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1618568135.git.siyanteng@loongson.cn>
References: <cover.1618568135.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxucmRZ3lgFq8IAA--.15956S10
X-Coremail-Antispam: 1UD129KBjvJXoWxuw17CFy5AFWxZF1DGFW7Jwb_yoW7WryrpF
        ZxWryxGF1UJryqyw1UKr1UXr18Gw18Jr4UJas7Xw18Jr1qyr1UJr1DGw1rJr98GryUZFyU
        ZF1UKr17GFyUAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAv
        wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
        AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6OJrUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch tranlates Documentation/openrisc/openrisc_port.rst into Chinese

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/openrisc/openrisc_port.rst          | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/openrisc/openrisc_port.rst

diff --git a/Documentation/translations/zh_CN/openrisc/openrisc_port.rst b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
new file mode 100644
index 000000000000..e87d0eec281d
--- /dev/null
+++ b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
@@ -0,0 +1,124 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../openrisc/openrisc_port`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_openrisc_port:
+
+==============
+OpenRISC Linux
+==============
+
+这是Linux对OpenRISC类微处理器的移植；具体来说，最早移植目标是32位
+OpenRISC 1000系列（或1k）。
+
+关于OpenRISC处理器和正在进行中的开发的信息:
+
+	=======		=============================
+	网站		https://openrisc.io
+	邮箱		openrisc@lists.librecores.org
+	=======		=============================
+
+---------------------------------------------------------------------
+
+OpenRISC工具链和Linux的构建指南
+===============================
+
+为了构建和运行Linux for OpenRISC，你至少需要一个基本的工具链，或许
+还需要架构模拟器。 这里概述了准备就位这些部分的步骤。
+
+1) 工具链
+
+工具链二进制文件可以从openrisc.io或我们的github发布页面获得。不同
+工具链的构建指南可以在openrisc.io或Stafford的工具链构建和发布脚本
+中找到。
+
+	======      =================================================
+	二进制      https://github.com/openrisc/or1k-gcc/releases
+	工具链      https://openrisc.io/software
+	构建        https://github.com/stffrdhrn/or1k-toolchain-build
+	======      =================================================
+
+2) 构建
+
+像往常一样构建Linux内核::
+
+	make ARCH=openrisc CROSS_COMPILE="or1k-linux-" defconfig
+	make ARCH=openrisc CROSS_COMPILE="or1k-linux-"
+
+3) 在FPGA上运行（可选)
+
+OpenRISC社区通常使用FuseSoC来管理构建和编程SoC到FPGA中。 下面是用
+OpenRISC SoC对De0 Nano开发板进行编程的一个例子。 在构建过程中，
+FPGA RTL是从FuseSoC IP核库中下载的代码，并使用FPGA供应商工具构建。
+二进制文件用openocd加载到电路板上。
+
+::
+
+	git clone https://github.com/olofk/fusesoc
+	cd fusesoc
+	sudo pip install -e .
+
+	fusesoc init
+	fusesoc build de0_nano
+	fusesoc pgm de0_nano
+
+	openocd -f interface/altera-usb-blaster.cfg \
+		-f board/or1k_generic.cfg
+
+	telnet localhost 4444
+	> init
+	> halt; load_image vmlinux ; reset
+
+4) 在模拟器上运行（可选）
+
+QEMU是一个处理器仿真器，我们推荐它来模拟OpenRISC平台。 请按照QEMU网
+站上的OpenRISC说明，让Linux在QEMU上运行。 你可以自己构建QEMU，但你的
+Linux发行版可能提供了支持OpenRISC的二进制包。
+
+	=============	======================================================
+	qemu openrisc	https://wiki.qemu.org/Documentation/Platforms/OpenRISC
+	=============	======================================================
+
+---------------------------------------------------------------------
+
+术语表
+======
+
+代码中使用了以下符号约定以将范围限制在几个特定处理器实现上：
+
+========= =======================
+openrisc: OpenRISC类型处理器
+or1k:     OpenRISC 1000系列处理器
+or1200:   OpenRISC 1200处理器
+========= =======================
+
+---------------------------------------------------------------------
+
+历史
+====
+
+2003-11-18	Matjaz Breskvar (phoenix@bsemi.com)
+   将linux初步移植到OpenRISC或32架构。
+       所有的核心功能都实现了，并且可以使用。
+
+2003-12-08	Matjaz Breskvar (phoenix@bsemi.com)
+   彻底改变TLB失误处理。
+   重写异常处理。
+   在默认的initrd中实现了sash-3.6的所有功能。
+   大幅改进的版本。
+
+2004-04-10	Matjaz Breskvar (phoenix@bsemi.com)
+   大量的bug修复。
+   支持以太网，http和telnet服务器功能。
+   可以运行许多标准的linux应用程序。
+
+2004-06-26	Matjaz Breskvar (phoenix@bsemi.com)
+   移植到2.6.x。
+
+2004-11-30	Matjaz Breskvar (phoenix@bsemi.com)
+   大量的bug修复和增强功能。
+   增加了opencores framebuffer驱动。
+
+2010-10-09    Jonas Bonn (jonas@southpole.se)
+   重大重写，使其与上游的Linux 2.6.36看齐。
-- 
2.27.0

