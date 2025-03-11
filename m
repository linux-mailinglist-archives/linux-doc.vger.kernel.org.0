Return-Path: <linux-doc+bounces-40459-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB69A5B5EE
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 02:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99AB73AA817
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 01:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDED8F77;
	Tue, 11 Mar 2025 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z7AYUFFZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D485258
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741657170; cv=none; b=QwjsjAuQuJTfMW61NKpyAzKBlBcW5HH8//0xUmHQw8laffP+QWAUalAK/EJBX88TgOMpSdCXeqkFgCom+gJvC/i9T7rRlaSmoNyM8l8w0dAmLpAgfvNUX8Aa7oAGCAi2iIRwO62Sret9fvHmeWj+6VzB8u0lWgXLnCMfk0iFHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741657170; c=relaxed/simple;
	bh=h0aWxa3xQqvM+icZOXH9l5WkIiJrKU+CI/J7r1o0lyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Myrsvxz/rfwpVetwJHtT8/Sd+9qrekGrJfJNczLz9FP6+sMgQSFo7kZwkUwfPTi/NFYiaPIZe3ovdEtJKacmrAnFQ0d6v+fETHivYLy8vEnD6+o6zNfsW13JtBl3C4PrfcNZG1336xZFVh9BFLegnm39v3hWaAccEp8bZRjR+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z7AYUFFZ; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <8945250c-3f6e-43eb-bac8-03ca044fcbae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741657156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5oMWLmKGgh488fxEuPizg4zPbzvT4YJceGHkM0I1RVw=;
	b=Z7AYUFFZqz7tCGF0zLvGvm+xeNAwW4ROvKol9hcsbONT9+7Ky6jtxpMTiXOiFWz9ejLqvL
	ANs/wX0DpRKqUUeKodKW1+0j2TB/AQ1qPrrw3NP8rJVWAud5TRVul7KVZdxbBglFAPLarG
	OwIUTotldU3JzidLmfiXeiNC6CA0cmI=
Date: Tue, 11 Mar 2025 09:39:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH linux next v3] Docs/zh_CN: Translate msg_zerocopy.rst to
 Simplified Chinese
To: jiang.kun2@zte.com.cn, alexs@kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, wang.yaxin@zte.com.cn,
 fan.yu9@zte.com.cn, he.peilin@zte.com.cn, tu.qiang35@zte.com.cn,
 qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn, ye.xingchen@zte.com.cn
