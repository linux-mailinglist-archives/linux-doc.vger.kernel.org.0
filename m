Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C0B40F274
	for <lists+linux-doc@lfdr.de>; Fri, 17 Sep 2021 08:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244998AbhIQGfh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Sep 2021 02:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244445AbhIQGfg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 02:35:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4207C061574
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:14 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h3so8666110pgb.7
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xNU9kvKmzXg4bg4VSBGWx2lemGTstbHlBE/fKjAvzzU=;
        b=DehoFGVHOoO+nmqxX2gG2JQ987i2Gjq2Nyx2zs5KxZqCc/fBiVRH0FHZ2uWLGTldkG
         GgJO8l9GJFewVcjw2Qmfz8r7s42/cTTxDMqvkPWfm1vshfrCfcl56OdnL7URf9GPBE3Y
         IOMKclcVOqEJ69AIox5onQNfrYPlLiXjoNDOYHxr/gJ+ejH0U+AgFqGd2boOqD85el2+
         YB4MiDjm3/4deSMAHrWRwLeMsk/NT+zuL76u3eoalslBTSBI++janVdwVDI345c1PcEP
         CUjg6tg183w7rfnTRyuS6lLG9H4GAvFlt9pZKYrjeaTfpcbvRh82NWQznJwRfLIa9Gz1
         pcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNU9kvKmzXg4bg4VSBGWx2lemGTstbHlBE/fKjAvzzU=;
        b=t3cIwISAbsztck41X4WANRpbYkgI9KaZooRJmc//S3Jee/6k+E/XApxz4wA0wOpZhZ
         sDNdxY23gkCWWejwId9OJKJDUtF2Dnyo/vXzcf52HhxFZv1tL2E6irwV0J86eXjeV6KH
         o2hXaIZP/m6cO1V0yjQltqNXOJlQlINHmS/TzI7MlPw7sj4XtsbDv/xeMd6cDEut+J5Q
         m/tn1Fe0SDi6QUzklnv2TRmeg2dGG5eWW4y/Ene01bnbzV8r27bGnLqYfScsq1ZI3iiV
         P+fOKrDMq7iG28cTKbXkjJuML2oQTLla2TfGnf++kcX8C1lmiMefSjmAb2KKweQYxXP7
         r2dQ==
X-Gm-Message-State: AOAM532tNVgoT51Fpc4b6NNZSBJWBX1DVUUorKJqOKfyToTV8OihAB8o
        wPRVv2+73zKwBU5rrOzMBXGZMcvoI+t9Y2ul
X-Google-Smtp-Source: ABdhPJy2T72v0wYvSXLVvbADnmdoX8GR7YAXUwivHTHJ/RDaXKX774BCZBBkTSCE2NeKMZyVR+d6Rg==
X-Received: by 2002:aa7:950e:0:b0:444:b01a:9dd1 with SMTP id b14-20020aa7950e000000b00444b01a9dd1mr2150005pfp.72.1631860454273;
        Thu, 16 Sep 2021 23:34:14 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.169])
        by smtp.gmail.com with ESMTPSA id d4sm4723775pfv.21.2021.09.16.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 23:34:13 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v6 2/6] docs/zh_CN: add core-api unaligned-memory-access translation
Date:   Fri, 17 Sep 2021 14:33:03 +0800
Message-Id: <4554b1ee13b94f4425141bf586ff8708c70358cf.1631846923.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631846923.git.siyanteng@loongson.cn>
References: <cover.1631846923.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/unaligned-memory-access.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../core-api/unaligned-memory-access.rst      | 229 ++++++++++++++++++
 2 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index f07bd9cc1e4b..efc2fdd608ef 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -105,10 +105,10 @@ Todolist:
    :maxdepth: 1
 
    memory-allocation
+   unaligned-memory-access
 
 Todolist:
 
-   unaligned-memory-access
    dma-api
    dma-api-howto
    dma-attributes
