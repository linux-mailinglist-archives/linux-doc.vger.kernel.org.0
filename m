Return-Path: <linux-doc+bounces-35653-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35DAA166CC
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 07:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A173A143A
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 06:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB6026289;
	Mon, 20 Jan 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="YMXvpc4e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com [220.197.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DFE3209
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737355881; cv=none; b=AQ7yAdpZcX17Y6QRWoJFL1FFnyRXsVeEpeSxdyQaibcblBFsit/dmA71myEz0rUTuKbLZUEJPcb/tEygB+JwJ4HVu1Gsol7k+iWnrCq+fvFnqAdwlZpa6HG+1BlffntigZghMN/pRSwnDHGr5XADsqV3mVzAmlqz2O9/fg1Q/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737355881; c=relaxed/simple;
	bh=1T1e6V4xHtzbbZ5XaesuHnLPtZ2XleuErle08u9M6qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+m0TA+EKow4Xz8KYbS7dYCB+lm27Vl0Tm4cTlwHpGv9bD8xxUln2WNgQagz+3krJB+qJymkhP8MyetC4Obwict0BGBTSLoCXP/CyjP91Q5rLRf97ZWOpv1qMn5R5eHs7JuVOiggr62Aa/bTJpsKFsiQ3ijzNp1+a0TlVVo8V7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=YMXvpc4e; arc=none smtp.client-ip=220.197.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92a3cc9a;
	Mon, 20 Jan 2025 14:51:05 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 5/7] docs/zh_CN: Add tpm tpm_vtpm_proxy Chinese translation
Date: Mon, 20 Jan 2025 14:50:50 +0800
Message-ID: <a80636fe9d79f6983e7f09f3de52d0092dd2ebdb.1737354981.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGB9NVk5IH0tCGkJDGhoaS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94827aac8409d0kunm92a3cc9a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6OCo6AzIPTzcDDDo1HzU*
	DBNPCjdVSlVKTEhMSE5OQ01NSUNPVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUhIQk83Bg++
DKIM-Signature:a=rsa-sha256;
	b=YMXvpc4eFMDfrFArxQBf2j8dqTjrBlhkXvq+f70xJbUgYtuGaD4jhvFNy/QvwDaCsmdaVPsXghJpU4Lh9ImtxHGil+r0Bsx+QyNqPGP9tU7bS0QyfpmBW22BRhFIyNHAlARFqYBDClX6tx4kEeLOCVxvcYIf4Ba0wCEbiEo4+nM=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=5c56HASQ9Qa8OkWV4iKxZFVH6jBXwWWQxD/SlG+k3pw=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_vtpm_proxy.rst into Chinese.

Update the translation through commit 799a545bb938
("tpm: move documentation under Documentation/security")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |  2 +-
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst     | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index 4ee8881a41a4..dd80816f8af8 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -15,8 +15,8 @@
    tpm_event_log
    tpm-security
    tpm_tis
+   tpm_vtpm_proxy
 
 TODOLIST:
-*   tpm_vtpm_proxy
 *   xen-tpmfront
 *   tpm_ftpm_tee
diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
new file mode 100644
index 000000000000..9f3f3d07d1cd
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/tpm_vtpm_proxy.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+==========================
+Linux容器的虚拟TPM代理驱动
+==========================
+
+| 作者：
+| Stefan Berger <stefanb@linux.vnet.ibm.com>
+
+本文档描述了用于Linux容器的虚拟可信平台模块（vTPM）代理设备驱动。
+
+介绍
+====
+
+这项工作的目标是为每个Linux容器提供TPM功能。这使得程序能够像与物理系统
+上的TPM交互一样，与容器中的TPM进行交互。每个容器都会获得一个唯一的、模
+拟的软件TPM。
+
+设计
+====
+
+为了使每个容器都能使用模拟的软件TPM，容器管理堆栈需要创建一对设备，其中
+包括一个客户端TPM字符设备 ``/dev/tpmX`` （X=0,1,2...）和一个‘服务器端’
+文件描述符。前者通过创建具有适当主次设备号的字符设备被移入容器，而文件
+描述符则传递给TPM模拟器。容器内的软件可以使用字符设备发送TPM命令，模拟器
+将通过文件描述符接收这些命令，并用它来发送响应。
+
+为了支持这一点，虚拟TPM代理驱动程序提供了一个设备 ``/dev/vtpmx`` ，该设备
+用于通过ioctl创建设备对。ioctl需要输入标志来配置设备，这些标志例如指示TPM
+模拟器是否支持TPM1.2或TPM2功能。ioctl的结果是返回‘服务器端’的文件描述符以
+及创建的字符设备的主次设备号。此外，还会返回TPM字符设备的编号。例如，如果
+创建了 ``/dev/tpm10`` ，则返回的编号（ ``dev_num`` ）10。
+
+一旦设备创建完成，驱动程序将立即尝试与TPM进行通信。来自驱动程序的所有命令
+都可以从ioctl返回的文件描述符中读取。这些命令应该立即得到响应。
+
+UAPI
+====
+
+该API在以下内核代码中：
+
+include/uapi/linux/vtpm_proxy.h
+drivers/char/tpm/tpm_vtpm_proxy.c
+
+函数：vtpmx_ioc_new_dev
-- 
2.47.1