References: <20250307145215126GSrPAWuFO9YCy9V3ZZYH5@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250307145215126GSrPAWuFO9YCy9V3ZZYH5@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/7/25 2:52 PM, jiang.kun2@zte.com.cn 写道:
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> translate the "msg_zerocopy.rst" into Simplified Chinese.
>
> Update to commit bac2cac12c26("docs: net: description of
> MSG_ZEROCOPY for AF_VSOCK")
>
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---
> v2->v3:
> https://lore.kernel.org/all/0e66b23c-7238-474a-96d8-b069406185e2@linux.dev/
> 1. add punctuation at the end of commit messages.
> 2. delete the redundant blank lines.
> 3. add a symbol '-' at the front of the signature section.
>
>   .../zh_CN/networking/msg_zerocopy.rst         | 223 ++++++++++++++++++
>   1 file changed, 223 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/networking/msg_zerocopy.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/msg_zerocopy.rst b/Documentation/translations/zh_CN/networking/msg_zerocopy.rst
> new file mode 100644
> index 000000000000..7362b8514e70
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/msg_zerocopy.rst
> @@ -0,0 +1,223 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/msg_zerocopy.rst
> +
> +:翻译:
> +
> +   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> +
> +:校译:
> +
> +   - 徐鑫 xu xin <xu.xin16@zte.com.cn>
> +   - 何配林 He Peilin <he.peilin@zte.com.cn>
> +
> +============
> +MSG_ZEROCOPY
> +============
> +
> +简介
> +====
> +
> +MSG_ZEROCOPY 标志用于启用套接字发送调用的免拷贝功能。该功能目前适用于 TCP、UDP 和 VSOCK
> +（使用 virtio 传输）套接字。
> +
> +机遇与注意事项
> +--------------
> +
> +在用户进程与内核之间拷贝大型缓冲区可能会消耗大量资源。Linux 支持多种免拷贝的接口，如sendfile
> +和 splice。MSG_ZEROCOPY 标志将底层的拷贝避免机制扩展到了常见的套接字发送调用中。
你在下文使用了"免拷贝“，这了又翻译为”拷贝避免“，能否统一下？
> +
> +免拷贝并非毫无代价。在实现上，它通过页面固定（page pinning）将按字节拷贝的成本替换为页面统计
> +（page accounting）和完成通知的开销。因此，MSG_ZEROCOPY 通常仅在写入量超过大约 10 KB 时
> +才有效。
> +
> +页面固定还会改变系统调用的语义。它会暂时在进程和网络堆栈之间共享缓冲区。与拷贝不同，进程在系统
> +调用返回后不能立即覆盖缓冲区，否则可能会修改正在传输中的数据。内核的完整性不会受到影响，但有缺
> +陷的程序可能会破坏自己的数据流。
> +
> +当内核返回数据可以安全修改的通知时，进程才可以修改数据。因此，将现有应用程序转换为使用
object 接收到 通知？
> +MSG_ZEROCOPY 并非总是像简单地传递该标志那样容易。
> +
> +更多信息
> +--------
> +
> +本文档的大部分内容是来自于 netdev 2.1 上发表的一篇长篇论文。如需更深入的信息，请参阅该论文和
> +演讲，或者浏览 LWN.net 上的精彩报道，也可以直接阅读源码。
> +
> +  论文、幻灯片、视频：
> +    https://netdevconf.org/2.1/session.html?debruijn
> +
> +  LWN 文章：
> +    https://lwn.net/Articles/726917/
> +
> +  补丁集：
> +    [PATCH net-next v4 0/9] socket sendmsg MSG_ZEROCOPY
> +    https://lore.kernel.org/netdev/20170803202945.70750-1-willemdebruijn.kernel@gmail.com
> +
> +接口
> +====
> +
> +传递 MSG_ZEROCOPY 标志是启用免拷贝功能的最明显步骤，但并非唯一的步骤。
> +
> +套接字设置
> +----------
> +
> +当应用程序向 send 系统调用传递未定义的标志时，内核通常会宽容对待。默认情况下，它会简单地忽略
> +这些标志。为了避免为那些偶然传递此标志的遗留进程启用免拷贝模式，进程必须首先通过设置套接字选项
> +来表明意图：
> +
> +::
> +
> +    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &one, sizeof(one)))
> +        error(1, errno, "setsockopt zerocopy");
> +
> +传输
> +----
> +
> +对 send（或 sendto、sendmsg、sendmmsg）本身的改动非常简单。只需传递新的标志即可。
> +
> +::
> +
> +    ret = send(fd, buf, sizeof(buf), MSG_ZEROCOPY);
> +
> +如果零拷贝操作失败，将返回 -1，并设置 errno 为 ENOBUFS。这种情况可能发生在套接字超出其
> +optmem 限制，或者用户超出其锁定页面的 ulimit 时。
> +
> +混合使用免拷贝和拷贝
> +~~~~~~~~~~~~~~~~~~~~
> +
> +许多工作负载同时包含大型和小型缓冲区。由于对于小数据包来说，免拷贝的成本高于拷贝，因此该
> +功能是通过标志实现的。带有标志的调用和没有标志的调用可以安全地混合使用。
> +
> +通知
> +----
> +
> +当内核认为可以安全地重用之前传递的缓冲区时，它必须通知进程。完成通知在套接字的错误队列上
> +排队，类似于传输时间戳接口。
> +
> +通知本身是一个简单的标量值。每个套接字都维护一个内部的无符号 32 位计数器。每次带有
> +MSG_ZEROCOPY 标志的 send 调用成功发送数据时，计数器都会增加。如果调用失败或长度为零，
> +则计数器不会增加。该计数器统计系统调用的调用次数，而不是字节数。在 UINT_MAX 次调用后，
> +计数器会循环。
> +
> +通知接收
> +~~~~~~~~
> +
> +下面的代码片段展示了 API 的使用。在最简单的情况下，每次 send 系统调用后，都会对错误队列
> +进行轮询和 recvmsg 调用。
> +
> +从错误队列读取始终是一个非阻塞操作。poll 调用用于阻塞，直到出现错误。它会在其输出标志中
> +设置 POLLERR。该标志不需要在 events 字段中设置。错误会无条件地发出信号。
> +
> +::
> +
> +    pfd.fd = fd;
> +    pfd.events = 0;
> +    if (poll(&pfd, 1, -1) != 1 || pfd.revents & POLLERR == 0)
> +        error(1, errno, "poll");
> +
> +    ret = recvmsg(fd, &msg, MSG_ERRQUEUE);
> +    if (ret == -1)
> +        error(1, errno, "recvmsg");
> +
> +    read_notification(msg);
> +
> +
> +这个示例仅用于演示目的。在实际应用中，不等待通知，而是每隔几次 send 调用就进行一次非阻塞
> +读取会更高效。
> +
> +零拷贝通知可以与其他套接字操作乱序处理。通常，拥有错误队列套接字会阻塞其他操作，直到错误
> +被读取。然而，零拷贝通知具有零错误代码，因此不会阻塞 send 和 recv 调用。
> +
> +通知批处理
> +~~~~~~~~~~~~
> +
> +可以使用 recvmmsg 调用来一次性读取多个未决的数据包。这通常不是必需的。在每条消息中，内核
> +返回的不是一个单一的值，而是一个范围。当错误队列上有一个通知正在等待接收时，它会将连续的通
> +知合并起来。
> +
> +当一个新的通知即将被排队时，它会检查队列尾部的通知的范围是否可以扩展以包含新的值。如果是这
> +样，它会丢弃新的通知数据包，并增大未处理通知的范围上限值。
> +
> +对于按顺序确认数据的协议（如 TCP），每个通知都可以合并到前一个通知中，因此在任何时候在等待
> +的通知都不会超过一个。
> +
> +有序交付是常见的情况，但不能保证。在重传和套接字拆除时，通知可能会乱序到达。
> +
> +通知解析
> +~~~~~~~~
> +
> +下面的代码片段演示了如何解析控制消息：前面代码片段中的 read_notification() 调用。通知
> +以标准错误格式 sock_extended_err 编码。
> +
> +控制数据中的级别和类型字段是协议族特定的，对于 TCP 或 UDP 套接字，分别为 IP_RECVERR 或
> +IPV6_RECVERR。对于 VSOCK 套接字，cmsg_level 为 SOL_VSOCK，cmsg_type 为 VSOCK_RECVERR。
> +
> +错误来源是新的类型 SO_EE_ORIGIN_ZEROCOPY。如前所述，ee_errno 为零，以避免在套接字上
> +阻塞地读取和写入系统调用。
> +
> +32 位通知范围编码为 [ee_info, ee_data]。这个范围是包含边界值的。除了下面讨论的 ee_code
> +字段外，结构中的其他字段应被视为未定义的。
> +
> +::
> +
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +
> +    cm = CMSG_FIRSTHDR(msg);
> +    if (cm->cmsg_level != SOL_IP &&
> +        cm->cmsg_type != IP_RECVERR)
> +        error(1, 0, "cmsg");
> +
> +    serr = (void *) CMSG_DATA(cm);
> +    if (serr->ee_errno != 0 ||
> +        serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY)
> +        error(1, 0, "serr");
> +
> +    printf("completed: %u..%u\n", serr->ee_info, serr->ee_data);
> +
> +
> +延迟拷贝
> +~~~~~~~~
> +
> +传递标志 MSG_ZEROCOPY 是向内核发出的一个提示，让内核采用免拷贝的策略，同时也是一种约
> +定，即内核会对完成通知进行排队处理。但这并不保证拷贝操作一定会被省略。
> +
> +拷贝避免不总是适用的。不支持分散/聚集 I/O 的设备无法发送由内核生成的协议头加上零拷贝用户
> +数据组成的数据包。数据包可能需要在协议栈底层转换为一份私有数据副本，例如用于计算校验和。
> +
> +在所有这些情况下，当内核释放对共享页面的持有权时，它会返回一个完成通知。该通知可能在（已
> +拷贝）数据完全传输之前到达。因此。零拷贝完成通知并不是传输完成通知。
> +
> +如果数据不在缓存中，延迟拷贝可能会比立即在系统调用中拷贝开销更大。进程还会因通知处理而产
> +生成本，但却没有带来任何好处。因此，内核会在返回时通过在 ee_code 字段中设置标志
> +SO_EE_CODE_ZEROCOPY_COPIED 来指示数据是否以拷贝的方式完成。进程可以利用这个信号，在
> +同一套接字上后续的请求中停止传递 MSG_ZEROCOPY 标志。
> +
> +实现
> +====
> +
> +环回
> +----
> +
> +对于 TCP 和 UDP：
> +如果接收进程不读取其套接字，发送到本地套接字的数据可能会无限期排队。无限期的通知延迟是不
> +可接受的。因此，所有使用 MSG_ZEROCOPY 生成并环回到本地套接字的数据包都将产生延迟拷贝。
> +这包括环回到数据包套接字（例如，tcpdump）和 tun 设备。
> +
> +对于 VSOCK：
> +发送到本地套接字的数据路径与非本地套接字相同。
> +
> +测试
> +====
> +
> +更具体的示例代码可以在内核源码的 tools/testing/selftests/net/msg_zerocopy.c 中找到。
> +
> +要留意环回约束问题。该测试可以在一对主机之间进行。但如果是在本地的一对进程之间运行，例如当使用
> +msg_zerocopy.sh 脚本在跨命名空间的虚拟以太网（veth）对之间运行时，测试将不会显示出任何性能
> +提升。为了便于测试，可以通过让 skb_orphan_frags_rx 与 skb_orphan_frags 相同，来暂时放宽
> +环回限制。
> +
> +对于 VSOCK 类型套接字的示例可以在 tools/testing/vsock/vsock_test_zerocopy.c 中找到。

I'm sorry. I've been quite busy in the past two weeks

and haven't been able to reply to your email in a timely

manner. If you have dealt with the above two comments,

please kindly pick up my Reviewed-by tag in v4.


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng


