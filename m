Return-Path: <linux-doc+bounces-35652-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC902A166CB
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 07:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3CFC1693B0
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 06:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775CA26289;
	Mon, 20 Jan 2025 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Krl36Rv6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m1973185.qiye.163.com (mail-m1973185.qiye.163.com [220.197.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370ED3209
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737355876; cv=none; b=AiXQJHWzwe4sbkB04rqRO9re8UftexCxDbdLr3aTj7rx3j5CH8QwDA/jDJL3V3EYm65kjKA4PDAnhh8t5PACZJNtll7+FAIphV2JgiIk/qbHJ848qj8GoQbWcv521hvOpjTz05/JXnRn9+JK4lAvcyGe3wzCuD/sjeElQ9/6F6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737355876; c=relaxed/simple;
	bh=P+gfMjYBwu7fmQvFkPSswjSHjmG+S0V1GauDhc8e07M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uBN0o1pR0oujS0PrS6OEK5Yb6ItlQ1i1Aip7EUDkqFtduQOVATZOZxbPtXbLRvUUYLuWQk4EW9pa5RQSn5f3xa5Hz+HohexI/KTuvBc16ZONxL5yV3aaLwwXUwRER7nlLzIsf9vv3xVL2BiUlxZ5xY3fZ5xUX0r8k187zSq+YAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Krl36Rv6; arc=none smtp.client-ip=220.197.31.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92a3cc8f;
	Mon, 20 Jan 2025 14:51:03 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 4/7] docs/zh_CN: Add tpm tpm_tis Chinese translation
Date: Mon, 20 Jan 2025 14:50:49 +0800
Message-ID: <2c161d628a9d6cf2f8cb9a72511838207015faf1.1737354981.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS05PVh1NSRlDSk0eGB9LGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94827aa4ca09d0kunm92a3cc8f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Agw5CjIJGjcsKj8jHzUd
	FktPFC1VSlVKTEhMSE5OQ01PT0pJVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUhKSEM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Krl36Rv6GTeB56QHGrd1QJwOOB0n1AUxFekCIMvVNoIiEi30j1+J+HYTUGHxdVaMvaJShaAGYHS0M1viOml7jt95mp3rBXhVfdN529vWay+cMYWHHumjxA4R+yLZJQuzMUXUQeAGxeDrcmkmJnBOc2ddcM7X/0xCyBZEG3hSipo=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=sbYcmw285xBiidlagnQmYnPbpPZWqQimKkKeYQClPxs=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_tis.rst into Chinese.

Update the translation through commit 8a55256a8462
("Documentation: tpm_tis")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |  2 +-
 .../zh_CN/security/tpm/tpm_tis.rst            | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_tis.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index 46cdf7c1a1c1..4ee8881a41a4 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -14,9 +14,9 @@
 
    tpm_event_log
    tpm-security
+   tpm_tis
 
 TODOLIST:
-*   tpm_tis
 *   tpm_vtpm_proxy
 *   xen-tpmfront
 *   tpm_ftpm_tee
diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
new file mode 100644
index 000000000000..0fb009f93e10
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/tpm_tis.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+TPM FIFO接口驱动
+================
+
+TCG PTP规范定义了两种接口类型：FIFO和CRB。前者基于顺序的读写操作，
+后者基于包含完整命令或响应的缓冲区。
+
+FIFO（先进先出）接口被tpm_tis_core依赖的驱动程序使用。最初，Linux只
+有一个名为tpm_tis的驱动，覆盖了内存映射（即 MMIO）接口，但后来它被
+扩展以支持TCG标准所支持的其他物理接口。
+
+由于历史原因，最初的MMIO驱动被称为tpm_tis，而FIFO驱动的框架被命名为
+tpm_tis_core。在tpm_tis中的“tis”后缀来自TPM接口规范，这是针对TPM1.x
+芯片的硬件接口规范。
+
+通信基于一个由TPM芯片通过硬件总线或内存映射共享的20KiB 缓冲区，具体
+取决于物理接线。该缓冲区进一步分为五个相等大小的4KiB缓冲区，为CPU和
+TPM之间的通信提供等效的寄存器集。这些通信端点在TCG术语中称为localities。
+
+当内核想要向TPM芯片发送命令时，它首先通过在TPM_ACCESS寄存器中设置
+requestUse位来保留locality0。当访问被授予时，该位由芯片清除。一旦完成
+通信，内核会写入TPM_ACCESS.activeLocality位。这告诉芯片该本地性已被
+释放。
+
+待处理的本地性由芯片按优先级降序逐个服务，一次一个：
+
+- Locality0优先级最低。
+- Locality5优先级最高。
+
+关于localities的更多信息和含义，请参阅TCG PC客户端平台TPM 配置文件规范的第3.2节。
+
+参考文献
+========
+
+TCG PC客户端平台TPM配置文件（PTP）规范
+https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
-- 
2.47.1


