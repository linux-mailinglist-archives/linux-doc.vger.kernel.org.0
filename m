Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623BD37FDCF
	for <lists+linux-doc@lfdr.de>; Thu, 13 May 2021 21:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhEMTIF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 May 2021 15:08:05 -0400
Received: from [43.250.32.171] ([43.250.32.171]:57273 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231461AbhEMTIF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 15:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=yMX+KNhF33IssRxI7hiWjThNeeXTU7+WW2fju
        BuDASs=; b=b+T/xJ4uVL6sNlT7EVmeqlAhbtujl93TKTB2y5BWDCrNv8cEY8Emm
        q5ahaF1uRmu6b7OZlBMW1oYBjYNRADwdlNV2IpBgpKtBCtU4C/HEVIvGSW2/dqCK
        UJaljtqOCVw9rN5iQpKADQuyxMNRcSl/t8fNQ5z+VT1hPGMin7/KSU=
Received: from bobwxc.top (unknown [112.96.109.117])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3PkHKeJ1gYWQoAA--.34102S2;
        Fri, 14 May 2021 03:06:52 +0800 (CST)
Date:   Fri, 14 May 2021 03:06:49 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/6] docs/zh_CN: Add translation
 zh_CN/maintainer/configure-git.rst
Message-ID: <dcf6addd89eba3777b9b59d8b506fa162fbcd828.1620932189.git.bobwxc@email.cn>
References: <cover.1620932189.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1620932189.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB3PkHKeJ1gYWQoAA--.34102S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW5XFyfKFykAr18WFWfXwb_yoWrJr1UpF
        Z2gryIgF1kAF13Cr48GFyxGF1UAayfGw13G3WDW3WrXFsIya9YyFnrtF9IgFZ2gFykAFW5
        Ars3GFyq9w4Fka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUU0tC7UU
        UUU==
X-Originating-IP: [112.96.109.117]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/configure-git.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/maintainer/configure-git.rst        | 62 +++++++++++++++++++
 .../translations/zh_CN/maintainer/index.rst   |  6 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst

diff --git a/Documentation/translations/zh_CN/maintainer/configure-git.rst b/Documentation/translations/zh_CN/maintainer/configure-git.rst
new file mode 100644
index 000000000000..a45ea736f73b
--- /dev/null
+++ b/Documentation/translations/zh_CN/maintainer/configure-git.rst
@@ -0,0 +1,62 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/maintainer/configure-git.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _configuregit_zh:
+
+Git配置
+=======
+
+本章讲述了维护者级别的git配置。
+
+Documentation/maintainer/pull-requests.rst 中使用的标记分支应使用开发人员的
+GPG公钥进行签名。可以通过将 ``-u`` 标志传递给 ``git tag`` 来创建签名标记。
+但是，由于 *通常* 对同一项目使用同一个密钥，因此可以设置::
+
+	git config user.signingkey "keyname"
+
+或者手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
+
+	[user]
+		name = Jane Developer
+		email = jd@domain.org
+		signingkey = jd@domain.org
+
+你可能需要告诉 ``git`` 去使用 ``gpg2``::
+
+	[gpg]
+		program = /path/to/gpg2
+
+你可能也需要告诉 ``gpg`` 去使用哪个 ``tty`` （添加到你的shell rc文件中）::
+
+	export GPG_TTY=$(tty)
+
+
+创建链接到lore.kernel.org的提交
+-------------------------------
+
+http://lore.kernel.org 网站是所有涉及或影响内核开发的邮件列表的总存档。在这里
+存储补丁存档是推荐的做法，当维护人员将补丁应用到子系统树时，最好提供一个指向
+lore存档链接的标签，以便浏览提交历史的人可以找到某个更改背后的相关讨论和基本
+原理。链接标签如下所示：
+
+	Link: https://lore.kernel.org/r/<message-id>
+
+通过在git中添加以下钩子，可以将此配置为在发布 ``git am`` 时自动执行：
+
+.. code-block:: none
+
+	$ git config am.messageid true
+	$ cat >.git/hooks/applypatch-msg <<'EOF'
+	#!/bin/sh
+	. git-sh-setup
+	perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://lore.kernel.org/r/$1|g;' "$1"
+	test -x "$GIT_DIR/hooks/commit-msg" &&
+		exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
+	:
+	EOF
+	$ chmod a+x .git/hooks/applypatch-msg
diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
index 4ce27c12f370..e263315f5e7a 100644
--- a/Documentation/translations/zh_CN/maintainer/index.rst
+++ b/Documentation/translations/zh_CN/maintainer/index.rst
@@ -10,9 +10,13 @@
 本手册还需要大量完善！请自由提出（和编写）本手册的补充内容。
 *译注：指英文原版*
 
+.. toctree::
+   :maxdepth: 2
+
+   configure-git
+
 TODOList:
 
--   configure-git
 -   rebasing-and-merging
 -   pull-requests
 -   maintainer-entry-profile
-- 
2.20.1

