Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F07937A613
	for <lists+linux-doc@lfdr.de>; Tue, 11 May 2021 13:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhEKLwx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 May 2021 07:52:53 -0400
Received: from m32-153.88.com ([43.250.32.153]:63993 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229892AbhEKLwv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 May 2021 07:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=LNwR4jCgfWtZjbWgU/kgUpLUmrOCZraxfKXrc
        N+edB8=; b=AoN7uCklO+kHBE3v4WGdQViua4WxFDE/JtlqV2e12Tb6QbE0J08JS
        yyfbY++ixWTIp7HR4rskQy9+6WwyqOu5GIqZZB2HEtiqP0RYiLfJmiJx3R3VRq7a
        v1K7KSCV7fE5y3lAJmEmaxFulU0EW3F9pU+u9AawojUhdLoVdHb6Wg=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHVljCb5pgPdUqAA--.42572S2;
        Tue, 11 May 2021 19:51:32 +0800 (CST)
Date:   Tue, 11 May 2021 19:51:30 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs/zh_CN: sync reporting-issues.rst
Message-ID: <20210511115127.GA9712@bobwxc.top>
References: <20210509150735.GA30084@bobwxc.top>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210509150735.GA30084@bobwxc.top>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHVljCb5pgPdUqAA--.42572S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGF48GryDtw1fGFW5GF4fAFb_yoWkGw43pa
        n2qa90kw4akFn8Cryvg3Wxu3W3Kw4DCay3GF98Ja48Ar43Jr4UAw1qqFy5WFWfWr95GFyD
        ZFZrAr1Fvry2qrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUnLSdPUU
        UUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sync zh_CN/admin-guide/reporting-issues.rst to newest version

commit 0043f0b27a040 ("docs: reporting-issues.rst: CC subsystem and
                       maintainers on regressions")

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
v2:
* Modify some words under YanTeng Si's advices
* Pick Alex Shi's reviewed-by tag
Thanks for their review!

v1:
<https://lore.kernel.org/linux-doc/20210509150735.GA30084@bobwxc.top/>

 .../zh_CN/admin-guide/reporting-issues.rst    | 58 ++++++++++++-------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
index 6b4988da2c5a..6cb098feed94 100644
--- a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
+++ b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
@@ -29,7 +29,9 @@
 请搜索 `LKML内核邮件列表 <https://lore.kernel.org/lkml/>`_ 和
 `Linux稳定版邮件列表 <https://lore.kernel.org/stable/>`_ 存档中匹配的报告并
 加入讨论。如果找不到匹配的报告，请安装该系列的最新版本。如果它仍然出现问题，
-报告给稳定版邮件列表（stable@vger.kernel.org）。
+请报告给稳定版邮件列表（stable@vger.kernel.org）并抄送回归邮件列表
+（regressions@lists.linux.dev）；理想情况下，还可以抄送维护者和相关子系统的
+邮件列表。
 
 在所有其他情况下，请尽可能猜测是哪个内核部分导致了问题。查看MAINTAINERS文件，
 了解开发人员希望如何得知问题，大多数情况下，报告问题都是通过电子邮件和抄送
@@ -46,9 +48,10 @@
 有使用附加模块）。还要确保它是在一个正常的环境中构建和运行，并且在问题发生
 之前没有被污染（tainted）。
 
-在编写报告时，要涵盖与问题相关的所有信息，如使用的内核和发行版。在碰见回归时，
-尝试给出引入它的更改的提交ID，二分可以找到它。如果您同时面临Linux内核的多个
-问题，请分别报告每个问题。
+当你同时面临Linux内核的多个问题时，请分别报告。在编写报告时，要涵盖与问题
+相关的所有信息，如使用的内核和发行版。如果碰见回归，请把报告抄送回归邮件列表
+（regressions@lists.linux.dev）。也请试试用二分法找出源头；如果成功找到，请
+在报告中写上它的提交ID并抄送sign-off-by链中的所有人。
 
 一旦报告发出，请回答任何出现的问题，并尽可能地提供帮助。这包括通过不时重新
 测试新版本并发送状态更新来推动进展。
@@ -156,9 +159,10 @@
    存在问题，因为问题可能已经在那里被修复了。如果您第一次发现供应商内核的问题，
    请检查已知最新版本的普通构建是否可以正常运行。
 
- * 向Linux稳定版邮件列表发送一个简短的问题报告(stable@vger.kernel.org)。大致
-   描述问题，并解释如何复现。讲清楚首个出现问题的版本和最后一个工作正常的版本。
-   然后等待进一步的指示。
+ * 向Linux稳定版邮件列表发送一个简短的问题报告（stable@vger.kernel.org）并抄送
+   Linux回归邮件列表（regressions@lists.linux.dev）；如果你怀疑是由某子系统
+   引起的，请抄送其维护人员和子系统邮件列表。大致描述问题，并解释如何复现。
+   讲清楚首个出现问题的版本和最后一个工作正常的版本。然后等待进一步的指示。
 
 下面的参考章节部分详细解释了这些步骤中的每一步。
 
@@ -591,7 +595,8 @@ ath10k@lists.infradead.org”，将引导您到ath10k邮件列表的信息页，
 搜索引擎，并添加类似“site:lists.infadead.org/pipermail/ath10k/”这
 样的搜索条件，这会把结果限制在该链接中的档案。
 
-也请进一步搜索网络、LKML和bugzilla.kernel.org网站。
+也请进一步搜索网络、LKML和bugzilla.kernel.org网站。如果你的报告需要发送到缺陷
+跟踪器中，那么您可能还需要检查子系统的邮件列表存档，因为可能有人只在那里报告了它。
 
 有关如何搜索以及在找到匹配报告时如何操作的详细信息，请参阅上面的“搜索现有报告
 （第一部分）”。
@@ -825,8 +830,7 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
 
 在整个过程中，请记住：只有当旧内核和新内核的配置相似时，问题才算回归。最好
 的方法是：把配置文件（``.config``）从旧的工作内核直接复制到你尝试的每个新内
-核版本。之后运行 ``make oldnoconfig`` 来调整它以适应新版本的需要，而不启用
-任何新的功能，因为那些功能也可能导致回归。
+核版本。之后运行 ``make olddefconfig`` 来调整它以适应新版本的需要。
 
 
 撰写并发送报告
@@ -959,11 +963,19 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
 **非常严重的缺陷** ：确保在主题或工单标题以及第一段中明显标出 severeness
 （非常严重的）。
 
-**回归** ：如果问题是一个回归，请在邮件的主题或缺陷跟踪器的标题中添加
-[REGRESSION]。如果您没有进行二分，请至少注明您测试的最新主线版本（比如 5.7）
-和出现问题的最新版本（比如 5.8）。如果您成功地进行了二分，请注明导致回归
-的提交ID和主题。也请添加该变更的作者到你的报告中；如果您需要将您的缺陷提交
-到缺陷跟踪器中，请将报告以私人邮件的形式转发给他，并注明报告提交地点。
+**回归** ：报告的主题应以“[REGRESSION]”开头。
+
+如果您成功用二分法定位了问题，请使用引入回归之更改的标题作为主题的第二部分。
+请在报告中写明“罪魁祸首”的提交ID。如果未能成功二分，请在报告中讲明最后一个
+正常工作的版本（例如5.7）和最先发生问题的版本（例如5.8-rc1）。
+
+通过邮件发送报告时，请抄送Linux回归邮件列表（regressions@lists.linux.dev）。
+如果报告需要提交到某个web追踪器，请继续提交；并在提交后，通过邮件将报告转发
+至回归列表；抄送相关子系统的维护人员和邮件列表。请确保报告是内联转发的，不要
+把它作为附件。另外请在顶部添加一个简短的说明，在那里写上工单的网址。
+
+在邮寄或转发报告时，如果成功二分，需要将“罪魁祸首”的作者添加到收件人中；同时
+抄送signed-off-by链中的每个人，您可以在提交消息的末尾找到。
 
 **安全问题** ：对于这种问题，你将必须评估：如果细节被公开披露，是否会对其他
 用户产生短期风险。如果不会，只需按照所述继续报告问题。如果有此风险，你需要
@@ -1173,14 +1185,18 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
 报告回归
 ~~~~~~~~~~
 
-    *向Linux稳定版邮件列表发送一个简短的问题报告(stable@vger.kernel.org)。
-    大致描述问题，并解释如何复现。讲清楚首个出现问题的版本和最后一个工作正常
-    的版本。然后等待进一步的指示。*
+    *向Linux稳定版邮件列表发送一个简短的问题报告(stable@vger.kernel.org)并
+    抄送Linux回归邮件列表（regressions@lists.linux.dev）；如果你怀疑是由某
+    子系统引起的，请抄送其维护人员和子系统邮件列表。大致描述问题，并解释如
+    何复现。讲清楚首个出现问题的版本和最后一个工作正常的版本。然后等待进一
+    步的指示。*
 
 当报告在稳定版或长期支持内核线内发生的回归（例如在从5.10.4更新到5.10.5时），
-一份简短的报告足以快速报告问题。因此只需要粗略的描述。
+一份简短的报告足以快速报告问题。因此只需向稳定版和回归邮件列表发送粗略的描述；
+不过如果你怀疑某子系统导致此问题的话，请一并抄送其维护人员和子系统邮件列表，
+这会加快进程。
 
-但是请注意，如果您能够指明引入问题的确切版本，这将对开发人员有很大帮助。因此
+请注意，如果您能够指明引入问题的确切版本，这将对开发人员有很大帮助。因此
 如果有时间的话，请尝试使用普通内核找到该版本。让我们假设发行版发布Linux内核
 5.10.5到5.10.8的更新时发生了故障。那么按照上面的指示，去检查该版本线中的最新
 内核，比如5.10.9。如果问题出现，请尝试普通5.10.5，以确保供应商应用的补丁不会
@@ -1191,6 +1207,8 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
 报告，因为它允许精确地定位导致问题的确切更改（然后很容易被恢复以快速修复问题）。
 因此如果时间允许，考虑立即进行适当的二分。有关如何详细信息，请参阅“对回归的
 特别关照”部分和文档“Documentation/translations/zh_CN/admin-guide/bug-bisect.rst”。
+如果成功二分的话，请将“罪魁祸首”的作者添加到收件人中；同时抄送所有在
+signed-off-by链中的人，您可以在提交消息的末尾找到。
 
 
 “报告仅在旧内核版本线中发生的问题”的参考
-- 
2.20.1

