Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9196A33E87E
	for <lists+linux-doc@lfdr.de>; Wed, 17 Mar 2021 05:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhCQEfS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Mar 2021 00:35:18 -0400
Received: from [43.250.32.171] ([43.250.32.171]:18401 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229492AbhCQEep (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Mar 2021 00:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=yI5aIYMJhFv/dLIg9bXRK8/MWpC49CS6geR7/
        DFGFLk=; b=JpkiNIBJVHfcCJHeH0aDtlZg75Ocu+50oiVbM+LDx48Ki4OzTcBSG
        Tchejo1gWyWWeBAJ/0eVAzoiK8U4YtjZ5V2fJoCHDpMJr0MKzwn/gpjS/9tgK+u7
        uW5xHBWx9MTalGO9Sc7w0ug1CsdyFPghdNjlE1ItvSsALWcX04e640=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdDfhlFgT3knAA--.27963S2;
        Wed, 17 Mar 2021 12:34:40 +0800 (CST)
Date:   Wed, 17 Mar 2021 12:34:39 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v1 4/4] docs/zh_CN: Add zh_CN/admin-guide/security-bugs.rst
Message-ID: <2552eb0fb4ddea81f80d020c69b7b7a3699dd93a.1615950640.git.bobwxc@email.cn>
References: <cover.1615950640.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1615950640.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdDfhlFgT3knAA--.27963S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFW3Jw45Xr1rtF15tr4rAFb_yoW7KF47pa
        srKFyIganrtFn8AFZa9r47Ja1xC3yfCw43Ka48G34fJF1kAr4vvr1qqr95WrZ3Z34rJay5
        ArW8tFW7ur12krJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8XwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUjaLvtUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add translation zh_CN/admin-guide/security-bugs.rst, and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 .../zh_CN/admin-guide/security-bugs.rst       | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index d487e8adb804..335019901b1d 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -38,11 +38,11 @@ Todolist:
    reporting-issues
    bug-hunting
    bug-bisect
+   security-bugs
 
 Todolist:
 
    reporting-bugs
-   security-bugs
    tainted-kernels
    ramoops
    dynamic-debug-howto
diff --git a/Documentation/translations/zh_CN/admin-guide/security-bugs.rst b/Documentation/translations/zh_CN/admin-guide/security-bugs.rst
new file mode 100644
index 000000000000..b8120391755d
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/security-bugs.rst
@@ -0,0 +1,74 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../admin-guide/security-bugs`
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+安全缺陷
+=========
+
+Linux内核开发人员非常重视安全性。因此我们想知道何时发现了安全漏洞，以便尽快
+修复和披露。请向Linux内核安全团队报告安全漏洞。
+
+联络
+-----
+
+可以通过电子邮件<security@kernel.org>联系Linux内核安全团队。这是一个安全人员
+的私有列表，他们将帮助验证错误报告并开发和发布修复程序。如果您已经有了一个
+修复，请将其包含在您的报告中，这样可以大大加快进程。安全团队可能会从区域维护
+人员那里获得额外的帮助，以理解和修复安全漏洞。
+
+与任何缺陷一样，提供的信息越多，诊断和修复就越容易。如果您不清楚哪些信息有用，
+请查看“Documentation/translations/zh_CN/admin-guide/reporting-issues.rst”中
+概述的步骤。任何利用漏洞的攻击代码都非常有用，未经报告者同意不会对外发布，除
+非已经公开。
+
+请尽可能发送无附件的纯文本电子邮件。如果所有的细节都藏在附件里，那么就很难对
+一个复杂的问题进行上下文引用的讨论。把它想象成一个
+:doc:`常规的补丁提交 <../process/submitting-patches>` （即使你还没有补丁）：
+描述问题和影响，列出复现步骤，然后给出一个建议的解决方案，所有这些都是纯文本的。
+
+披露和限制信息
+---------------
+
+安全列表不是公开渠道。为此，请参见下面的协作。
+
+一旦开发出了健壮的补丁，发布过程就开始了。对公开的缺陷的修复会立即发布。
+
+尽管我们倾向于在未公开缺陷的修复可用时即发布补丁，但应报告者或受影响方的请求，
+这可能会被推迟到发布过程开始后的7日内，如果根据缺陷的严重性需要更多的时间，
+则可额外延长到14天。推迟发布修复的唯一有效原因是为了适应QA的逻辑和需要发布
+协调的大规模部署。
+
+虽然可能与受信任的个人共享受限信息以开发修复，但未经报告者许可，此类信息不会
+与修复程序一起发布或发布在任何其他披露渠道上。这包括但不限于原始错误报告和
+后续讨论（如有）、漏洞、CVE信息或报告者的身份。
+
+换句话说，我们唯一感兴趣的是修复缺陷。提交给安全列表的所有其他资料以及对报告
+的任何后续讨论，即使在解除限制之后，也将永久保密。
+
+协调
+------
+
+对敏感缺陷（例如那些可能导致权限提升的缺陷）的修复可能需要与私有邮件列表
+<linux-distros@vs.openwall.org>进行协调，以便分发供应商做好准备，在公开披露
+上游补丁时发布一个已修复的内核。发行版将需要一些时间来测试建议的补丁，通常
+会要求至少几天的限制，而供应商更新发布更倾向于周二至周四。若合适，安全团队
+可以协助这种协调，或者报告者可以从一开始就包括linux发行版。在这种情况下，请
+记住在电子邮件主题行前面加上“[vs]”，如linux发行版wiki中所述：
+<http://oss-security.openwall.org/wiki/mailing-lists/distros#how-to-use-the-lists>。
+
+CVE分配
+--------
+
+安全团队通常不分配CVE，我们也不需要它们来进行报告或修复，因为这会使过程不必
+要的复杂化，并可能耽误缺陷处理。如果报告者希望在公开披露之前分配一个CVE编号，
+他们需要联系上述的私有linux-distros列表。当在提供补丁之前已有这样的CVE编号时，
+如报告者愿意，最好在提交消息中提及它。
+
+保密协议
+---------
+
+Linux内核安全团队不是一个正式的机构实体，因此无法签订任何保密协议。
-- 
2.20.1

