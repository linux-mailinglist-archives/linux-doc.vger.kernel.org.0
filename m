Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7907495876
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jan 2022 04:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbiAUDBf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Jan 2022 22:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbiAUDBe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jan 2022 22:01:34 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74780C061574
        for <linux-doc@vger.kernel.org>; Thu, 20 Jan 2022 19:01:34 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l16so8146952pjl.4
        for <linux-doc@vger.kernel.org>; Thu, 20 Jan 2022 19:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1fXEF5LpWOlv+sZ7RMjwMepAog1M8QQCH/EboOKVsE=;
        b=SUGNsCnddqHa27rsCnkb4dt0VSzRx2ynGFTLY9sGNG9n0Og0EsTkosWiwIuR1C/fpY
         YKJV3mqh3NEKU65HrNOfbCB+U0sQ98W60YWsQGxNqxT2didYSge1NfalJWmrCrkdP0sp
         mMtrVj6WmhOfRxGwRh/4SevVLtnXk1b22ziWmZRH7P4AD9dKd3604JeZ+D6OUVM+r3vP
         db8tdcEqo9Ej23GAnlEOoOOpPrkBiLUUHuobTR8nEo3CXqS/dWcbZ5Qi+Dey8JDuI8jx
         YJTx03yNl56Wjd+3dzkm+0yJIt0LB7WKlRi5kPTSdB5zpFYAaLUqPTkIEZ1l8Y/NH3y7
         hTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1fXEF5LpWOlv+sZ7RMjwMepAog1M8QQCH/EboOKVsE=;
        b=YafW8ZoEEHC5a4lzQJ31s/c/LCaZbtNbQc3jpR20v9bKSXLZ4ssmTJG6WCZVsePBw9
         DJdeA4vVpWBQt1r18LMdzC3zr242V+NMnXsLoVxs4TQKavR9PDdhIFWYC5srSdaV0ryI
         i5YtEBxf2ySc+cnGSvIQHKa+hBknrFPOkely4+SbSZ8NjXwtkCL93B409y7EfjRzzKD+
         Jocqewly0W5b3ICz1zfYRQdyRPpGVXZnn40BDUurGUAoJR2hPi+Q4s2CMRm/ZRCMPY7s
         c5i7RIhI3+LfScbq6hd3m+4HAqn/m4FKkNVoFW2lFAkXnB0/5gy3u5pRaeK3nfaEREct
         c1tQ==
X-Gm-Message-State: AOAM533VtFC+0RhQ6mX3q+f1ZujZqkOzivifB4jN/6QG1ILqpLIWbapy
        XforU2r7I/aWDJ6j4TbiwfGPOhVzskK2cy80
X-Google-Smtp-Source: ABdhPJyglT74Y26pfPISFTx7Smw0Jhm8S/aikg4kJQvwgLrUNSXEnZCzDsm9tSNUYhg7r2a4BJHIpg==
X-Received: by 2002:a17:902:74c4:b0:14a:d5f6:1f1c with SMTP id f4-20020a17090274c400b0014ad5f61f1cmr2197865plt.56.1642734093490;
        Thu, 20 Jan 2022 19:01:33 -0800 (PST)
Received: from localhost.localdomain (pcd453025.netvigator.com. [203.218.243.25])
        by smtp.gmail.com with ESMTPSA id z124sm4462429pfb.166.2022.01.20.19.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 19:01:33 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH] docs/zh_CN: add PCI acpi-info translation
Date:   Fri, 21 Jan 2022 10:58:12 +0800
Message-Id: <20220121025812.3650720-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../PCI/acpi-info.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/PCI/acpi-info.rst      | 140 ++++++++++++++++++
 .../translations/zh_CN/PCI/index.rst          |  13 +-
 2 files changed, 145 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/acpi-info.rst

