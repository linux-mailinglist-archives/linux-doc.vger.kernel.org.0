Return-Path: <linux-doc+bounces-60880-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDEB7D353
	for <lists+linux-doc@lfdr.de>; Wed, 17 Sep 2025 14:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C1A31897A22
	for <lists+linux-doc@lfdr.de>; Wed, 17 Sep 2025 07:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C372FABF0;
	Wed, 17 Sep 2025 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="QoSeG+nO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m32122.qiye.163.com (mail-m32122.qiye.163.com [220.197.32.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E92F9DA7;
	Wed, 17 Sep 2025 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094221; cv=none; b=MwDM03av2mMRLK78LF4B3wCO5Rj2CO72TqDOZES8ixY77GkIeGi40bKZgP3LQS65pEdPJ9y1N78RP9svt8CbGNOvpoJtGvZpkgmXgAFUgAhPLMCQwytzeZvwV981yk03hjjdFy2bUK8vTknHOmR905ryeMmDbRTRRT8NFCeOXYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094221; c=relaxed/simple;
	bh=rsZ+Rc7co0JQ/t1+E4Xjgz0DEXuGfxrFUKMe3DsW/VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XbpRzWpSsc5W+ZQ4XkxW4FRg3SckcA2agjy7Zm4cG+e7vADulpG3ijzww2f7F90o1joWl5U2gIw8UAnUKGXlHR8z6Zlo+ZrII7Qt0BqAAR7eybsQyHwKKhzwKjdfSWKy3LkTYHoOcSXtbRaeKsgg+F1RNPVnCgWeNn1TpHizkUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=QoSeG+nO; arc=none smtp.client-ip=220.197.32.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Received: from fedora.localdomain (unknown [1.193.36.184])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2318cdef4;
	Wed, 17 Sep 2025 15:30:11 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Subject: [PATCH] docs/zh_CN: Add security lsm-development Chinese translation
Date: Wed, 17 Sep 2025 15:30:09 +0800
Message-ID: <20250917073010.88607-1-zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a995694ba5709d0kunm3626a5511a9380f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR8YVk5PHk5MQ0JPTkJNHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVITVVKQ09ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QoSeG+nOSJgE4PB7yuH6Nyei0ntx8MV0MqQxA9wBHHdZ18cR33IPeWtFoFm/P8pIpx5jt/C2l9vwk+OQ7QfbPVTgeY7ZfyoPUJVmU6DKx3iWQwi4N164igRcxuQpGc7ylVuiiop671LMiD/I2DbMvMg6NeZqc6vm68+cNCOdE20=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=hNimwy6DyhSvElhzYzfKQrBuIk0LbW83Iy45AwRW6/Q=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/lsm-development.rst into Chinese.

Update the translation through commit 6d2ed653185b
("lsm: move hook comments docs to security/security.c").

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/index.rst     |  2 +-
 .../zh_CN/security/lsm-development.rst        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/lsm-development.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index 78d9d4b36dca..05d24e3acc11 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -18,6 +18,7 @@
    credentials
    snp-tdx-threat-model
    lsm
+   lsm-development
    sak
    self-protection
    siphash
@@ -28,7 +29,6 @@
 TODOLIST:
 * IMA-templates
 * keys/index
-* lsm-development
 * SCTP
 * secrets/index
 * ipe
diff --git a/Documentation/translations/zh_CN/security/lsm-development.rst b/Documentation/translations/zh_CN/security/lsm-development.rst
new file mode 100644
index 000000000000..7ed3719a9d07
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/lsm-development.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/lsm-development.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+=================
+Linux安全模块开发
+=================
+
+基于https://lore.kernel.org/r/20071026073721.618b4778@laptopd505.fenrus.org，
+当一种新的LSM的意图（它试图防范什么，以及在哪些情况下人们会期望使用它）在
+``Documentation/admin-guide/LSM/`` 中适当记录下来后，就会被接受进入内核。
+这使得LSM的代码可以很轻松的与其目标进行对比，从而让最终用户和发行版可以更
+明智地决定那些LSM适合他们的需求。
+
+有关可用的 LSM 钩子接口的详细文档，请参阅 ``security/security.c`` 及相关结构。
-- 
2.49.0


