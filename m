Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64E136A427
	for <lists+linux-doc@lfdr.de>; Sun, 25 Apr 2021 04:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhDYC1b (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 24 Apr 2021 22:27:31 -0400
Received: from [43.250.32.171] ([43.250.32.171]:54544 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhDYC1b (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Apr 2021 22:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=cIJoTN+RWOs5nb71x5xyGuZS5D1HW+TR85Hs8
        Ngt4kc=; b=WsXQ0eZHHFlQAElbTEmEGMrISmxYHj6rjSviIQ90gtTgpaG7X+9Yy
        /Z6pZ3uYLzSRjnzpJRWAzL3KpIk2XLPylG6sC2WOrezb3pEZQhNpOg81Z13d3V+N
        Aj1bVCKcsXRD9zmRvEbgkq01gc51bUO+G6OuPrf1pIbZSdr8TLHwYA=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDXnUBn04Rg6ZoIAA--.21228S2;
        Sun, 25 Apr 2021 10:26:48 +0800 (CST)
Date:   Sun, 25 Apr 2021 10:26:47 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH v2 6/6] docs/zh_CN: Add translation
 zh_CN/maintainer/modifying-patches.rst
Message-ID: <02cac19394207e444af54680a634662d3b3d368d.1619278582.git.bobwxc@email.cn>
References: <cover.1619278582.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619278582.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDXnUBn04Rg6ZoIAA--.21228S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW7CFW8ZrWUAryfXw4ktFb_yoWrXF1UpF
        y2gryfG3W8JF17CFWfGa4xXF15Ga47CFW7JrsIg3ZYvF98trsayr98tF9I9Fy3WryfXFWa
        vFs3GFykCF45Ca7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8JwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7xRRuyIUUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/modifying-patches.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
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

