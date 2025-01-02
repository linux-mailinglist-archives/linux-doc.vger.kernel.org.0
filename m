Return-Path: <linux-doc+bounces-33819-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F609FF6BC
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jan 2025 09:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE57D1615BA
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jan 2025 08:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB56191F66;
	Thu,  2 Jan 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ugf+FGlm"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E6B188938
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735805493; cv=none; b=J1QbLnDVAEzox+gIpcf+GOsYigRRVwkMo30ObU3clz5dgxWFRybYPJhGL9+/Q4EJMdMqooPOsSOF1rawB1oSle3LNypafEz0oQEar8k02+sIRBY6SPtRlLI3tvPEF7tYO3KK6ZA0eLWv1lziHABx58Plcf5LuPJmexyApQrlhwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735805493; c=relaxed/simple;
	bh=riqO2sDFdM0lws4zQlNNRn1ecKXhpCYB4dsQz0JTuL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EztiC1AkLSFcFYRI5ohVB5ZuM5UYKXVHBqIZgK9802XJsA2iFmgLOnWSHvVuwCwRks5YfheKZH67PRRBVUA+snZidaqdKSE3ZVXoKkMH9qUIQjKXqMCqY6C6sgDX23lOtdC4Z6gb1UfOAr2Pg18tRI/F9jr/gq1X6ClPB1+RX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ugf+FGlm; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <30df1935-033e-486c-a7f3-041f545b2c91@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735805489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSf4anCA11nSVAw1f4HN+zUQ64fCTRk9SyYs4d0mu+M=;
	b=ugf+FGlmCESUcOmwIYr/AU4wAh4FG5rExBr3HjLtmZBW3valGgjwmPjZFcZMl9Q2ThDNPi
	BTwNp25rY7k5hAMmkRfpfraK3AXHLRAZdYU+pZjNlCuHUu/Eoho1hSZPouDMtmt8jFCaro
	m/hd+D/fT/AtiRbqE5YNh9wLgWw8Tos=
Date: Thu, 2 Jan 2025 16:11:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add landlock index Chinese translation
To: Yuxian Mao <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20241227095243.4899-1-maoyuxian@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241227095243.4899-1-maoyuxian@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


Hi Yuxian


