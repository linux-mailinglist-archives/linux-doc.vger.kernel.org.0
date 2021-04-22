Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA090368070
	for <lists+linux-doc@lfdr.de>; Thu, 22 Apr 2021 14:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbhDVM3B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Apr 2021 08:29:01 -0400
Received: from [43.250.32.171] ([43.250.32.171]:28295 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S236456AbhDVM2o (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Apr 2021 08:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=oJXzIlQkQd2q2ZAFrHEYMSqDfSt4gC6FMphU/
        cOnBd8=; b=fim1dnLR372XMj6i3n3NkDQYyTGBTLBXWswY8Q8jKHwpD39CCOPd4
        Knw7zOxRYoU9O9WsWzQr4S+IVwL8dd3Ilza5gM7OTjF6YbWessDvXhdk5IXH2WuI
        tYVkfwtzumHgIPS7dkfc8Xox3zJsXa51yOLArOPVy61i1Gl54Zo1YY=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3PkHUa4FgnfQDAA--.12137S2;
        Thu, 22 Apr 2021 20:28:06 +0800 (CST)
Date:   Thu, 22 Apr 2021 20:28:03 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH 6/6] docs/zh_CN: Add translation
 zh_CN/maintainer/modifying-patches.rst
Message-ID: <710672f91fe72a6ee8a78a8ea3c714068bd9a322.1619093668.git.bobwxc@email.cn>
References: <cover.1619093668.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619093668.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB3PkHUa4FgnfQDAA--.12137S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1xCFy3KFyrXFy8CrW5GFg_yoWrGw43pF
        y2gryfG3W8JF13CFWfGa4xXF15Ga4xCFW7JrsIg3ZYvF98trsayr98tF9I9Fy3WryfZFWa
        vFs3GFykCF45ua7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
        IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UY_M-UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/modifying-patches.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/maintainer/index.rst   |  4 +-
 .../zh_CN/maintainer/modifying-patches.rst    | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst

diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
index 18a820741f52..eb75ccea9a21 100644
--- a/Documentation/translations/zh_CN/maintainer/index.rst
+++ b/Documentation/translations/zh_CN/maintainer/index.rst
@@ -17,7 +17,5 @@
    rebasing-and-merging
    pull-requests
    maintainer-entry-profile
+   modifying-patches
 
-TODOList:
-
--   modifying-patches
diff --git a/Documentation/translations/zh_CN/maintainer/modifying-patches.rst b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
new file mode 100644
index 000000000000..6f3bf493440c
--- /dev/null
+++ b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
@@ -0,0 +1,51 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/maintainer/modifying-patches.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _modifyingpatches_zh:
+
+修改补丁
+========
+
+如果你是子系统或者分支的维护者，由于代码在你的和提交者的树中并不完全相同，
+有时你需要稍微修改一下收到的补丁以合并它们。
+
+如果你严格遵守开发者来源证书的规则（c），你应该要求提交者重做，但这完全是会
+适得其反的时间、精力浪费。规则（b）允许你调整代码，但这样修改提交者的代码并
+让他背书你的错误是非常不礼貌的。为解决此问题，建议在你之前最后一个
+Signed-off-by标签和你的之间添加一行，以指示更改的性质。这没有强制性要求，最
+好在描述前面加上你的邮件和/或姓名，用方括号括住整行，以明显指出你对最后一刻
+的更改负责。例如::
+
+        Signed-off-by: Random J Developer <random@developer.example.org>
+        [lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
+        Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
+
+如果您维护着一个稳定的分支，并希望同时明确贡献、跟踪更改、合并修复，并保护
+提交者免受责难，这种做法尤其有用。请注意，在任何情况下都不得更改作者的身份
+（From头），因为它会在变更日志中显示。
+
+回传（back-port）者特别要注意：为了便于跟踪，请在提交消息的顶部（就在主题行
+之后）插入补丁的来源，这是一种常见而有用的做法。例如，我们可以在3.x稳定版本
+中看到以下内容::
+
+        Date:   Tue Oct 7 07:26:38 2014 -0400
+
+        libata: Un-break ATA blacklist
+
+        commit 1c40279960bcd7d52dbdf1d466b20d24b99176c8 upstream.
+
+下面是一个旧的内核在某补丁被回传后会出现的::
+
+        Date:   Tue May 13 22:12:27 2008 +0200
+
+        wireless, airo: waitbusy() won't delay
+
+        [backport of 2.6 commit b7acbdfbd1f277c1eb23f344f899cfa4cd0bf36a]
+
+不管什么格式，这些信息都为人们跟踪你的树，以及试图解决你树中的错误的人提供了
+有价值的帮助。
-- 
2.20.1

