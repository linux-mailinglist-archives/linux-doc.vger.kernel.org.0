Return-Path: <linux-doc+bounces-18573-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A1908369
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2024 07:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D898B1F220A9
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2024 05:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56F1146D76;
	Fri, 14 Jun 2024 05:54:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from hust.edu.cn (unknown [202.114.0.240])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B665145B34;
	Fri, 14 Jun 2024 05:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.114.0.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718344493; cv=none; b=HiKFrCJY8FkCOkqLLSQhLMAza8GnDcCrsyaRkRZE2WhKRM5W0wN+DeD62CoSTycexEq5wBqvA+43XH6wl0EcKpy+G20nc0ROIqZpdT9pzzPhlyKL1ylcz1Ks0SvdOK/8nLj8PyZR0qBFUTtoxY0tnhbwgFTzgHUUfV+SugO/txE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718344493; c=relaxed/simple;
	bh=melpIGiybzqIL7gUJqXh2BV13U6xWySUjgQnFJKEXy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2mbMJU5k88DXKqkyIBBZUCJnk28fQn0kn/zz1vuamrP05Q05u5Rf1v0PSvdyn4q9bF6cTF7z65Z8ImAk6gM8AUMCPR8THJsu4oN2nlwsXGtEsc+BXzmoBnBfcvjXkMOQaqV901ig11NOu3NBXDKlKDLlKKMGJSuhGlXA9BoFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=202.114.0.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAD3Tsf_2mtmX6tzAQ--.23480S2;
	Fri, 14 Jun 2024 13:54:07 +0800 (CST)
Received: from localhost.localdomain (unknown [10.12.164.29])
	by gateway (Coremail) with SMTP id _____wCnMN_k2mtmS_QkAA--.8520S3;
	Fri, 14 Jun 2024 13:54:04 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] doc-guide: add help documention checktransupdate.rst
Date: Fri, 14 Jun 2024 13:53:21 +0800
Message-Id: <20240614055328.778041-2-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614055328.778041-1-dzm91@hust.edu.cn>
References: <20240614055328.778041-1-dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAD3Tsf_2mtmX6tzAQ--.23480S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1DWr4DXw1fZw1UZFWUurg_yoWxCry7pa
	43KryxJ3WkK34jyr1fK34DZr15Aa1xCa12gF1Iq3ZYqrn8AwnYqrW7t34rKrWDGryrZayY
	qFWYkrW0krWSva7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm2b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVWxJVW8Jr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
	8IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jq1v3UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

This commit adds help documents - Documentation/doc-guide/checktransupdate.rst
for scripts/checktransupdate.py, including English and Chinese versions

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/doc-guide/checktransupdate.rst  | 63 +++++++++++++++++++
 Documentation/doc-guide/index.rst             |  1 +
 .../zh_CN/doc-guide/checktransupdate.rst      | 62 ++++++++++++++++++
 .../translations/zh_CN/doc-guide/index.rst    |  1 +
 4 files changed, 127 insertions(+)
 create mode 100644 Documentation/doc-guide/checktransupdate.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/checktransupdate.rst