在 2024/12/27 17:52, Yuxian Mao 写道:
> Translate lwn/Documentation/security/landlock.rst into Chinese.
>
> Update the translation through commit "dad2f2071516"
We need a complete commit tag.
>
> Signed-off-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> ---
>   .../translations/zh_CN/security/index.rst     |   2 +-
>   .../translations/zh_CN/security/landlock.rst  | 123 ++++++++++++++++++
>   2 files changed, 124 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/landlock.rst
>
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index ceb700fe4561..3f68e3145322 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -18,6 +18,7 @@
>      lsm
>      siphash
>      digsig
> +   landlock
>   
>   TODOLIST:
>   * credentials
> @@ -29,6 +30,5 @@ TODOLIST:
>   * SCTP
>   * self-protection
>   * tpm/index
> -* landlock
>   * secrets/index
>   * ipe
> diff --git a/Documentation/translations/zh_CN/security/landlock.rst b/Documentation/translations/zh_CN/security/landlock.rst
> new file mode 100644
> index 000000000000..53b449b637b2
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/landlock.rst
> @@ -0,0 +1,123 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. Copyright ? 2017-2020 Micka?l Salaün <mic@digikod.net>
> +.. Copyright ? 2019-2020 ANSSI
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/landlock.rst
> +
> +:翻译:
> +
> + 毛玉贤 Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> +
> +======================
> +Landlock LSM: 内核文档
> +======================
> +
> +:作者: Mickaël Salaün
> +:日期: 2022年12月
> +
> +Landlock的目标是创建有范围的访问控制（即沙箱机制）。为了增强整个
> +系统的安全性，此功能应适用于任何进程，包括非特权进程。因为这些进
> +程可能被攻击或植入后门（即不可信任的），所以从内核和其他进程的角
> +度来看，Landlock的功能必须安全可用。因此，Landlock 的接口设计应当
> +尽量减少可能的攻击点。
> +
> +Landlock 旨在为非特权进程使用，同时遵循由其他访问控制机制（例如 DAC、LSM）
> +强制执行的系统安全策略。Landlock 规则不应与系统上强制执行的其他访问
> +控制相冲突，而只能添加额外的限制。
> +
> +任何用户都可以在其进程上强制执行Landlock规则集。这些规则集会以一种
> +确保只能添加更多约束的方式与继承的规则集合并和评估。
> +
> +
There is an extra blankline.
> +用户空间文档如下：
> +Documentation/userspace-api/landlock.rst.
> +
> +安全访问控制机制指导原则
> +========================
> +
> +* Landlock规则应侧重于对内核对象的访问控制，而非系统调用过滤（即
> +  系统调用参数），后者是seccomp-bpf要侧重的。
> +* 为了避免多种侧信道攻击（例如安全策略泄露、基于CPU的攻击），Landlock
> +  规则不应与用户空间进行程序化通信。
> +* 内核访问检查不应降低未沙盒化进程的访问请求速度。
> +* 与 Landlock 操作相关的计算（例如强制执行规则集）应仅影响请求这些
> +  操作的进程。
> +* 由沙盒化进程直接从内核中获得的资源（例如文件描述符）在被任何进程
> +  使用时，都应保留其获取时的作用域访问权限。
> +  Cf. `文件描述符访问权限`_.
> +
> +设计选择
> +========
> +
> +inode访问权限
> +-------------
> +
> +所有访问权限都与inode以及通过inode所访问到的内容相关。读取目录的
> +内容并不意味着有权读取该目录中列出的 inode 所对应文件的内容。实际
> +上，文件名是相对于其父目录而言的 ，一个 inode 可以通过多个文件名
> +（通过硬链接）来引用。删除文件链接这一操作仅直接影响对应目录，而
> +对被移除链接的inode并无影响。这就是“LANDLOCK_ACCESS_FS_REMOVE_FILE”
> +（文件系统移除文件访问权限）或“LANDLOCK_ACCESS_FS_REFER” （文件系
> +统引用访问权限）不能与文件绑定，而只能与目录绑定的原因。
> +
> +文件描述符访问权限
> +------------------
> +
> +在打开文件时，会检查访问权限并将其与文件描述符绑定。其基本原则是，
> +当在相同的 Landlock 域下执行时，等效的操作序列会产生相同的结果。
> +以LANDLOCK_ACCESS_FS_TRUNCATE权限为例，如果相关的文件层次结构没有
> +授予该访问权限，那么可能允许打开一个文件进行写操作，但不允许使用
> +ftruncate调用截断由此产生的文件描述符。
> +以下操作序列具有相同的语义，因此会产生相同的结果：
> +
> +* ``truncate(path);``
> +* ``int fd = open(path, O_WRONLY); ftruncate(fd); close(fd);``
> +
> +与文件访问模式类似（例如O_RDWR），即使文件描述符在进程之间传递
> +（例如通过Unix域套接字），文件描述符中的Landlock访问权限也会被保留。
> +这些访问权限即使在接收进程未被 Landlock 沙盒化的情况下也会被强制执行。
> +事实上，这是为了保持整个系统访问控制的一致性，避免通过文件描述符传递
> +而无意中绕过安全限制（即“混淆代理攻击”）。
> +
> +测试
> +====
> +
> +用户空间的向后兼容性测试、ptrace 限制测试和文件系统支持测试可以在这里
> +找到：tools/testing/selftests/landlock/
> +
> +内核结构
> +========
> +
> +对象
> +----
> +
> +该API在以下内核代码中：
> +
> +security/landlock/object.h
> +
> +文件系统
> +--------
> +
> +该API在以下内核代码中：
> +
> +security/landlock/fs.h
> +
> +规则集和域
> +----------
> +
> +域是与一组主体（即任务凭证）关联的只读规则集。每次在任务上执行规则集时，
> +都会复制当前域，并在新域中导入规则集作为新的规则层。 事实上，一旦进入
> +一个域，每条规则都与一个层级绑定。要授予对对象的访问权限，每一层中至少
> +有一条规则必须允许对该对象执行请求操作。然后，任务只能过渡到一个新的域，
> +该新域是当前域的约束和任务提供的规则集的约束的交集。任务自行沙盒化时，
> +主体的定义是隐式的，这使得推理变得更加简单，并有助于避免陷阱。
> +
> +该API在以下内核代码中：
> +
> +security/landlock/ruleset.h
> +
> +.. Links
> +.. _tools/testing/selftests/landlock/:
> +
> +https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/testing/selftests/landlock/


Thanks，
Yanteng