diff --git a/Documentation/translations/zh_CN/PCI/acpi-info.rst b/Documentation/translations/zh_CN/PCI/acpi-info.rst
new file mode 100644
index 000000000000..784ee818164e
--- /dev/null
+++ b/Documentation/translations/zh_CN/PCI/acpi-info.rst
@@ -0,0 +1,140 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/PCI/acpi-info.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+=====================
+PCI主桥的ACPI注意事项
+=====================
+
+一般的规则是，ACPI命名空间应该描述操作系统可能使用的所有东西，除非有其他方法让操作系
+统找到它[1, 2]。
+
+例如，没有标准的硬件机制来枚举PCI主桥，所以ACPI命名空间必须描述每个主桥，访问它
+下面的PCI配置空间的方法，主桥转发到PCI的地址空间窗口（使用_CRS），以及传统的INTx
+中断的路由（使用_PRT）。
+
+PCI设备，在主桥下面，通常不需要通过ACPI描述。操作系统可以通过标准的PCI枚举机制来
+发现它们，使用配置访问来发现和识别设备，并读取和测量它们的BAR。然而，如果ACPI为它们
+提供电源管理或热插拔功能，或者如果设备有INTx中断，由平台中断控制器连接，需要一个_PRT
+来描述这些连接，这种情况下ACPI可以描述PCI设备。
+
+ACPI资源描述是通过ACPI命名空间中设备的_CRS对象完成的[2]。_CRS就像一个通用的PCI BAR：
+操作系统可以读取_CRS并找出正在消耗的资源，即使它没有该设备的驱动程序[3]。这一点很重要，
+因为它意味着一个旧的操作系统可以正确地工作，即使是在操作系统不知道的新设备的系统上。新设
+备可能什么都不做，但操作系统至少可以确保没有资源与它们冲突。
+
+像MCFG、HPET、ECDT等静态表，不是保留地址空间的机制。静态表是用于操作系统在启动初期需要
+知道的东西，在它能够解析ACPI命名空间之前。如果定义了一个新的表，即使旧的操作系统忽略了这
+个表，它也需要正常运行。_CRS允许这样做，因为它是通用的，可以被旧的操作系统理解；而静态表
+则不允许。
+
+如果操作系统要管理一个通过ACPI描述的不可发现的设备，该设备将有一个特定的_HID/_CID，操
+作系统将其告诉操作系统与之绑定的驱动程序，并且_CRS告诉操作系统和驱动程序该设备的寄存器在
+哪里。
+
+PCI主桥是PNP0A03或PNP0A08设备。它们的_CRS应该描述它们所消耗的所有地址空间。这包括它
+们转发到PCI总线上的所有窗口，以及不转发到PCI的主桥本身的寄存器。主桥的寄存器包括次要/下
+级总线寄存器，决定了桥下面的总线范围，窗口寄存器描述了桥洞，等等。这些都是设备相关的，非
+架构相关的东西，所以PNP0A03/PNP0A08驱动可以管理它们的唯一方法是通过_PRS/_CRS/_SRS，
+它包含了特定于设备的细节。主桥寄存器也包括ECAM空间，因为它是由主桥消耗的。
+
+ACPI 定义了一个 Consumer/Producer 位来区分桥寄存器（”Consumer“下文译作消费者）和
+桥洞（”Producer“下文译作生产者）[4, 5]，但是早期的 BIOS 没有正确使用这个位。其结果
+是，目前的ACPI规范只为扩展地址空间描述符定义了消费者/生产者；在旧的QWord/Word/Word地
+址空间描述符中，该位应该被忽略。因此，操作系统必须假定所有的QWord/Word/Word描述符都是
+窗口。
+
+在增加扩展地址空间描述符之前，消费者/生产者的失败意味着没有办法描述PNP0A03/PNP0A08设
+备本身的桥寄存器。解决办法是在 PNP0C02 捕捉器中描述桥寄存器（包括 ECAM 空间）[6]。
+除了 ECAM 之外，桥寄存器空间反正是特定于设备的，所以通用的 PNP0A03/PNP0A08 驱动程
+序 (pci_root.c) 没有必要了解它。
+
+新的架构应该能够在 PNP0A03 设备中使用”消费者“扩展地址空间描述符，用于桥寄存器，包括
+ECAM，尽管对 [6] 的严格解释可能禁止这样做。旧的 x86 和 ia64 内核假定所有的地址空间
+描述符，包括”消费者“扩展地址空间的描述符，都是窗口，所以在这些架构上以这种方式描述桥寄
+存器是不安全的。
+
+PNP0C02 ”主板“设备基本上是万能的。除了”不要将这些资源用于其他用途“之外，没有其他的编
+程模型。因此，PNP0C02 _CRS应该要求任何地址空间，这些地址空间（1）没有被ACPI命名空间
+中任何其他设备对象下的_CRS要求，（2）不应该被操作系统分配给其他东西。
+
+除非有一个标准的固件接口用于配置访问，例如ia64 SAL接口[7], 否则PCIe规范要求使用增强
+型配置访问方法（ECAM）。主桥消耗ECAM内存地址空间并将内存访问转换为PCI配置访问。该规范
+定义了ECAM地址空间的布局和功能；只有地址空间的基础是特定于设备的。ACPI操作系统从静态
+MCFG表或PNP0A03设备中的_CBA方法中了解基础地址。
+
+MCFG表必须描述非热插拔主桥的ECAM空间[8]。由于MCFG是一个静态表，不能通过热插拔更新，
+PNP0A03设备中的_CBA方法描述了可热插拔主桥的ECAM空间[9]。请注意，对于 MCFG 和 _CBA，
+基址总是对应于总线 0，即使桥器下面的总线范围（通过 _CRS 报告）不从 0 开始。
+
+
+[1] ACPI 6.2, sec 6.1:
+    对于任何在非枚举类型的总线上的设备（例如，ISA总线），OSPM会枚举设备的标识符，ACPI
+    系统固件必须为每个设备提供一个_HID对象...以使OSPM能够做到这一点。
+
+[2] ACPI 6.2, sec 3.7:
+    操作系统枚举主板设备时，只需通过读取ACPI命名空间来寻找具有硬件ID的设备。
+
+    ACPI枚举的每个设备都包括ACPI命名空间中ACPI定义的对象，该对象报告设备可能占用的硬
+    件资源[_PRS]，报告设备当前使用的资源[_CRS]的对象，以及配置这些资源的对象[_SRS]。
+    这些信息被即插即用操作系统（OSPM）用来配置设备。
+
+[3] ACPI 6.2, sec 6.2:
+    OSPM使用设备配置对象来配置通过ACPI列举的设备的硬件资源。设备配置对象提供了关于当前
+    和可能的资源需求的信息，共享资源之间的关系，以及配置硬件资源的方法。
+
+    当OSPM枚举一个设备时，它调用_PRS来确定该设备的资源需求。它也可以调用_CRS来找到该设
+    备的当前资源设置。利用这些信息，即插即用系统决定设备应该消耗什么资源，并通过调用设备
+    的_SRS控制方法来设置这些资源。
+
+    在ACPI中，设备可以消耗资源（例如，传统的键盘），提供资源（例如，一个专有的PCI桥），
+    或者两者都做。除非另有规定，设备的资源被假定为来自设备层次结构中设备上方最近的匹配资
+    源。
+
+[4] ACPI 6.2, sec 6.4.3.5.1, 2, 3, 4:
+    QWord/DWord/Word 地址空间描述符 (.1, .2, .3)
+      常规标志: Bit [0] 被忽略。
+
+    扩展地址空间描述符 (.4)
+      常规标志: Bit [0] 消费者/生产者:
+
+        * 1 – 这个设备消费这个资源
+        * 0 – 该设备生产和消费该资源
+
+[5] ACPI 6.2, sec 19.6.43:
+    ResourceUsage指定内存范围是由这个设备（ResourceConsumer）消费还是传递给子设备
+    （ResourceProducer）。如果没有指定，那么就假定是ResourceConsumer。
+
+[6] PCI Firmware 3.2, sec 4.1.2:
+    如果操作系统不能原生的懂得保留MMCFG区域，MMCFG区域必须由固件保留。在MCFG表中或通
+    过_CBA方法（见第4.1.3节）报告的地址范围必须通过声明主板资源来保留。对于大多数系统，
+    主板资源将出现在ACPI命名空间的根部（在_SB下），在一个节点的_HID为EISAID（PNP0C0
+    2），在这种情况下的资源不应该要求在根PCI总线的_CRS。这些资源可以选择在Int15 E820
+    或EFIGetMemoryMap中作为保留内存返回，但必须始终通过ACPI作为主板资源报告。
+
+[7] PCI Express 4.0, sec 7.2.2:
+    对于PC兼容的系统，或者没有实现允许访问配置空间的处理器架构特定固件接口标准的系统，需
+    要使用本节中定义的ECAM。
+
+[8] PCI Firmware 3.2, sec 4.1.2:
+    MCFG表是一个ACPI表，用于沟通的基础地址对应的非热的可移动的PCI段组范围内的PCI段组在
+    启动时提供给操作系统。这对PC兼容系统来说是必需的。
+
+    MCFG表仅用于通信的基地址对应的PCI段组可用的系统在启动。
+
+[9] PCI Firmware 3.2, sec 4.1.3:
+    _CBA (Memory mapped Configuration Base Address) 控制方法是一个可选的ACPI对
+    象，用于返回热插拔主桥的64位内存映射的配置基址。_CBA 返回的基址是与处理器相关的地址。
+    _CBA 控制方法被评估为一个整数。
+
+    这个控制方法出现在主桥对象下。当_CBA方法出现在一个活动的主桥对象下时，操作系统会评
+    估这个结构，以确定内存映射的配置基址，对应于_CRS方法中指定的总线编号范围的PCI段组。
+    一个包含_CBA方法的ACPI命名空间对象也必须包含一个相应的_SEG方法。
diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentation/translations/zh_CN/PCI/index.rst
index 16acb2bd9b58..cbeb33c34a98 100644
--- a/Documentation/translations/zh_CN/PCI/index.rst
+++ b/Documentation/translations/zh_CN/PCI/index.rst
@@ -10,9 +10,6 @@
 :校译:
 
 
-
-.. _cn_PCI_index.rst:
-
 ===================
 Linux PCI总线子系统
 ===================
@@ -26,12 +23,12 @@ Linux PCI总线子系统
    pci-iov-howto
    msi-howto
    sysfs-pci
+   acpi-info
 
 
 Todolist:
 
-   acpi-info
-   pci-error-recovery
-   pcieaer-howto
-   endpoint/index
-   boot-interrupts
+* pci-error-recovery
+* pcieaer-howto
+* endpoint/index
+* boot-interrupts
-- 
2.27.0