diff --git a/Documentation/doc-guide/checktransupdate.rst b/Documentation/doc-guide/checktransupdate.rst
new file mode 100644
index 000000000000..ec218c883b31
--- /dev/null
+++ b/Documentation/doc-guide/checktransupdate.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Check translation update
+==========================
+
+This script helps track the translation status of the documentation in
+different locales, i.e., whether the documentation is update-to-date with
+the English conterpart.
+
+How it works
+------------
+
+It uses ``git log`` command to track the latest English commit from the
+translation commit (order by author date) and the latest English commits
+from HEAD. If any differences occur, the file is considered as out-of-date,
+then commits that need to be updated will be collected and reported.
+
+Features implemented
+--------------------
+
+-  check all files in a certain locale
+-  check a single file or a set of files
+-  provide options to change output format
+
+Usage
+-----
+
+::
+
+   checktransupdate.py [-h] [-l LOCALE] [--print-commits | --no-print-commits] [--print-updated-files | --no-print-updated-files] [--debug | --no-debug] [files ...]
+
+Options
+~~~~~~~
+
+-  ``-l``, ``--locale``: locale to check when file is not specified
+-  ``--[no-]print-commits``: whether to print commits between origin and
+   translation
+-  ``--[no-]print-updated-files``: whether to print files that do no
+   need to be updated
+-  ``files``: files to check, if this option is specified, the locale
+   option will be ignored.
+
+Samples
+~~~~~~~
+
+-  ``./scripts/checktransupdate.py -l zh_CN``
+   This will print all the files that need to be updated in the zh_CN locale.
+-  ``./scripts/checktransupdate.py Documentation/translations/zh_CN/process/coding-style.rst``
+   This will only print the status of the specified file.
+
+Then the output is something like:
+
+::
+
+    Documentation/translations/zh_CN/process/coding-style.rst       (2 commits)
+    commit 6813216bbdba ("Documentation: coding-style: ask function-like macros to evaluate parameters")
+    commit 185ea7676ef3 ("Documentation: coding-style: Update syntax highlighting for code-blocks")
+
+Features to be implemented
+----------------------------
+
+- track the translation status of files that have no translation
+- files can be a folder instead of only a file
\ No newline at end of file
diff --git a/Documentation/doc-guide/index.rst b/Documentation/doc-guide/index.rst
index 7c7d97784626..24d058faa75c 100644
--- a/Documentation/doc-guide/index.rst
+++ b/Documentation/doc-guide/index.rst
@@ -12,6 +12,7 @@ How to write kernel documentation
    parse-headers
    contributing
    maintainer-profile
+   checktransupdate
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst b/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
new file mode 100644
index 000000000000..ce1165de1343
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/doc-guide/checktransupdate.rst
+
+:译者: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+检查翻译更新
+=============
+
+这个脚本帮助跟踪不同语言的文档翻译状态，即文档是否与对应的英文版本保持更新。
+
+工作原理
+------------
+
+它使用 ``git log`` 命令来跟踪翻译提交的最新英文提交（按作者日期排序）和英文文档的
+最新提交。如果有任何差异，则该文件被认为是过期的，然后需要更新的提交将被收集并报告。
+
+实现的功能
+--------------------
+
+- 检查特定语言中的所有文件
+- 检查单个文件或一组文件
+- 提供更改输出格式的选项
+
+用法
+-----
+
+::
+
+   checktransupdate.py [-h] [-l LOCALE] [--print-commits | --no-print-commits] [--print-updated-files | --no-print-updated-files] [--debug | --no-debug] [files ...]
+
+选项
+~~~~~~~
+
+-  ``-l``, ``--locale``: 检查指定的文件语言，如果未指定文件
+-  ``--[no-]print-commits``: 是否打印英文原始版本和翻译版本之间的提交
+-  ``--[no-]print-updated-files``: 是否打印无需更新的文件
+-  ``files``: 要检查的文件，如果指定了此选项，将忽略语言选项
+
+示例
+~~~~~~~
+
+-  ``./scripts/checktransupdate.py -l zh_CN``
+   这将打印 zh_CN 语言中需要更新的所有文件。
+-  ``./scripts/checktransupdate.py Documentation/translations/zh_CN/process/coding-style.rst``
+   这将只打印指定文件的状态。
+
+然后输出类似如下的内容：
+
+::
+
+    Documentation/translations/zh_CN/process/coding-style.rst       (2 commits)
+    commit 6813216bbdba ("Documentation: coding-style: ask function-like macros to evaluate parameters")
+    commit 185ea7676ef3 ("Documentation: coding-style: Update syntax highlighting for code-blocks")
+
+待实现的功能
+-------------
+
+- 跟踪没有翻译过的文件的翻译状态
+- 文件参数可以是文件夹而不仅仅是单个文件
\ No newline at end of file
diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Documentation/translations/zh_CN/doc-guide/index.rst
index 78c2e9a1697f..0ac1fc9315ea 100644
--- a/Documentation/translations/zh_CN/doc-guide/index.rst
+++ b/Documentation/translations/zh_CN/doc-guide/index.rst
@@ -18,6 +18,7 @@
    parse-headers
    contributing
    maintainer-profile
+   checktransupdate
 
 .. only::  subproject and html
 
-- 
2.39.2