diff --git a/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst b/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst
new file mode 100644
index 000000000000..29c33e7e0855
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst
@@ -0,0 +1,229 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/unaligned-memory-access.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮 <alexs@kernel.org>
+
+.. _cn_core-api_unaligned-memory-access:
+
+==============
+非对齐内存访问
+==============
+
+:作者: Daniel Drake <dsd@gentoo.org>,
+:作者: Johannes Berg <johannes@sipsolutions.net>
+
+:感谢他们的帮助: Alan Cox, Avuton Olrich, Heikki Orsila, Jan Engelhardt,
+  Kyle McMartin, Kyle Moffett, Randy Dunlap, Robert Hancock, Uli Kunitz,
+  Vadim Lobanov
+
+
+Linux运行在各种各样的架构上，这些架构在内存访问方面有不同的表现。本文介绍了一些
+关于不对齐访问的细节，为什么你需要编写不引起不对齐访问的代码，以及如何编写这样的
+代码
+
+
+非对齐访问的定义
+================
+
+当你试图从一个不被N偶数整除的地址（即addr % N != 0）开始读取N字节的数据时，就
+会发生无对齐内存访问。例如，从地址0x10004读取4个字节的数据是可以的，但从地址
+0x10005读取4个字节的数据将是一个不对齐的内存访问。
+
+上述内容可能看起来有点模糊，因为内存访问可以以不同的方式发生。这里的背景是在机器
+码层面上：某些指令在内存中读取或写入一些字节（例如x86汇编中的movb、movw、movl）。
+正如将变得清晰的那样，相对容易发现那些将编译为多字节内存访问指令的C语句，即在处理
+u16、u32和u64等类型时。
+
+
+自然对齐
+========
+
+上面提到的规则构成了我们所说的自然对齐。当访问N个字节的内存时，基础内存地址必须被
+N平均分割，即addr % N == 0。
+
+在编写代码时，假设目标架构有自然对齐的要求。
+
+在现实中，只有少数架构在所有大小的内存访问上都要求自然对齐。然而，我们必须考虑所
+有支持的架构；编写满足自然对齐要求的代码是实现完全可移植性的最简单方法。
+
+
+为什么非对齐访问时坏事
+======================
+
+执行非对齐内存访问的效果因架构不同而不同。在这里写一整篇关于这些差异的文档是很容
+易的；下面是对常见情况的总结:
+
+ - 一些架构能够透明地执行非对齐内存访问，但通常会有很大的性能代价。
+ - 当不对齐的访问发生时，一些架构会引发处理器异常。异常处理程序能够纠正不对齐的
+   访问，但要付出很大的性能代价。
+ - 一些架构在发生不对齐访问时，会引发处理器异常，但异常中并没有包含足够的信息来
+   纠正不对齐访问。
+ - 有些架构不能进行无对齐内存访问，但会默默地执行与请求不同的内存访问，从而导致
+   难以发现的微妙的代码错误!
+
+从上文可以看出，如果你的代码导致不对齐的内存访问发生，那么你的代码在某些平台上将无
+法正常工作，在其他平台上将导致性能问题。
+
+不会导致非对齐访问的代码
+========================
+
+起初，上面的概念似乎有点难以与实际编码实践联系起来。毕竟，你对某些变量的内存地址没
+有很大的控制权，等等。
+
+幸运的是事情并不复杂，因为在大多数情况下，编译器会确保代码工作正常。例如，以下面的
+结构体为例::
+
+	struct foo {
+		u16 field1;
+		u32 field2;
+		u8 field3;
+	};
+
+让我们假设上述结构体的一个实例驻留在从地址0x10000开始的内存中。根据基本的理解，访问
+field2会导致非对齐访问，这并不是不合理的。你会期望field2位于该结构体的2个字节的偏移
+量，即地址0x10002，但该地址不能被4平均整除（注意，我们在这里读一个4字节的值）。
+
+幸运的是，编译器理解对齐约束，所以在上述情况下，它会在field1和field2之间插入2个字节
+的填充。因此，对于标准的结构体类型，你总是可以依靠编译器来填充结构体，以便对字段的访
+问可以适当地对齐（假设你没有将字段定义不同长度的类型）。
+
+同样，你也可以依靠编译器根据变量类型的大小，将变量和函数参数对齐到一个自然对齐的方案。
+
+在这一点上，应该很清楚，访问单个字节（u8或char）永远不会导致无对齐访问，因为所有的内
+存地址都可以被1均匀地整除。
+
+在一个相关的话题上，考虑到上述因素，你可以观察到，你可以对结构体中的字段进行重新排序，
+以便将字段放在不重排就会插入填充物的地方，从而减少结构体实例的整体常驻内存大小。上述
+例子的最佳布局是::
+
+	struct foo {
+		u32 field2;
+		u16 field1;
+		u8 field3;
+	};
+
+对于一个自然对齐方案，编译器只需要在结构的末尾添加一个字节的填充。添加这种填充是为了满
+足这些结构的数组的对齐约束。
+
+另一点值得一提的是在结构体类型上使用__attribute__((packed))。这个GCC特有的属性告诉编
+译器永远不要在结构体中插入任何填充，当你想用C结构体来表示一些“off the wire”的固定排列
+的数据时，这个属性很有用。
+
+你可能会倾向于认为，在访问不满足架构对齐要求的字段时，使用这个属性很容易导致不对齐的访
+问。然而，编译器也意识到了对齐的限制，并且会产生额外的指令来执行内存访问，以避免造成不
+对齐的访问。当然，与non-packed的情况相比，额外的指令显然会造成性能上的损失，所以packed
+属性应该只在避免结构填充很重要的时候使用。
+
+
+导致非对齐访问的代码
+====================
+
+考虑到上述情况，让我们来看看一个现实生活中可能导致非对齐内存访问的函数的例子。下面这个
+函数取自include/linux/etherdevice.h，是一个优化的例程，用于比较两个以太网MAC地址是否
+相等::
+
+  bool ether_addr_equal(const u8 *addr1, const u8 *addr2)
+  {
+  #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+	u32 fold = ((*(const u32 *)addr1) ^ (*(const u32 *)addr2)) |
+		   ((*(const u16 *)(addr1 + 4)) ^ (*(const u16 *)(addr2 + 4)));
+
+	return fold == 0;
+  #else
+	const u16 *a = (const u16 *)addr1;
+	const u16 *b = (const u16 *)addr2;
+	return ((a[0] ^ b[0]) | (a[1] ^ b[1]) | (a[2] ^ b[2])) == 0;
+  #endif
+  }
+
+在上述函数中，当硬件具有高效的非对齐访问能力时，这段代码没有问题。但是当硬件不能在任意
+边界上访问内存时，对a[0]的引用导致从地址addr1开始的2个字节（16位）被读取。
+
+想一想，如果addr1是一个奇怪的地址，如0x10003，会发生什么？(提示：这将是一个非对齐访
+问。)
+
+尽管上述函数存在潜在的非对齐访问问题，但它还是被包含在内核中，但被理解为只在16位对齐
+的地址上正常工作。调用者应该确保这种对齐方式或者根本不使用这个函数。这个不对齐的函数
+仍然是有用的，因为它是在你能确保对齐的情况下的一个很好的优化，这在以太网网络环境中几
+乎是一直如此。
+
+
+下面是另一个可能导致非对齐访问的代码的例子::
+
+	void myfunc(u8 *data, u32 value)
+	{
+		[...]
+		*((u32 *) data) = cpu_to_le32(value);
+		[...]
+	}
+
+每当数据参数指向的地址不被4均匀整除时，这段代码就会导致非对齐访问。
+
+综上所述，你可能遇到非对齐访问问题的两种主要情况包括:
+
+ 1. 将变量定义不同长度的类型
+ 2. 指针运算后访问至少2个字节的数据
+
+
+避免非对齐访问
+==============
+
+避免非对齐访问的最简单方法是使用<asm/unaligned.h>头文件提供的get_unaligned()和
+put_unaligned()宏。
+
+回到前面的一个可能导致非对齐访问的代码例子::
+
+	void myfunc(u8 *data, u32 value)
+	{
+		[...]
+		*((u32 *) data) = cpu_to_le32(value);
+		[...]
+	}
+
+为了避免非对齐的内存访问，你可以将其改写如下::
+
+	void myfunc(u8 *data, u32 value)
+	{
+		[...]
+		value = cpu_to_le32(value);
+		put_unaligned(value, (u32 *) data);
+		[...]
+	}
+
+get_unaligned()宏的工作原理与此类似。假设'data'是一个指向内存的指针，并且你希望避免
+非对齐访问，其用法如下::
+
+	u32 value = get_unaligned((u32 *) data);
+
+这些宏适用于任何长度的内存访问（不仅仅是上面例子中的32位）。请注意，与标准的对齐内存
+访问相比，使用这些宏来访问非对齐内存可能会在性能上付出代价。
+
+如果使用这些宏不方便，另一个选择是使用memcpy()，其中源或目标（或两者）的类型为u8*或
+非对齐char*。由于这种操作的字节性质，避免了非对齐访问。
+
+
+对齐 vs. 网络
+=============
+
+在需要对齐负载的架构上，网络要求IP头在四字节边界上对齐，以优化IP栈。对于普通的以太网
+硬件，常数NET_IP_ALIGN被使用。在大多数架构上，这个常数的值是2，因为正常的以太网头是
+14个字节，所以为了获得适当的对齐，需要DMA到一个可以表示为4*n+2的地址。一个值得注意的
+例外是powerpc，它将NET_IP_ALIGN定义为0，因为DMA到未对齐的地址可能非常昂贵，与未对齐
+的负载的成本相比相形见绌。
+
+对于一些不能DMA到未对齐地址的以太网硬件，如4*n+2或非以太网硬件，这可能是一个问题，这
+时需要将传入的帧复制到一个对齐的缓冲区。因为这在可以进行非对齐访问的架构上是不必要的，
+所以可以使代码依赖于CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS，像这样::
+
+	#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+		skb = original skb
+	#else
+		skb = copy skb
+	#endif
-- 
2.27.0

