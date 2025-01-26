Return-Path: <linux-doc+bounces-36146-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F8A1C761
	for <lists+linux-doc@lfdr.de>; Sun, 26 Jan 2025 11:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EB6118860D0
	for <lists+linux-doc@lfdr.de>; Sun, 26 Jan 2025 10:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E728178F4A;
	Sun, 26 Jan 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r5+xcNi6"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB437603F
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737887080; cv=none; b=CLqcZzpPRybPCzVNc0+82E/mSSoja2Dsngdrmz5oX+PRPAMVKbEwQEEKF7jbRD9OtXvBR2mCbcLG4sFgk6A2WAFV3bapaJd3MTdu9XJDce9D7Ycsd5unTU246K/eeMC3RjnjBxo95v/hQdQqHCUdge5uO4BbWI1/Q10QQGrc2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737887080; c=relaxed/simple;
	bh=02MbEoIi8/s04eaLC/jJRjhPskoMUgpNwzdtzvdeBig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6NiO9lZ8UUquriQFRGf895HqUoYDK6tILrDDQo6ZJ8De7r6lm1AHS2nW3fTAko3loIhJQJ7Q+ZpWpTq69C+B+WJrgTnMR123wmR6WiCTBzPIEZFVqT2dTp0h1sI9m1I5B5TdARiPJ8y3awZw9TRYYmJKXWxvjeRNaIUuQLn4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r5+xcNi6; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <fa03cf7f-0971-451b-a009-7e1a5a5f6f92@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737887075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/UsZ8U/AMvwmBnqbz2kyvSzzbl2R43+/YivM+xQcE8=;
	b=r5+xcNi641MFLECSC7a9h1fyBKmF/MxmjYBDKDSvxA5S2CHAoTN6uX97eYtxcyf9IilcXT
	EtFsonHE5lfY/1AsS0RHMd5pzrQv2pFahe8E4Je4QOwWl8nyymyJPSB8fgipyrhdI/o5IT
	H8nrXZtA+mMV319LSKUTRVk9yfRcsoE=
Date: Sun, 26 Jan 2025 18:23:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] docs/zh_CN: Add snp-tdx-threat-model index Chinese
 translation
