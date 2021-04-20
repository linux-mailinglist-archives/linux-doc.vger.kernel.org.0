Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2543651D2
	for <lists+linux-doc@lfdr.de>; Tue, 20 Apr 2021 07:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhDTF3S (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Apr 2021 01:29:18 -0400
Received: from [43.250.32.171] ([43.250.32.171]:33838 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229504AbhDTF3R (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Apr 2021 01:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=kqsTQXgzA5HIxn32Mv67iLrmrqrF+HD0w9mgc
        bA91dU=; b=RYeRrQ8v2Yu+QF4wvNsIgDObd4PF3e5+APo8kg9VoLQAPkgGu9ZjG
        xYnfgRoPt1bSwwa+5/vmRnfcBb0qZiLviNb2g67BUBhEcUz1fAwC34yukMX9dv3o
        gBHpR7Q/9AO3clvU+LovB+TkW9dD+RqFNPcpKi+lfnvjnswrh1Gh0I=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnWdB3Zn5gL2NmAA--.37094S2;
        Tue, 20 Apr 2021 13:28:25 +0800 (CST)
Date:   Tue, 20 Apr 2021 13:28:23 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 3/3] docs/zh_CN: add core-api printk-formats.rst
 translation
Message-ID: <20210420052823.GA14788@bobwxc.top>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <c79b09e5d9ea442bd301894a7bc512eebfddcedc.1618836460.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c79b09e5d9ea442bd301894a7bc512eebfddcedc.1618836460.git.siyanteng@loongson.cn>
X-today: sleepy
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnWdB3Zn5gL2NmAA--.37094S2
X-Coremail-Antispam: 1UD129KBjvAXoWfJw4fZrWUZw4rKFyrKrykZrb_yoW8CFWDJo
        W29w45Zws7Kwn8t342y3W5Jw4jvF15GF17CrnxWrW5Gry7G3WSyr1DA343GF4rArW5Gr15
        t3W3Cr15A3W7Can3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5B7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vE
        x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262
        IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx2
        6F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GrWl42
        xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x07jltCcUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 09:10:57PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/printk-formats.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/printk-formats.rst         | 577 ++++++++++++++++++
>  1 file changed, 577 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/printk-formats.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> new file mode 100644
> index 000000000000..8552bbb3c797
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> @@ -0,0 +1,577 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../core-api/printk-formats`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_printk-formats.rst:
> +
> +
> +==============================
> +如何获得正确的printk格式说明符
> +==============================
> +
> +.. _printk-specifiers:

重复标签

> +
> +:作者: Randy Dunlap <rdunlap@infradead.org>
> +:作者: Andrew Murray <amurray@mpc-data.co.uk>
> +
> +
> +整数类型
> +========
> +
> +::
> +
> +	        如果变量是Type，则使用printk格式说明符器。

		若变量类型为		则使用printk格式说明符

> +	        -----------------------------------------
> +		char			%d or %x
> +		unsigned char		%u or %x
> +		short int		%d or %x
> +		unsigned short int	%u or %x
> +		int			%d or %x
> +		unsigned int		%u or %x
> +		long			%ld or %lx
> +		unsigned long		%lu or %lx
> +		long long		%lld or %llx
> +		unsigned long long	%llu or %llx
> +		size_t			%zu or %zx
> +		ssize_t			%zd or %zx
> +		s8			%d or %x
> +		u8			%u or %x
> +		s16			%d or %x
> +		u16			%u or %x
> +		s32			%d or %x
> +		u32			%u or %x
> +		s64			%lld or %llx
> +		u64			%llu or %llx
> +

s/or/或/

Emmm, let convert this to a table?
It looks not clear... Seems also need to fix origin file.

> +
> +如果 <type> 的大小依赖于配置选项 (例如 sector_t, blkcnt_t) 或其大小依赖于架构
> +(例如 tcflag_t)，则使用其可能的最大类型的格式说明符并显式强制转换为它。
> +
> +例如
> +
> +::
> +
> +	printk("test: sector number/total blocks: %llu/%llu\n",
> +		(unsigned long long)sector, (unsigned long long)blockcount);
> +
> +提醒：sizeof()返回类型size_t。
> +
> +内核的printf不支持%n。浮点格式(%e, %f, %g, %a)也不被识别，原因很明显。使用任何不
> +支持的说明符或长度限定符都会导致一个WARN和vsnprintf()的提前返回。
> +
> +指针类型
> +========
> +
> +一个原始指针值可以用%p打印，它将在打印前对地址进行哈希处理。内核也支持扩展说明符来打印
> +不同类型的指针。
> +
> +一些扩展说明符会打印给定地址上的数据，而不是打印地址本身。在这种情况下，以下错误信息可能
> +会被打印出来，而不是无法访问的信息。::

remove 。

> +
> +	(null)	 data on plain NULL address
> +	(efault) data on invalid address
> +	(einval) invalid data on a valid address
> +
> +简单的指针

普通指针？

> +----------
> +
> +::
> +
> +	%p	abcdef12 or 00000000abcdef12
> +
> +没有指定扩展名的指针(即未加修饰的%p)会被哈希以防止泄露内核内存布局的信息。这样做的另一个
> +好处是提供一个唯一的标识符。在64位机器上，前32位被清零。内核将打印 ``(ptrval)`` 直到它
> +收集到足够的熵。如果你 *真* 想知道地址请看下面的%px。
> +

Missed two paragraph in linux-next

> +错误指针
> +--------
> +
> +::
> +
> +	%pe	-ENOSPC
> +
> +用于打印错误指针(即IS_ERR()为真的指针)的符号错误名。不知道符号名的错误值会以十进制打印，
> +而作为%pe参数传递的非ERR_PTR会被视为普通的%p。
> +
> +符号/函数指针
> +-------------
> +
> +::
> +
> +	%pS	versatile_init+0x0/0x110
> +	%ps	versatile_init
> +	%pSR	versatile_init+0x9/0x110
> +		(with __builtin_extract_return_addr() translation)
> +	%pB	prev_fn_of_versatile_init+0x88/0x88
> +
> +
> +``S`` 和 ``s`` 说明符用于打印符号格式的指针。它们的结果是符号名称带有(S)或不带有(s)偏移
> +量。如果禁用KALLSYMS，则打印符号地址。
> +
> +``B`` 指定符的结果是带有偏移量的符号名，在打印堆栈回溯时应该使用。说明符将考虑编译器优化
         ^^^^^^

> +的影响，当使用尾部调用并使用noreturn GCC属性标记时，可能会发生这种优化。
> +
> +Probed Pointers from BPF / tracing

need translate

> +----------------------------------
> +
> +::
> +
> +	%pks	kernel string
> +	%pus	user string
> +
> +``k`` 和 ``u`` 指定符用于打印来自内核内存(k)或用户内存(u)的先前探测的内存。后面的 ``s`` 指
> +定符的结果是打印一个字符串。对于直接在常规的vsnprintf()中使用时，(k)和(u)注释被忽略，但是，当
> +在BPF的bpf_trace_printk()之外使用时，它会读取它所指向的内存，不会出现错误。
> +
> +内核指针
> +--------
> +
> +::
> +
> +	%pK	01234567 or 0123456789abcdef
> +
> +用于打印应该对非特权用户隐藏的内核指针。%pK的行为取决于kptr_restrict sysctl--详见

——

> +文档/admin-guide/sysctl/kernel.rst。

Documentation/admin-guide/sysctl/kernel.rst

> +
> +未经修改的地址
> +--------------
> +
> +::
> +
> +	%px	01234567 or 0123456789abcdef
> +
> +对于打印指针，当你 *真的* 想打印地址时。在用%px打印指针之前，请考虑你是否泄露了内核内
> +存布局的敏感信息。%px在功能上等同于%lx（或%lu）。%px是首选，因为它更具有唯一的grep能

在grep查找时更唯一？

> +力。如果将来我们需要修改内核处理打印指针的方式，我们将能更好地找到调用点。

Missed a paragraph in linux-next

> +
> +指针差异
> +--------
> +
> +::
> +
> +	%td	2560
> +	%tx	a00
> +
> +为了打印指针的差异，使用ptrdiff_t的%t修饰符。
> +
> +例如::
> +
> +	printk("test: difference between pointers: %td\n", ptr2 - ptr1);
> +
> +资源（Resources）结构体
> +-----------------------
> +
> +::
> +
> +	%pr	[mem 0x60000000-0x6fffffff flags 0x2200] or
> +		[mem 0x0000000060000000-0x000000006fffffff flags 0x2200]
> +	%pR	[mem 0x60000000-0x6fffffff pref] or
> +		[mem 0x0000000060000000-0x000000006fffffff pref]
> +
> +用于打印结构资源。 ``R`` 和 ``r`` 说明符的结果是打印出的资源带有(R)或不带有(r)解码标志
           ^^^^^^^^

> +成员。
> +
> +通过引用传递。
> +
> +物理地址类型 phys_addr_t
> +------------------------
> +
> +::
> +
> +	%pa[p]	0x01234567 or 0x0123456789abcdef
> +
> +用于打印phys_addr_t类型(以及它的衍生物，如resource_size_t)，该类型可以根据构建选项而
（）                      ^                                 ^
> +变化，无论CPU数据路径的宽度如何。
> +
> +通过引用传递。
> +
> +DMA地址类型dma_addr_t
> +---------------------
> +
> +::
> +
> +	%pad	0x01234567 or 0x0123456789abcdef
> +
> +用于打印dma_addr_t类型，该类型可以根据构建选项而变化，而不考虑CPU数据路径的宽度。
> +
> +通过引用传递。
> +
> +原始缓冲区为转义字符串
> +----------------------
> +
> +::
> +
> +	%*pE[achnops]
> +
> +用于将原始缓冲区打印成转义字符串。对于以下缓冲区
> +
> +::
> +
> +		1b 62 20 5c 43 07 22 90 0d 5d
> +
> +几个例子显示了如何进行转换（不包括周围的引号）。

以下几个例子展示了如何进行转换（不包括两端引号）。

> +
> +::
   ^^
> +
> +		%*pE		"\eb \C\a"\220\r]"
> +		%*pEhp		"\x1bb \C\x07"\x90\x0d]"
> +		%*pEa		"\e\142\040\\\103\a\042\220\r\135"
> +
> +转换规则是根据可选的标志组合来应用的(详见:c:func: `string_escape_mem` 内核文档):
                                                    ^
                                                    remove a space
> +
> +	- a - ESCAPE_ANY
> +	- c - ESCAPE_SPECIAL
> +	- h - ESCAPE_HEX
> +	- n - ESCAPE_NULL
> +	- o - ESCAPE_OCTAL
> +	- p - ESCAPE_NP
> +	- s - ESCAPE_SPACE
> +
> +默认情况下，使用 ESCAPE_ANY_NP。
> +
> +ESCAPE_ANY_NP是许多情况下的明智选择，特别是对于打印SSID。
> +	
   ^^^^
there is a tab

> +如果字段宽度被省略，那么将只转义1个字节。
> +
> +原始缓冲区为十六进制字符串
> +--------------------------
> +
> +::
> +
> +	%*ph	00 01 02  ...  3f
> +	%*phC	00:01:02: ... :3f
> +	%*phD	00-01-02- ... -3f
> +	%*phN	000102 ... 3f
> +
> +对于打印小的缓冲区（最长64个字节），可以用一定的分隔符作为一个
> +十六进制字符串。对于较大的缓冲区，可以考虑使用
> +:c:func: `print_hex_dump` 。
           ^

> +
> +MAC/FDDI地址
> +------------
> +
> +::
> +
> +	%pM	00:01:02:03:04:05
> +	%pMR	05:04:03:02:01:00
> +	%pMF	00-01-02-03-04-05
> +	%pm	000102030405
> +	%pmR	050403020100
> +
> +用于打印以十六进制表示的6字节MAC/FDDI地址。 ``M`` 和 ``m`` 说明符导致打印的
> +地址有(M)或没有(m)字节分隔符。默认的字节分隔符是冒号（：）。
> +
> +对于FDDI地址，可以在 ``M`` 说明符之后使用 ``F`` 说明，以使用破折号(-)分隔符

连字符，这不是破折号
https://sspai.com/post/45516

> +代替默认的分隔符。
> +	
   ^^^
   remove tab
> +对于蓝牙地址， ``R`` 说明符应使用在 ``M`` 说明符之后，以使用反转的字节顺序，适
> +合于以小尾端顺序的蓝牙地址的肉眼可见的解析。
> +	
   ^^^^
   remove tab
> +通过引用传递。
> +
> +IPv4地址
> +--------
> +
> +::
> +
> +	%pI4	1.2.3.4
> +	%pi4	001.002.003.004
> +	%p[Ii]4[hnbl]
> +
> +用于打印IPv4点分隔的十进制地址。 ``I4`` 和 ``i4`` 说明符的结果是打印的地址
> +有(i4)或没有(I4)前导零。
> +
> +附加的 ``h`` 、 ``n`` 、 ``b`` 和 ``l`` 说明符分别用于指定主机、网络、大
> +尾端或小尾端地址。如果没有提供说明符，则使用默认的网络/大尾端顺序。
> +	
   ^^^
   remove tab
> +通过引用传递。
> +
> +IPv6 地址
> +---------
> +
> +::
> +
> +	%pI6	0001:0002:0003:0004:0005:0006:0007:0008
> +	%pi6	00010002000300040005000600070008
> +	%pI6c	1:2:3:4:5:6:7:8
> +
> +用于打印IPv6网络顺序的16位十六进制地址。 ``I6`` 和 ``i6`` 说明符的结果是
> +打印的地址有(I6)或没有(i6)分号。始终使用前导零。
> +
> +额外的 ``c`` 说明符可与 ``I`` 说明符一起使用，以打印压缩的IPv6地址，如下
> +所述
> +https://tools.ietf.org/html/rfc5952 
> +	

如https://sspai.com/post/45516所述

> +通过引用传递。
> +
> +IPv4/IPv6地址(generic, with port, flowinfo, scope)
> +--------------------------------------------------
> +
> +::
> +
> +	%pIS	1.2.3.4		or 0001:0002:0003:0004:0005:0006:0007:0008
> +	%piS	001.002.003.004	or 00010002000300040005000600070008
> +	%pISc	1.2.3.4		or 1:2:3:4:5:6:7:8
> +	%pISpc	1.2.3.4:12345	or [1:2:3:4:5:6:7:8]:12345
> +	%p[Ii]S[pfschnbl]
> +
> +用于打印一个IP地址，不需要区分它的类型是AF_INET还是AF_INET6。一个指向有效结构
> +体sockaddr的指针，通过 ``IS`` 或 ``IS`` 指定，可以传递给这个格式说明符。
> +
> +附加的 ``p`` 、  ``f`` 和 ``s`` 说明符用于指定port(IPv4, IPv6)、
> +flowinfo (IPv6)和sope(IPv6)。port有一个 ``:`` 前缀，flowinfo是 ``/`` 和
> +范围是 ``%`` ，每个后面都跟着实际的值。
> +	
   ^^^
> +对于IPv6地址，如果指定了额外的指定符 ``c`` ，则使用
> +https://tools.ietf.org/html/rfc5952描述的压缩IPv6地址。
> +如https://tools.ietf.org/html/draft-ietf-6man-text-addr-representation-07
> +所建议的，IPv6地址由'['，']'包围，以防止出现额外的说明符 ``p`` ， ``f`` 或 ``s`` 。
> +	
   ^^^
> +对于IPv4地址，也可以使用额外的 ``h`` ， ``n`` ， ``b`` 和 ``l`` 说
> +明符，但对于IPv6地址则忽略。
> +	
   ^^^
> +通过引用传递。
> +
> +更多例子
> +
> +::
> +
> +	%pISfc		1.2.3.4		or [1:2:3:4:5:6:7:8]/123456789
> +	%pISsc		1.2.3.4		or [1:2:3:4:5:6:7:8]%1234567890
> +	%pISpfc		1.2.3.4:12345	or [1:2:3:4:5:6:7:8]:12345/123456789
> +
> +UUID/GUID地址
> +-------------
> +
> +::
> +
> +	%pUb	00010203-0405-0607-0809-0a0b0c0d0e0f
> +	%pUB	00010203-0405-0607-0809-0A0B0C0D0E0F
> +	%pUl	03020100-0504-0706-0809-0a0b0c0e0e0f
> +	%pUL	03020100-0504-0706-0809-0A0B0C0E0E0F
> +
> +用于打印16字节的UUID/GUIDs地址。附加的 ``l`` , ``L`` , ``b`` 和 ``B`` 说明符用
> +于指定小写(l)或大写(L)十六进制表示法中的小尾端顺序，以及小写(b)或大写(B)十六进制表
> +示法中的大尾端顺序。
> +
> +如果没有使用额外的说明符，则将打印带有小写十六进制表示法的默认大端顺序。
> +	
   ^^^
> +通过引用传递。
> +
> +目录项（dentry）的名称
> +----------------------
> +
> +::
> +
> +	%pd{,2,3,4}
> +	%pD{,2,3,4}
> +
> +用于打印dentry名称；如果我们用 :c:func:`d_move` 和它比较，名称可能是新旧混合的，但
> +不会oops。 %pd dentry比较安全，其相当于我们以前用的%s dentry->d_name.name，%pd<n>打
> +印 ``n`` 最后的组件。 %pD对结构文件做同样的事情。
> +
> +
> +通过引用传递。
> +
> +块设备（block_device）名称
> +--------------------------
> +
> +::
> +
> +	%pg	sda, sda1 or loop0p1
> +
> +用于打印block_device指针的名称。
> +
> +va_format结构体
> +---------------
> +
> +::
> +
> +	%pV
> +
> +用于打印结构体va_format。这些结构包含一个格式字符串
> +和va_list如下
> +
> +::
> +
> +	struct va_format {
> +		const char *fmt;
> +		va_list *va;
> +	};
> +
> +实现 "递归vsnprintf"。
> +
> +如果没有一些机制来验证格式字符串和va_list参数的正确性，请不要使用这个功能。
> +	
   ^^^
> +通过引用传递。
> +
> +设备树节点
> +----------
> +
> +::
> +
> +	%pOF[fnpPcCF]
> +
> +
> +用于打印设备树节点结构。默认行为相当于%pOFf。
> +
> +	- f - 设备节点全称
> +	- n - 设备节点名
> +	- p - 设备节点句柄
> +	- P - 设备节点路径规范(名称+@单位)
> +	- F - 设备节点标志
> +	- c - 主要兼容字符串
> +	- C - 全兼容字符串
> +
> +当使用多个参数时，分隔符是':'。
> +
> +例如
> +
> +::
> +
> +	%pOF	/foo/bar@0			- Node full name
> +	%pOFf	/foo/bar@0			- Same as above
> +	%pOFfp	/foo/bar@0:10			- Node full name + phandle
> +	%pOFfcF	/foo/bar@0:foo,device:--P-	- Node full name +
> +	                                          major compatible string +
> +						  node flags
> +							D - dynamic
> +							d - detached
> +							P - Populated
> +							B - Populated bus
> +
> +通过引用传递。
> +
> +Fwnode handles
> +--------------
> +
> +::
> +
> +	%pfw[fP]
> +
> +用于打印fwnode_handles的信息。默认情况下是打印完整的节点名称，包括路径。
> +这些修饰符在功能上等同于上面的%pOF。
> +
> +	- f - 节点的全名，包括路径。
> +	- P - 节点名称，包括地址（如果有的话）。
> +
> +例如 (ACPI)
> +
> +::
> +
> +	%pfwf	\_SB.PCI0.CIO2.port@1.endpoint@0	- Full node name
> +	%pfwP	endpoint@0				- Node name
> +
> +例如 (OF)
> +
> +::
> +
> +	%pfwf	/ocp@68000000/i2c@48072000/camera@10/port/endpoint - Full name
> +	%pfwP	endpoint				- Node name
> +
> +时间和日期
> +----------
> +
> +::
> +
> +	%pt[RT]			YYYY-mm-ddTHH:MM:SS
> +	%pt[RT]d		YYYY-mm-dd
> +	%pt[RT]t		HH:MM:SS
> +	%pt[RT][dt][r]
> +
> +用于打印日期和时间
> +
> +::
> +
> +	R  struct rtc_time structure
> +	T  time64_t type
> +
> +以我们（人类）可读的格式。
> +
> +默认情况下，年将以1900为单位递增，月将以1为单位递增。 使用%pt[RT]r (raw)
> +来抑制这种行为。
> +	
   ^^^
> +通过引用传递。
> +
> +clk结构体
> +---------
> +
> +::
> +
> +	%pC	pll1
> +	%pCn	pll1
> +
> +用于打印clk结构。%pC 和 %pCn 打印时钟的名称（通用时钟框架）或唯一的32位
> +ID（传统时钟框架）。
> +
> +通过引用传递。
> +
> +位图及其衍生物，如cpumask和nodemask
> +-----------------------------------
> +
> +::
> +
> +	%*pb	0779
> +	%*pbl	0,3-6,8-10
> +
> +对于打印位图及其派生的cpumask和nodemask，%*pb输出以字段宽度为位数的位图，
括注 bitmap ?
> +%*pbl输出以字段宽度为位数的范围列表。
> +
> +字段宽度用值传递，位图用引用传递。可以使用辅助宏cpumask_pr_args()和
> +nodemask_pr_args()来方便打印cpumask和nodemask。
> +
> +标志位字段，如页标志、gfp_flags
> +-------------------------------
> +
> +::
> +
> +	%pGp	referenced|uptodate|lru|active|private|node=0|zone=2|lastcpupid=0x1fffff
> +	%pGg	GFP_USER|GFP_DMA32|GFP_NOWARN
> +	%pGv	read|exec|mayread|maywrite|mayexec|denywrite
> +
> +将flags位字段打印为构造值的符号常量集合。标志的类型由第三个字符给出。目前支持的
> +是[p]age flags， [v]ma_flags(都期望 ``unsigned long *`` )和
> +[g]fp_flags(期望 ``gfp_t *`` )。标志名称和打印顺序取决于特定的类型。
> +
> +注意，这种格式不应该直接用于跟踪点的:c:func: `TP_printk()` 部分。相反，应使
                                               ^
> +用 <trace/events/mmflags.h>中的show_*_flags()函数。
> +	
   ^^^
> +通过引用传递。
> +
> +网络设备特性
> +------------
> +
> +::
> +
> +	%pNF	0x000000000000c000
> +
> +用于打印netdev_features_t。
> +
> +通过引用传递。
> +
> +V4L2和DRM FourCC代码(像素格式)
> +------------------------------
> +
> +::
> +
> +	%p4cc
> +
> +打印V4L2或DRM使用的FourCC代码，包括格式端序及其十六进制的数值。
> +
> +通过引用传递。
> +
> +例如
> +
> +::
> +
> +	%p4cc	BG12 little-endian (0x32314742)
> +	%p4cc	Y10  little-endian (0x20303159)
> +	%p4cc	NV12 big-endian (0xb231564e)
> +
> +谢谢
> +====
> +
> +如果您添加了其他%p扩展，请在可行的情况下，用一个或多个测试用例扩展<lib/test_printf.c>。
> +
> +谢谢你的合作和关注。
> -- 
> 2.27.0

Thanks,
Wu X.C.