To: Yuxian Mao <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20250124102136.561488-1-maoyuxian@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250124102136.561488-1-maoyuxian@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 1/24/25 18:21, Yuxian Mao 写道:
> Translate .../security/snp-tdx-threat-model.rst into Chinese.
>
> Update the translation through commit "cdae7e8a69c3"
> ("docs/MAINTAINERS: Update my email address")
>
> Signed-off-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>
> v4:
>
> Translation errors have been fixed
>
> v3:
>
> Message header fixes
>
> v2:
>   
> fix remove the unnecessary blank lines
>
>   .../translations/zh_CN/security/index.rst     |   2 +-
>   .../zh_CN/security/snp-tdx-threat-model.rst   | 209 ++++++++++++++++++
>   2 files changed, 210 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
>
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index 9a6345dd90b8..78d9d4b36dca 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -16,6 +16,7 @@
>      :maxdepth: 1
>   
>      credentials
> +   snp-tdx-threat-model
>      lsm
>      sak
>      self-protection
> @@ -25,7 +26,6 @@
>      landlock
>   
>   TODOLIST:
> -* snp-tdx-threat-model
>   * IMA-templates
>   * keys/index
>   * lsm-development
> diff --git a/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst b/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
> new file mode 100644
> index 000000000000..63f74496478a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
> @@ -0,0 +1,209 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/snp-tdx-threat-model.rst
> +
> +:翻译:
> +
> + 毛玉贤 Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> +
> +==========================
> +Linux中x86虚拟化的机密计算
> +==========================
> +
> +.. contents:: :local:
> +
> +By: Elena Reshetova <elena.reshetova@intel.com> and Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> +
> +动机
> +====
> +
> +在x86虚拟环境中从事机密计算工作的内核开发人员，是基于一组与传统Linux内核
> +威胁模型有所不同的假设条件下开展工作的。传统意义上，Linux威胁模型承认攻
> +击者可以存在于用户空间，以及一小部分能够通过各种网络接口或有限的硬件特定
> +暴露接口（如USB、Thunderbolt）与内核交互的外部攻击者。本文档的目的是解释
> +在机密计算领域中出现的额外攻击向量，并讨论为 Linux 内核提出的保护机制。
> +
> +概述与术语
> +==========
> +
> +机密计算（Confidential Computing，简称CoCo）是一个广泛的术语，涵盖了多种
> +旨在保护数据在使用过程中（与静态数据或传输数据相比）的机密性和完整性的安
> +全技术。从本质上讲，机密计算（CoCo）解决方案提供了一个受信任执行环境（TEE），
> +在该环境中可以进行安全的数据处理，因此，它们通常根据预期在TEE中运行的软件
> +来进一步划分为不同的子类型。本文档专注于一类针对虚拟化环境的机密计算技术
> +（Confidential Computing, CoCo），这些技术允许在可信执行环境
> +（Trusted Execution Environment, TEE）中运行虚拟机（VM）。从现在起，本文档
> +将把这一类机密计算（CoCo）技术称为“虚拟化环境（VE）中的机密计算（CoCo）”。
> +
> +在虚拟化环境中，机密计算（CoCo）指的是一组硬件和/或软件技术，这些技术能够
> +为在CoCo虚拟机（VM）内运行的软件提供更强的安全保障。具体来说，机密计算允许
> +其用户确认所有软件组件的可信度，从而将其包含在精简的受信任计算基（TCB）中，
> +这是基于机密计算具备验证这些受信组件状态的能力。
> +
> +虽然不同技术之间的具体实现细节有所不同，但所有现有机制都旨在为虚拟机的客户
> +内存和执行状态（vCPU寄存器）提供更高的机密性和完整性，更严格地控制客户中断
> +注入，并提供一些额外机制来控制客户与宿主机之间的页映射。有关x86特定解决方案
> +的更多细节，可以参考
> +:doc:`Intel Trust Domain Extensions (TDX) </arch/x86/tdx>` 和
> +`AMD Memory Encryption <https://www.amd.com/system/files/techdocs/sev-snp-strengthening-vm-isolation-with-integrity-protection-and-more.pdf>`_.
> +
> +基本的机密计算（CoCo）客户布局包括宿主机、客户机、用于客户机与宿主机之间通信
> +的接口、能够支持CoCo虚拟机（VM）的平台，以及一个在客户VM和底层平台之间充当安
> +全管理员的可信中介。宿主机侧的虚拟机监视器（VMM）通常由传统VMM功能的一个子集
> +组成，并仍然负责客户机生命周期的管理，即创建或销毁CoCo虚拟机、管理其对系统资
> +源的访问等。然而，由于它通常不在CoCo VM的可信计算基（TCB）内，其访问权限受到
> +限制，以确保实现安全目标。
> +
> +在下图中，"<--->" 线表示机密计算（CoCo）安全管理员与其余组件之间的双向通信通
> +道或接口，这些组件包括客户机、宿主机和硬件（数据流）::
> +
> +    +-------------------+      +-----------------------+
> +    | CoCo guest VM     |<---->|                       |
> +    +-------------------+      |                       |
> +      | Interfaces |           | CoCo security manager |
> +    +-------------------+      |                       |
> +    | Host VMM          |<---->|                       |
> +    +-------------------+      |                       |
> +                               |                       |
> +    +--------------------+     |                       |
> +    | CoCo platform      |<--->|                       |
> +    +--------------------+     +-----------------------+
> +
> +机密计算（CoCo）安全管理器的具体细节在在不同技术之间存在显著差异。例如，在某
> +些情况下，它可能通过硬件（HW）实现，而在其他情况下，它可能是纯软件（SW）实现。
> +
> +现有的Linux内核威胁模型
> +=======================
> +
> +当前Linux内核威胁模型的总体组件包括::
> +
> +     +-----------------------+      +-------------------+
> +     |                       |<---->| Userspace         |
> +     |                       |      +-------------------+
> +     |   External attack     |         | Interfaces |
> +     |       vectors         |      +-------------------+
> +     |                       |<---->| Linux Kernel      |
> +     |                       |      +-------------------+
> +     +-----------------------+      +-------------------+
> +                                    | Bootloader/BIOS   |
> +                                    +-------------------+
> +                                    +-------------------+
> +                                    | HW platform       |
> +                                    +-------------------+
> +
> +在启动过程中，引导加载程序（bootloader）和内核之间也存在通信，但本图并未明确
> +表示这一点。“接口”框表示允许内核与用户空间之间通信的各种接口。 这包括系统调用、
> +内核 API、设备驱动程序等。
> +
> +现有的 Linux 内核威胁模型通常假设其在一个受信任的硬件平台上执行，并且所有固件
> +和启动加载程序都包含在该平台的受信任计算基（TCB）中。主要攻击者驻留在用户空间
> +中，来自用户空间的所有数据通常被认为是不可信的，除非用户空间具有足够的特权来
> +执行受信任的操作。此外，通常还会考虑外部攻击者，包括那些能够访问启用的外部网络
> +（例如以太网、无线网络、蓝牙）、暴露的硬件接口（例如 USB、Thunderbolt），以及
> +能够离线修改磁盘内容的攻击者。
> +
> +关于外部攻击途径，值得注意的是，在大多数情况下，外部攻击者会首先尝试利用用户空
> +间的漏洞，但攻击者也可能直接针对内核，特别是在宿主机具有物理访问权限的情况下。直
> +接攻击内核的例子包括漏洞 CVE-2019-19524、CVE-2022-0435 和 CVE-2020-24490。
> +
> +机密计算威胁模型及其安全目标
> +============================
> +
> +机密计算在上述攻击者列表中增加了一种新的攻击者类型：可能存在行为不当的宿主机
> +（这可能包括传统虚拟机监视器VMM的部分组件或全部），由于其较大的软件攻击面，
> +通常被置于CoCo VM TCB之外。需要注意的是，这并不意味着宿主机或VMM是故意恶意的，
> +而是强调拥有一个较小的CoCo VM TCB具有安全价值。这种新型的攻击者可以被视为一种
> +更强大的外部攻击者，因为它位于同一物理机器上（与远程网络攻击者不同），并且对
> +客户机内核与大部分硬件的通信具有控制权::
> +
> +                                 +------------------------+
> +                                 |    CoCo guest VM       |
> +   +-----------------------+     |  +-------------------+ |
> +   |                       |<--->|  | Userspace         | |
> +   |                       |     |  +-------------------+ |
> +   |   External attack     |     |     | Interfaces |     |
> +   |       vectors         |     |  +-------------------+ |
> +   |                       |<--->|  | Linux Kernel      | |
> +   |                       |     |  +-------------------+ |
> +   +-----------------------+     |  +-------------------+ |
> +                                 |  | Bootloader/BIOS   | |
> +   +-----------------------+     |  +-------------------+ |
> +   |                       |<--->+------------------------+
> +   |                       |          | Interfaces |
> +   |                       |     +------------------------+
> +   |     CoCo security     |<--->| Host/Host-side VMM |
> +   |      manager          |     +------------------------+
> +   |                       |     +------------------------+
> +   |                       |<--->|   CoCo platform        |
> +   +-----------------------+     +------------------------+
> +
> +传统上，宿主机对客户机数据拥有无限访问权限，并可以利用这种访问权限来攻击客户虚
> +拟机。然而，机密计算（CoCo）系统通过添加诸如客户数据保密性和完整性保护等安全
> +特性来缓解此类攻击。该威胁模型假设这些安全特性是可用且完好的。
> +
> +**Linux内核机密计算虚拟机（CoCo VM）的安全目标**可以总结如下：
> +
> +1. 保护CoCo客户机私有内存和寄存器的机密性和完整性。
> +
> +2. 防止宿主机特权升级到CoCo客户机Linux内核。虽然宿主机（及主机端虚拟机管理程序）
> +   确实需要一定的特权来创建、销毁或暂停访客，但防止特权升级的部分目标是确保这些
> +   操作不会为攻击者提供获取客户机内核访问权限的途径。
> +
> +上述安全目标导致了两个主要的**Linux内核机密计算虚拟机（CoCo VM）资产**：
> +
> +1. 客户机内核执行上下文。
> +2. 客户机内核私有内存。
> +
> +宿主机对CoCo客户机资源具有完全控制权，并可以随时拒绝访问这些资源。资源的示例包
> +括CPU时间、客户机可以消耗的内存、网络带宽等。因此，宿主机对CoCo客户机的拒绝服务
> +（DoS）攻击超出了此威胁模型的范围。
> +
> +Linux CoCo虚拟机攻击面是指从CoCo客户机Linux内核暴露到不受信任的主机的任何接口，
> +这些接口未被CoCo技术的软硬件保护所覆盖。这包括所有可能的侧信道攻击以及瞬态执
> +行侧信道攻击。显式（非旁道）接口的示例包括访问端口I/O、内存映射I/O（MMIO）和
> +直接内存访问（DMA）接口、访问PCI配置空间、特定于虚拟机管理程序（VMM）的超调用
> +（指向主机端VMM）、访问共享内存页、主机允许注入到访客内核的中断，以及特定于
> +CoCo技术的超调用（如果存在）。此外，在CoCo系统中，宿主机通常控制创建CoCo客户机
> +的过程：它有方法将固件和引导程序镜像、内核镜像以及内核命令行加载到客户机中。所有
> +这些数据在通过证明机制确认其完整性和真实性之前，都应视为不可信的。
> +
> +下表显示了针对CoCo客户机Linux内核的威胁矩阵，但并未讨论潜在的缓解策略。该矩阵涉
> +及的是CoCo特定版本的客户机、宿主机和平台。
> +
> +.. list-table:: CoCo Linux客户机内核威胁矩阵
> +   :widths: auto
> +   :align: center
> +   :header-rows: 1
> +
> +   * - 威胁名称
> +     - 威胁描述
> +
> +   * - 客户机恶意配置
> +     - 一个行为不当的主机修改了以下其中一个客户机的配置：
> +
> +       1. 客户机固件或引导加载程序
> +
> +       2. 客户机内核或模块二进制文件
> +
> +       3. 客户机命令行参数
> +
> +       这使得宿主机能够破坏在CoCo客户虚拟机内部运行代码的完整性，从而违反了机密计算
> +       （CoCo）的安全目标。
> +
> +   * - CoCo客户机数据攻击
> +     - 一个行为不当的宿主机对CoCo客户虚拟机与宿主机管理的物理或虚拟设备之间传输的数
> +       据拥有完全控制权。这使得宿主机可以对这类数据的保密性、完整性和新鲜性进行任何攻击。
> +
> +   * - 格式错误的运行时输入
> +     - 一个行为不当的宿主机通过客户机内核代码使用的任意通信接口注入格式错误的输入。
> +       如果代码没有正确处理这些输入，这可能导致从宿主机到客户机内核的特权提升。这包
> +       括传统的侧信道攻击和/或瞬态执行攻击路径。
> +
> +   * - 恶意运行时输入
> +     - 一个行为不当的宿主机通过客户机内核代码使用的任意通信接口注入特定的输入值。与之前
> +       的攻击向量（格式错误的运行时输入）不同，这个输入并非格式错误，而是其值被精心设
> +       计以影响客户机内核的安全性。这类输入的例子包括向客户机提供恶意的时间或向客户机
> +       的随机数生成器提供熵值。此外，如果它导致客户机内核执行特定操作（例如处理主机注
> +       入的中断），此类事件的时序本身也可能成为一种攻击路径。这种攻击是对提供的宿主机输
> +       入具有抵抗性的一种方式。

