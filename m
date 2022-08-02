Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C545875C7
	for <lists+linux-doc@lfdr.de>; Tue,  2 Aug 2022 05:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbiHBDEJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Aug 2022 23:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235507AbiHBDDy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 23:03:54 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DC519281
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 20:03:48 -0700 (PDT)
Date:   Tue, 2 Aug 2022 11:03:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1659409426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2a/n2joeK65mL+wdbPn23Kl8ydkg3s8dNQWleobCAG8=;
        b=IJhifhT98ddrDuGLZZQbwNDCMnnCcSbt7ZuGWiIfufgtDjMAX0cziayJO22I652VpVWmVS
        u8Da7EOg/k/b0SWsG0ZwepQERT2tGyDIL4k4jxL6RvdIBu4JaaLADuVPbHqIEU3uBG2nob
        yr9swb9/Z3EnzmthT3aSarOIZU8Ubhw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Li Yang <leoyang.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: [PATCH 2/2] docs/zh_CN: Update zh_CN/process/submitting-patches.rst
 to 5.19
Message-ID: <717baee07920d3cecf09197a10c973dd46089fcb.1659406843.git.bobwxc@email.cn>
References: <cover.1659406843.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1659406843.git.bobwxc@email.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu XiangCheng <bobwxc@email.cn>

* update to commit 9db370de2780 ("docs: process: remove outdated
  submitting-drivers.rst")
* clean and reconstruct the whole translation

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/process/submitting-patches.rst      | 712 +++++++++---------
 1 file changed, 355 insertions(+), 357 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/submitting-patches.rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
index ebb7f37575c1..26565abcbd8d 100644
--- a/Documentation/translations/zh_CN/process/submitting-patches.rst
+++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
@@ -1,142 +1,90 @@
-.. _cn_submittingpatches:
+.. SPDX-License-Identifier: GPL-2.0-or-later
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+:Original: Documentation/process/submitting-patches.rst
 
-译者::
+:译者:
+ - 钟宇 TripleX Chung <xxx.phy@gmail.com>
+ - 时奎亮 Alex Shi <alexs@kernel.org>
+ - 吴想成 Wu XiangCheng <bobwxc@email.cn>
 
-        中文版维护者： 钟宇 TripleX Chung <xxx.phy@gmail.com>
-        中文版翻译者： 钟宇 TripleX Chung <xxx.phy@gmail.com>
-                       时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-        中文版校译者： 李阳 Li Yang <leoyang.li@nxp.com>
-                       王聪 Wang Cong <xiyou.wangcong@gmail.com>
+:校译:
+ - 李阳 Li Yang <leoyang.li@nxp.com>
+ - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
 
 
-如何让你的改动进入内核
-======================
+提交补丁：如何让你的改动进入内核
+================================
 
 对于想要将改动提交到 Linux 内核的个人或者公司来说，如果不熟悉“规矩”，
-提交的流程会让人畏惧。本文档收集了一系列建议，这些建议可以大大的提高你
+提交的流程会让人畏惧。本文档包含了一系列建议，可以大大提高你
 的改动被接受的机会.
 
-以下文档含有大量简洁的建议， 具体请见：
-:ref:`Documentation/process <development_process_main>`
-同样，:ref:`Documentation/translations/zh_CN/process/submit-checklist.rst <cn_submitchecklist>`
-给出在提交代码前需要检查的项目的列表。
+本文档以较为简洁的行文给出了大量建议。关于内核开发流程如何进行的详细信息，
+参见： Documentation/translations/zh_CN/process/development-process.rst 。
+Documentation/translations/zh_CN/process/submit-checklist.rst 给出了一系列
+提交补丁之前要检查的事项。设备树相关的补丁，请参阅
+Documentation/devicetree/bindings/submitting-patches.rst 。
 
-其中许多步骤描述了Git版本控制系统的默认行为；如果您使用Git来准备补丁，
-您将发现它为您完成的大部分机械工作，尽管您仍然需要准备和记录一组合理的
-补丁。一般来说，使用git将使您作为内核开发人员的生活更轻松。
+本文档假设您正在使用 ``git`` 准备你的补丁。如果您不熟悉 ``git`` ，最好学习
+如何使用它，这将使您作为内核开发人员的生活变得更加轻松。
 
+部分子系统和维护人员的树有一些关于其工作流程和要求的额外信息，请参阅
+Documentation/process/maintainer-handbooks.rst 。
 
-0) 获取当前源码树
------------------
+获取当前源码树
+--------------
 
-如果您没有一个可以使用当前内核源代码的存储库，请使用git获取一个。您将要
-从主线存储库开始，它可以通过以下方式获取::
+如果您手头没有当前内核源代码的存储库，请使用 ``git`` 获取一份。您需要先获取
+主线存储库，它可以通过以下命令拉取::
 
-        git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
+    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 
-但是，请注意，您可能不希望直接针对主线树进行开发。大多数子系统维护人员运
+但是，请注意，您可能不想直接针对主线树进行开发。大多数子系统维护人员运
 行自己的树，并希望看到针对这些树准备的补丁。请参见MAINTAINERS文件中子系
-统的 **T:** 项以查找该树，或者简单地询问维护者该树是否未在其中列出。
+统的 **T:** 项以查找该树，或者直接询问维护者该树是否未在其中列出。
 
-仍然可以通过tarballs下载内核版本（如下一节所述），但这是进行内核开发的
-一种困难的方式。
+.. _zh_describe_changes:
 
-1) "diff -up"
--------------
-
-使用 "diff -up" 或者 "diff -uprN" 来创建补丁。
-
-所有内核的改动，都是以补丁的形式呈现的，补丁由 diff(1) 生成。创建补丁的
-时候，要确认它是以 "unified diff" 格式创建的，这种格式由 diff(1) 的 '-u'
-参数生成。而且，请使用 '-p' 参数，那样会显示每个改动所在的C函数，使得
-产生的补丁容易读得多。补丁应该基于内核源代码树的根目录，而不是里边的任
-何子目录。
-
-为一个单独的文件创建补丁，一般来说这样做就够了::
-
-        SRCTREE=linux
-        MYFILE=drivers/net/mydriver.c
-
-        cd $SRCTREE
-        cp $MYFILE $MYFILE.orig
-        vi $MYFILE      # make your change
-        cd ..
-        diff -up $SRCTREE/$MYFILE{.orig,} > /tmp/patch
-
-为多个文件创建补丁，你可以解开一个没有修改过的内核源代码树，然后和你自
-己的代码树之间做 diff 。例如::
-
-        MYSRC=/devel/linux
-
-        tar xvfz linux-3.19.tar.gz
-        mv linux-3.19 linux-3.19-vanilla
-        diff -uprN -X linux-3.19-vanilla/Documentation/dontdiff \
-                linux-3.19-vanilla $MYSRC > /tmp/patch
-
-"dontdiff" 是内核在编译的时候产生的文件的列表，列表中的文件在 diff(1)
-产生的补丁里会被跳过。
-
-确定你的补丁里没有包含任何不属于这次补丁提交的额外文件。记得在用diff(1)
-生成补丁之后，审阅一次补丁，以确保准确。
-
-如果你的改动很散乱，你应该研究一下如何将补丁分割成独立的部分，将改动分
-割成一系列合乎逻辑的步骤。这样更容易让其他内核开发者审核，如果你想你的
-补丁被接受，这是很重要的。请参阅：
-:ref:`cn_split_changes`
-
-如果你用 ``git`` , ``git rebase -i`` 可以帮助你这一点。如果你不用 ``git``,
-``quilt`` <https://savannah.nongnu.org/projects/quilt> 另外一个流行的选择。
-
-.. _cn_describe_changes:
-
-2) 描述你的改动
----------------
+描述你的改动
+------------
 
 描述你的问题。无论您的补丁是一行错误修复还是5000行新功能，都必须有一个潜在
-的问题激励您完成这项工作。让审稿人相信有一个问题值得解决，让他们读完第一段
-是有意义的。
+的问题激励您完成这项工作。说服审阅者相信有一个问题值得解决，让他们读完第一段
+后就能明白这一点。
 
 描述用户可见的影响。直接崩溃和锁定是相当有说服力的，但并不是所有的错误都那么
-明目张胆。即使在代码审查期间发现了这个问题，也要描述一下您认为它可能对用户产
+明目张胆。即使在代码审阅期间发现了这个问题，也要描述一下您认为它可能对用户产
 生的影响。请记住，大多数Linux安装运行的内核来自二级稳定树或特定于供应商/产品
 的树，只从上游精选特定的补丁，因此请包含任何可以帮助您将更改定位到下游的内容：
 触发的场景、DMESG的摘录、崩溃描述、性能回归、延迟尖峰、锁定等。
 
-量化优化和权衡。如果您声称在性能、内存消耗、堆栈占用空间或二进制大小方面有所
-改进，请包括支持它们的数字。但也要描述不明显的成本。优化通常不是免费的，而是
-在CPU、内存和可读性之间进行权衡；或者，探索性的工作，在不同的工作负载之间进
+质量优化和权衡。如果您声称在性能、内存消耗、堆栈占用空间或二进制大小方面有所
+改进，请包括支持它们的数据。但也要描述不明显的成本。优化通常不是零成本的，而是
+在CPU、内存和可读性之间进行权衡；或者，做探索性的工作，在不同的工作负载之间进
 行权衡。请描述优化的预期缺点，以便审阅者可以权衡成本和收益。
 
-一旦问题建立起来，就要详细地描述一下您实际在做什么。对于审阅者来说，用简单的
-英语描述代码的变化是很重要的，以验证代码的行为是否符合您的意愿。
+提出问题之后，就要详细地描述一下您实际在做的技术细节。对于审阅者来说，用简练的
+英语描述代码的变化是很重要的，以验证代码的行为是否符合您的意图。
 
-如果您将补丁描述写在一个表单中，这个表单可以很容易地作为“提交日志”放入Linux
-的源代码管理系统git中，那么维护人员将非常感谢您。见 :ref:`cn_explicit_in_reply_to`.
+如果您将补丁描述写成“标准格式”，可以很容易地作为“提交日志”放入Linux的源代
+码管理系统 ``git`` 中，那么维护人员将非常感谢您。
+参见 :ref:`zh_the_canonical_patch_format` 。
 
 每个补丁只解决一个问题。如果你的描述开始变长，这就表明你可能需要拆分你的补丁。
-请见 :ref:`cn_split_changes`
+请见 :ref:`zh_split_changes` 。
 
-提交或重新提交修补程序或修补程序系列时，请包括完整的修补程序说明和理由。不要
+提交或重新提交补丁或补丁系列时，请包括完整的补丁说明和理由。不要
 只说这是补丁（系列）的第几版。不要期望子系统维护人员引用更早的补丁版本或引用
 URL来查找补丁描述并将其放入补丁中。也就是说，补丁（系列）及其描述应该是独立的。
-这对维护人员和审查人员都有好处。一些评审者可能甚至没有收到补丁的早期版本。
+这对维护人员和审阅者都有好处。一些审阅者可能甚至没有收到补丁的早期版本。
 
-描述你在命令语气中的变化，例如“make xyzzy do frotz”而不是“[This patch]make
+用祈使句描述你的变更，例如“make xyzzy do frotz”而不是“[This patch]make
 xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令代码库改变
 它的行为一样。
 
-如果修补程序修复了一个记录的bug条目，请按编号和URL引用该bug条目。如果补丁来
-自邮件列表讨论，请给出邮件列表存档的URL；使用带有 ``Message-ID`` 的
-https://lore.kernel.org/ 重定向，以确保链接不会过时。
-
-但是，在没有外部资源的情况下，尽量让你的解释可理解。除了提供邮件列表存档或
-bug的URL之外，还要总结需要提交补丁的相关讨论要点。
-
-如果您想要引用一个特定的提交，不要只引用提交的 SHA-1 ID。还请包括提交的一行
+如果您想要引用一个特定的提交，不要只引用提交的SHA-1 ID。还请包括提交的一行
 摘要，以便于审阅者了解它是关于什么的。例如::
 
         Commit e21d2170f36602ae2708 ("video: remove unnecessary
@@ -144,82 +92,104 @@ bug的URL之外，还要总结需要提交补丁的相关讨论要点。
         platform_set_drvdata(), but left the variable "dev" unused,
         delete it.
 
-您还应该确保至少使用前12位 SHA-1 ID. 内核存储库包含*许多*对象，使与较短的ID
+您还应该确保至少使用前12位SHA-1 ID。内核存储库包含 *许多* 对象，使较短的ID
 发生冲突的可能性很大。记住，即使现在不会与您的六个字符ID发生冲突，这种情况
-可能五年后改变。
+也可能在五年后改变。
+
+如果该变更的相关讨论或背景信息可以在网上查阅，请加上“Link:”标签指向它。例如
+你的补丁修复了一个缺陷，需要添加一个带有URL的标签指向邮件列表存档或缺陷跟踪器
+的相关报告；如果该补丁是由一些早先邮件列表讨论或网络上的记录引起的，请指向它。
 
-如果修补程序修复了特定提交中的错误，例如，使用 ``git bisct`` ，请使用带有前
-12个字符SHA-1 ID 的"Fixes:"标记和单行摘要。为了简化不要将标记拆分为多个，
-行、标记不受分析脚本“75列换行”规则的限制。例如::
+当链接到邮件列表存档是，请首选lore.kernel.org邮件存档服务。用邮件中的
+``Message-ID`` 头（去掉尖括号）可以创建链接URL。例如::
 
-        Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
+    Link: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
 
-下列 ``git config`` 设置可以添加让 ``git log``, ``git show`` 漂亮的显示格式::
+请检查该链接以确保可用且指向正确的邮件。
+
+不过，在没有外部资源的情况下，也要尽量让你的解释可理解。除了提供邮件列表存档或
+缺陷的URL之外，还要需要总结该补丁的相关讨论要点。
+
+如果补丁修复了特定提交中的错误，例如使用 ``git bisct`` 发现了一个问题，请使用
+带有前12个字符SHA-1 ID的“Fixes:”标签和单行摘要。为了简化解析脚本，不要将该
+标签拆分为多行，标签不受“75列换行”规则的限制。例如::
+
+  Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
+
+下列 ``git config`` 设置可以让 ``git log``, ``git show`` 增加上述风格的显示格式::
 
 	[core]
 		abbrev = 12
 	[pretty]
 		fixes = Fixes: %h (\"%s\")
 
-.. _cn_split_changes:
+使用示例::
 
-3) 拆分你的改动
----------------
+	$ git log -1 --pretty=fixes 54a4f0239f2e
+	Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
 
-将每个逻辑更改分隔成一个单独的补丁。
+.. _zh_split_changes:
+
+拆分你的改动
+------------
+
+将每个 **逻辑更改** 拆分成一个单独的补丁。
 
 例如，如果你的改动里同时有bug修正和性能优化，那么把这些改动拆分到两个或
-者更多的补丁文件中。如果你的改动包含对API的修改，并且修改了驱动程序来适
-应这些新的API，那么把这些修改分成两个补丁。
+者更多的补丁文件中。如果你的改动包含对API的修改，并且增加了一个使用该新API
+的驱动，那么把这些修改分成两个补丁。
 
 另一方面，如果你将一个单独的改动做成多个补丁文件，那么将它们合并成一个
 单独的补丁文件。这样一个逻辑上单独的改动只被包含在一个补丁文件里。
 
-如果有一个补丁依赖另外一个补丁来完成它的改动，那没问题。简单的在你的补
-丁描述里指出“这个补丁依赖某补丁”就好了。
+需要记住的一点是，每个补丁的更改都应易于理解，以便审阅者验证。每个补丁都应该
+对其价值进行阐述。
 
-在将您的更改划分为一系列补丁时，要特别注意确保内核在系列中的每个补丁之后
-都能正常构建和运行。使用 ``git bisect`` 来追踪问题的开发者可能会在任何时
-候分割你的补丁系列；如果你在中间引入错误，他们不会感谢你。
+如果有一个补丁依赖另外一个补丁来完成它的改动，那没问题。直接在你的补
+丁描述里指出 **“这个补丁依赖某补丁”** 就好了。
 
-如果你不能将补丁浓缩成更少的文件，那么每次大约发送出15个，然后等待审查
+在将您的更改划分为一系列补丁时，要特别注意确保内核在应用系列中的每个补丁之后
+都能正常构建和运行。使用 ``git bisect`` 来追踪问题的开发者可能会在任何地方分
+割你的补丁系列；如果你在中间引入错误，他们不会感谢你。
+
+如果你不能将补丁系列浓缩得更小，那么每次大约发送出15个补丁，然后等待审阅
 和集成。
 
-4) 检查你的更改风格
--------------------
+检查你的更改风格
+----------------
 
-检查您的补丁是否存在基本样式冲突，详细信息可在
-:ref:`Documentation/translations/zh_CN/process/coding-style.rst <cn_codingstyle>`
-中找到。如果不这样做，只会浪费审稿人的时间，并且会导致你的补丁被拒绝，甚至
+检查您的补丁是否违反了基本样式规定，详细信息参见
+Documentation/translations/zh_CN/process/coding-style.rst
+中找到。如果不这样做，只会浪费审阅者的时间，并且会导致你的补丁被拒绝，甚至
 可能没有被阅读。
 
 一个重要的例外是在将代码从一个文件移动到另一个文件时——在这种情况下，您不应
 该在移动代码的同一个补丁中修改移动的代码。这清楚地描述了移动代码和您的更改
-的行为。这大大有助于审查实际差异，并允许工具更好地跟踪代码本身的历史。
+的行为。这大大有助于审阅实际差异，并允许工具更好地跟踪代码本身的历史。
 
 在提交之前，使用补丁样式检查程序检查补丁（scripts/check patch.pl）。不过，
 请注意，样式检查程序应该被视为一个指南，而不是作为人类判断的替代品。如果您
-的代码看起来更好，但有违规行为，那么最好不要使用它。
+的代码看起来更好，但有违规行为，那么最好别管它。
 
 检查者报告三个级别：
 
  - ERROR：很可能出错的事情
- - WARNING：需要仔细审查的事项
+ - WARNING：需要仔细审阅的事项
  - CHECK：需要思考的事情
 
 您应该能够判断您的补丁中存在的所有违规行为。
 
-5) 选择补丁收件人
------------------
+选择补丁收件人
+--------------
 
-您应该总是在任何补丁上复制相应的子系统维护人员，以获得他们维护的代码；查看
+您应该总是知会任何补丁相应代码的子系统维护人员；查看
 维护人员文件和源代码修订历史记录，以了解这些维护人员是谁。脚本
-scripts/get_Maintainer.pl在这个步骤中非常有用。如果您找不到正在工作的子系统
+scripts/get_maintainer.pl在这个步骤中非常有用。如果您找不到正在工作的子系统
 的维护人员，那么Andrew Morton（akpm@linux-foundation.org）将充当最后的维护
 人员。
 
-您通常还应该选择至少一个邮件列表来接收补丁集的。linux-kernel@vger.kernel.org
-作为最后一个解决办法的列表，但是这个列表上的体积已经引起了许多开发人员的拒绝。
+您通常还应该选择至少一个邮件列表来接收补丁集的副本。linux-kernel@vger.kernel.org
+是所有补丁的默认列表，但是这个列表的流量已经导致了许多开发人员不再看它。
 在MAINTAINERS文件中查找子系统特定的列表；您的补丁可能会在那里得到更多的关注。
 不过，请不要发送垃圾邮件到无关的列表。
 
@@ -229,189 +199,170 @@ http://vger.kernel.org/vger-lists.html 上找到它们的列表。不过，也
 
 不要一次发送超过15个补丁到vger邮件列表！！！！
 
-Linus Torvalds 是决定改动能否进入 Linux 内核的最终裁决者。他的 e-mail
-地址是 <torvalds@linux-foundation.org> 。他收到的 e-mail 很多，所以一般
-的说，最好别给他发 e-mail。
+Linus Torvalds是决定改动能否进入 Linux 内核的最终裁决者。他的邮件地址是
+torvalds@linux-foundation.org 。他收到的邮件很多，所以一般来说最好 **别**
+给他发邮件。
 
-如果您有修复可利用安全漏洞的补丁，请将该补丁发送到 security@kernel.org。对于
-严重的bug，可以考虑短期暂停以允许分销商向用户发布补丁；在这种情况下，显然不应
-将补丁发送到任何公共列表。
+如果您有修复可利用安全漏洞的补丁，请将该补丁发送到 security@kernel.org 。对于
+严重的bug，可以考虑短期禁令以允许分销商（有时间）向用户发布补丁；在这种情况下，
+显然不应将补丁发送到任何公共列表。
+参见 Documentation/translations/zh_CN/admin-guide/security-bugs.rst 。
 
-修复已发布内核中严重错误的补丁程序应该指向稳定版维护人员，方法是放这样的一行::
+修复已发布内核中严重错误的补丁程序应该抄送给稳定版维护人员，方法是把以下列行
+放进补丁的签准区（注意，不是电子邮件收件人）::
 
-        Cc: stable@vger.kernel.org
+  Cc: stable@vger.kernel.org
 
-进入补丁的签准区（注意，不是电子邮件收件人）。除了这个文件之外，您还应该阅读
-:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
+除了本文件之外，您还应该阅读
+Documentation/translations/zh_CN/process/stable-kernel-rules.rst 。
 
-但是，请注意，一些子系统维护人员希望得出他们自己的结论，即哪些补丁应该被放到
-稳定的树上。尤其是网络维护人员，不希望看到单个开发人员在补丁中添加像上面这样
-的行。
-
-如果更改影响到用户和内核接口，请向手册页维护人员（如维护人员文件中所列）发送
+如果更改影响到用户侧内核接口，请向手册页维护人员（如维护人员文件中所列）发送
 手册页补丁，或至少发送更改通知，以便一些信息进入手册页。还应将用户空间API
-更改复制到 linux-api@vger.kernel.org。
+更改抄送到 linux-api@vger.kernel.org 。
 
 
-6) 没有 MIME 编码，没有链接，没有压缩，没有附件，只有纯文本
------------------------------------------------------------
+不要MIME编码，不要链接，不要压缩，不要附件，只要纯文本
+------------------------------------------------------
 
 Linus 和其他的内核开发者需要阅读和评论你提交的改动。对于内核开发者来说
-，可以“引用”你的改动很重要，使用一般的 e-mail 工具，他们就可以在你的
+，可以“引用”你的改动很重要，使用一般的邮件工具，他们就可以在你的
 代码的任何位置添加评论。
 
-因为这个原因，所有的提交的补丁都是 e-mail 中“内嵌”的。
+因为这个原因，所有的提交的补丁都是邮件中“内嵌”的。最简单（和推荐）的方法就
+是使用 ``git send-email`` 。https://git-send-email.io 有 ``git send-email``
+的交互式教程。
+
+如果你选择不用 ``git send-email`` ：
 
 .. warning::
-   如果你使用剪切-粘贴你的补丁，小心你的编辑器的自动换行功能破坏你的补丁
 
-不要将补丁作为 MIME 编码的附件，不管是否压缩。很多流行的 e-mail 软件不
-是任何时候都将 MIME 编码的附件当作纯文本发送的，这会使得别人无法在你的
-代码中加评论。另外，MIME 编码的附件会让 Linus 多花一点时间来处理，这就
-降低了你的改动被接受的可能性。
+  如果你使用剪切-粘贴你的补丁，小心你的编辑器的自动换行功能破坏你的补丁
 
-例外：如果你的邮递员弄坏了补丁，那么有人可能会要求你使用mime重新发送补丁
+不要将补丁作为MIME编码的附件，不管是否压缩。很多流行的邮件软件不
+是任何时候都将MIME编码的附件当作纯文本发送的，这会使得别人无法在你的
+代码中加评论。另外，MIME编码的附件会让Linus多花一点时间来处理，这就
+降低了你的改动被接受的可能性。
 
-请参阅 :ref:`Documentation/translations/zh_CN/process/email-clients.rst <cn_email_clients>`
-以获取有关配置电子邮件客户端以使其不受影响地发送修补程序的提示。
+例外：如果你的邮路损坏了补丁，那么有人可能会要求你使用MIME重新发送补丁。
 
-7) e-mail 的大小
-----------------
+请参阅 Documentation/translations/zh_CN/process/email-clients.rst
+以获取有关配置电子邮件客户端以使其不受影响地发送补丁的提示。
 
-大的改动对邮件列表不合适，对某些维护者也不合适。如果你的补丁，在不压缩
-的情况下，超过了300kB，那么你最好将补丁放在一个能通过 internet 访问的服
-务器上，然后用指向你的补丁的 URL 替代。但是请注意，如果您的补丁超过了
-300kb，那么它几乎肯定需要被破坏。
+回复审阅意见
+------------
 
-8）回复评审意见
----------------
+你的补丁几乎肯定会得到审阅者对补丁改进方法的评论（以回复邮件的形式）。您必须
+对这些评论作出回应；让补丁被忽略的一个好办法就是忽略审阅者的意见。直接回复邮
+件来回应意见即可。不会导致代码更改的意见或问题几乎肯定会带来注释或变更日志的
+改变，以便下一个审阅者更好地了解正在发生的事情。
 
-你的补丁几乎肯定会得到评审者对补丁改进方法的评论。您必须对这些评论作出
-回应；让补丁被忽略的一个好办法就是忽略审阅者的意见。不会导致代码更改的
-意见或问题几乎肯定会带来注释或变更日志的改变，以便下一个评审者更好地了解
-正在发生的事情。
+一定要告诉审阅者你在做什么改变，并感谢他们的时间。代码审阅是一个累人且耗时的
+过程，审阅者有时会变得暴躁。即使在这种情况下，也要礼貌地回应并解决他们指出的
+问题。当发送下一版时，在封面邮件或独立补丁里加上 ``patch changelog`` 说明与
+前一版本的不同之处（参见 :ref:`zh_the_canonical_patch_format` ）。
 
-一定要告诉审稿人你在做什么改变，并感谢他们的时间。代码审查是一个累人且
-耗时的过程，审查人员有时会变得暴躁。即使在这种情况下，也要礼貌地回应并
-解决他们指出的问题。
+.. _zh_resend_reminders:
 
-9）不要泄气或不耐烦
--------------------
+不要泄气或不耐烦
+----------------
 
-提交更改后，请耐心等待。审阅者是忙碌的人，可能无法立即访问您的修补程序。
+提交更改后，请耐心等待。审阅者是大忙人，可能无法立即审阅您的补丁。
 
-曾几何时，补丁曾在没有评论的情况下消失在空白中，但开发过程比现在更加顺利。
+曾几何时，补丁曾在没收到评论的情况下消失在虚空中，但现在开发过程应该更加顺利了。
 您应该在一周左右的时间内收到评论；如果没有收到评论，请确保您已将补丁发送
-到正确的位置。在重新提交或联系审阅者之前至少等待一周-在诸如合并窗口之类的
+到正确的位置。在重新提交或联系审阅者之前至少等待一周——在诸如合并窗口之类的
 繁忙时间可能更长。
 
-10）主题中包含 PATCH
---------------------
+在等了几个星期后，用带RESEND的主题重发补丁也是可以的::
+
+   [PATCH Vx RESEND] sub/sys: Condensed patch summary
+
+当你发布补丁（系列）修改版的时候，不要加上“RESEND”——“RESEND”只适用于重
+新提交之前未经修改的补丁（系列）。
 
-由于到linus和linux内核的电子邮件流量很高，通常会在主题行前面加上[PATCH]
-前缀. 这使Linus和其他内核开发人员更容易将补丁与其他电子邮件讨论区分开。
+主题中包含 PATCH
+----------------
+
+由于到Linus和linux-kernel的电子邮件流量很高，通常会在主题行前面加上[PATCH]
+前缀。这使Linus和其他内核开发人员更容易将补丁与其他电子邮件讨论区分开。
+
+``git send-email`` 会自动为你加上。
 
-11）签署你的作品-开发者原始认证
--------------------------------
+签署你的作品——开发者来源认证
+------------------------------
 
-为了加强对谁做了何事的追踪，尤其是对那些透过好几层的维护者的补丁，我们
-建议在发送出去的补丁上加一个 “sign-off” 的过程。
+为了加强对谁做了何事的追踪，尤其是对那些透过好几层维护者才最终到达的补丁，我
+们在通过邮件发送的补丁上引入了“签署（sign-off）”流程。
 
-"sign-off" 是在补丁的注释的最后的简单的一行文字，认证你编写了它或者其他
+“签署”是在补丁注释最后的一行简单文字，认证你编写了它或者其他
 人有权力将它作为开放源代码的补丁传递。规则很简单：如果你能认证如下信息:
 
-开发者来源证书 1.1
+开发者来源认证 1.1
 ^^^^^^^^^^^^^^^^^^
 
 对于本项目的贡献，我认证如下信息：
 
-      （a）这些贡献是完全或者部分的由我创建，我有权利以文件中指出
+       (a) 这些贡献是完全或者部分的由我创建，我有权利以文件中指出
            的开放源代码许可证提交它；或者
-      （b）这些贡献基于以前的工作，据我所知，这些以前的工作受恰当的开放
-           源代码许可证保护，而且，根据许可证，我有权提交修改后的贡献，
+
+       (b) 这些贡献基于以前的工作，据我所知，这些以前的工作受恰当的开放
+           源代码许可证保护，而且，根据文件中指出的许可证，我有权提交修改后的贡献，
            无论是完全还是部分由我创造，这些贡献都使用同一个开放源代码许可证
-           （除非我被允许用其它的许可证），正如文件中指出的；或者
-      （c）这些贡献由认证（a），（b）或者（c）的人直接提供给我，而
+           （除非我被允许用其它的许可证）；或者
+
+       (c) 这些贡献由认证（a），（b）或者（c）的人直接提供给我，而
            且我没有修改它。
-      （d）我理解并同意这个项目和贡献是公开的，贡献的记录（包括我
-           一起提交的个人记录，包括 sign-off ）被永久维护并且可以和这个项目
+
+       (d) 我理解并同意这个项目和贡献是公开的，贡献的记录（包括我
+           一起提交的个人记录，包括sign-off）被永久维护并且可以和这个项目
            或者开放源代码的许可证同步地再发行。
 
 那么加入这样一行::
 
-       Signed-off-by: Random J Developer <random@developer.example.org>
-
-使用你的真名（抱歉，不能使用假名或者匿名。）
-
-有人在最后加上标签。现在这些东西会被忽略，但是你可以这样做，来标记公司
-内部的过程，或者只是指出关于 sign-off 的一些特殊细节。
-
-如果您是子系统或分支维护人员，有时需要稍微修改收到的补丁，以便合并它们，
-因为树和提交者中的代码不完全相同。如果你严格遵守规则（c），你应该要求提交者
-重新发布，但这完全是在浪费时间和精力。规则（b）允许您调整代码，但是更改一个
-提交者的代码并让他认可您的错误是非常不礼貌的。要解决此问题，建议在最后一个
-由签名行和您的行之间添加一行，指示更改的性质。虽然这并不是强制性的，但似乎
-在描述前加上您的邮件和/或姓名（全部用方括号括起来），这足以让人注意到您对最
-后一分钟的更改负有责任。例如::
+  Signed-off-by: Random J Developer <random@developer.example.org>
 
-	Signed-off-by: Random J Developer <random@developer.example.org>
-	[lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
-	Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
+使用你的真名（抱歉，不能使用假名或者匿名。）如果使用 ``git commit -s`` 的话
+将会自动完成。撤销也应当包含“Signed-off-by”， ``git revert -s`` 会帮你搞定。
 
-如果您维护一个稳定的分支机构，同时希望对作者进行致谢、跟踪更改、合并修复并
-保护提交者不受投诉，那么这种做法尤其有用。请注意，在任何情况下都不能更改作者
-的ID（From 头），因为它是出现在更改日志中的标识。
+有些人会在最后加上额外的标签。现在这些东西会被忽略，但是你可以这样做，来标记
+公司内部的过程，或者只是指出关于签署的一些特殊细节。
 
-对回合（back-porters）的特别说明：在提交消息的顶部（主题行之后）插入一个补丁
-的起源指示似乎是一种常见且有用的实践，以便于跟踪。例如，下面是我们在3.x稳定
-版本中看到的内容::
+作者签署之后的任何其他签署（Signed-off-by:'s）均来自处理和传递补丁的人员，但
+未参与其开发。签署链应当反映补丁传播到维护者并最终传播到Linus所经过的 **真实**
+路径，首个签署指明单个作者的主要作者身份。
 
-  Date:   Tue Oct 7 07:26:38 2014 -0400
+何时使用Acked-by:，CC:，和Co-Developed by:
+------------------------------------------
 
-    libata: Un-break ATA blacklist
+Singed-off-by: 标签表示签名者参与了补丁的开发，或者他/她在补丁的传递路径中。
 
-    commit 1c40279960bcd7d52dbdf1d466b20d24b99176c8 upstream.
+如果一个人没有直接参与补丁的准备或处理，但希望表示并记录他们对补丁的批准/赞成，
+那么他们可以要求在补丁的变更日志中添加一个Acked-by:。
 
-还有， 这里是一个旧版内核中的一个回合补丁::
+Acked-by: 通常由受影响代码的维护者使用，当该维护者既没有贡献也没有转发补丁时。
 
-    Date:   Tue May 13 22:12:27 2008 +0200
-
-        wireless, airo: waitbusy() won't delay
-
-        [backport of 2.6 commit b7acbdfbd1f277c1eb23f344f899cfa4cd0bf36a]
-
-12）何时使用Acked-by:，CC:，和Co-Developed by:
-----------------------------------------------
-
-Singed-off-by: 标记表示签名者参与了补丁的开发，或者他/她在补丁的传递路径中。
-
-如果一个人没有直接参与补丁的准备或处理，但希望表示并记录他们对补丁的批准，
-那么他们可以要求在补丁的变更日志中添加一个 Acked-by:
-
-Acked-by：通常由受影响代码的维护者使用，当该维护者既没有贡献也没有转发补丁时。
-
-Acked-by: 不像签字人那样正式。这是一个记录，确认人至少审查了补丁，并表示接受。
-因此，补丁合并有时会手动将Acker的“Yep，looks good to me”转换为 Acked-By：（但
+Acked-by: 不像签署那样正式。这是一个记录，确认人至少审阅了补丁，并表示接受。
+因此，补丁合并有时会手动将Acker的“Yep，looks good to me”转换为 Acked-By:（但
 请注意，通常最好要求一个明确的Ack）。
 
 Acked-by：不一定表示对整个补丁的确认。例如，如果一个补丁影响多个子系统，并且
-有一个：来自一个子系统维护者，那么这通常表示只确认影响维护者代码的部分。这里
-应该仔细判断。如有疑问，应参考邮件列表档案中的原始讨论。
+有一个来自某个子系统维护者的Acked-By:，那么这通常表示只确认影响维护者代码的部
+分。这里应该仔细判断。如有疑问，应参考邮件列表存档中的原始讨论。
 
-如果某人有机会对补丁进行评论，但没有提供此类评论，您可以选择在补丁中添加 ``Cc:``
-这是唯一一个标签，它可以在没有被它命名的人显式操作的情况下添加，但它应该表明
-这个人是在补丁上抄送的。讨论中包含了潜在利益相关方。
+如果某人本应有机会对补丁进行评论，但没有提供此类评论，您可以选择在补丁中添加
+``Cc:`` 这是唯一可以在没有被该人明确同意的情况下添加的标签——但它应该表明
+这个人是在补丁上抄送的。此标签记录了讨论中包含的潜在利益相关方。
 
 Co-developed-by: 声明补丁是由多个开发人员共同创建的；当几个人在一个补丁上工
-作时，它用于将属性赋予共同作者（除了 From: 所赋予的作者之外）。因为
-Co-developed-by: 表示作者身份，所以每个共同开发人：必须紧跟在相关合作作者的
-签名之后。标准的签核程序要求：标记的签核顺序应尽可能反映补丁的时间历史，而不
-管作者是通过 From ：还是由 Co-developed-by: 共同开发的。值得注意的是，最后一
-个签字人：必须始终是提交补丁的开发人员。
+作时，它用于给出共同作者（除了From:所给出的作者之外）。因为Co-developed-by:
+表示作者身份，所以每个Co-developed-by:必须紧跟在相关合作作者的签署之后。标准
+签署程序要求Singed-off-by:标签的顺序应尽可能反映补丁的时间历史，无论作者是通
+过From:还是Co-developed-by:表明。值得注意的是，最后一个Singed-off-by:必须是
+提交补丁的开发人员。
 
-注意，当作者也是电子邮件标题“发件人：”行中列出的人时，“From: ” 标记是可选的。
+注意，如果From:作者也是电子邮件标题的From:行中列出的人，则From:标签是可选的。
 
-作者提交的补丁程序示例::
+被From:作者提交的补丁示例::
 
 	<changelog>
 
@@ -421,7 +372,7 @@ Co-developed-by: 表示作者身份，所以每个共同开发人：必须紧跟
 	Signed-off-by: Second Co-Author <second@coauthor.example.org>
 	Signed-off-by: From Author <from@author.example.org>
 
-合作开发者提交的补丁示例::
+被合作开发者提交的补丁示例::
 
 	From: From Author <from@author.example.org>
 
@@ -434,76 +385,85 @@ Co-developed-by: 表示作者身份，所以每个共同开发人：必须紧跟
 	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
 
 
-13）使用报告人：、测试人：、审核人：、建议人：、修复人：
---------------------------------------------------------
+使用Reported-by:、Tested-by:、Reviewed-by:、Suggested-by:和Fixes:
+-----------------------------------------------------------------
 
 Reported-by: 给那些发现错误并报告错误的人致谢，它希望激励他们在将来再次帮助
-我们。请注意，如果bug是以私有方式报告的，那么在使用Reported-by标记之前，请
-先请求权限。
+我们。请注意，如果bug是以私有方式报告的，那么在使用Reported-by标签之前，请
+先请求许可。此标签是为Bug设计的；请不要将其用于感谢功能请求。
 
-Tested-by: 标记表示补丁已由指定的人（在某些环境中）成功测试。这个标签通知
-维护人员已经执行了一些测试，为将来的补丁提供了一种定位测试人员的方法，并确
-保测试人员的信誉。
+Tested-by: 标签表示补丁已由指定的人（在某些环境中）成功测试。这个标签通知
+维护人员已经执行了一些测试，为将来的补丁提供了一种定位测试人员的方法，并彰显测试人员的功劳。
 
-Reviewed-by：相反，根据审查人的声明，表明该补丁已被审查并被认为是可接受的：
+Reviewed-by：根据审阅者的监督声明，表明该补丁已被审阅并被认为是可接受的：
 
 
-审查人的监督声明
+审阅者的监督声明
 ^^^^^^^^^^^^^^^^
 
-通过提供我的 Reviewed-by，我声明：
+通过提供我的Reviewed-by:标签，我声明：
 
-        (a) 我已经对这个补丁进行了一次技术审查，以评估它是否适合被包含到
+        (a) 我已经对这个补丁进行了一次技术审阅，以评估它是否适合被包含到
             主线内核中。
 
         (b) 与补丁相关的任何问题、顾虑或问题都已反馈给提交者。我对提交者对
             我的评论的回应感到满意。
 
-        (c) 虽然这一提交可能会改进一些东西，但我相信，此时，（1）对内核
+        (c) 虽然这一提交可能仍可被改进，但我相信，此时，（1）对内核
             进行了有价值的修改，（2）没有包含争论中涉及的已知问题。
 
-        (d) 虽然我已经审查了补丁并认为它是健全的，但我不会（除非另有明确
-            说明）作出任何保证或保证它将在任何给定情况下实现其规定的目的
+        (d) 虽然我已经审阅了补丁并认为它是健全的，但我不会（除非另有明确
+            说明）作出任何保证或担保它会在任何给定情况下实现其规定的目的
             或正常运行。
 
-Reviewed-by 是一种观点声明，即补丁是对内核的适当修改，没有任何遗留的严重技术
-问题。任何感兴趣的审阅者（完成工作的人）都可以为一个补丁提供一个 Review-by
-标签。此标签用于向审阅者提供致谢，并通知维护者已在修补程序上完成的审阅程度。
-Reviewed-by: 当由已知了解主题区域并执行彻底检查的审阅者提供时，通常会增加
+Reviewed-by是一种观点声明，即补丁是对内核的适当修改，没有任何遗留的严重技术
+问题。任何感兴趣的审阅者（完成工作的人）都可以为一个补丁提供一个Reviewed-by
+标签。此标签用于向审阅者提供致谢，并通知维护者补丁的审阅进度。
+当Reviewed-by:标签由已知了解主题区域并执行彻底检查的审阅者提供时，通常会增加
 补丁进入内核的可能性。
 
+一旦从测试人员或审阅者的“Tested-by”和“Reviewed-by”标签出现在邮件列表中，
+作者应在发送下一个版本时将其添加到适用的补丁中。但是，如果补丁在以下版本中发
+生了实质性更改，这些标签可能不再适用，因此应该删除。通常，在补丁更改日志中
+（在 ``---`` 分隔符之后）应该提到删除某人的测试者或审阅者标签。
+
 Suggested-by: 表示补丁的想法是由指定的人提出的，并确保将此想法归功于指定的
 人。请注意，未经许可，不得添加此标签，特别是如果该想法未在公共论坛上发布。
-这就是说，如果我们勤快地致谢我们的创意者，他们很有希望在未来得到鼓舞，再次
+也就是说，如果我们勤快地致谢创意提供者，他们将受到鼓舞，很有希望在未来再次
 帮助我们。
 
-Fixes: 指示补丁在以前的提交中修复了一个问题。它可以很容易地确定错误的来源，
-这有助于检查错误修复。这个标记还帮助稳定内核团队确定应该接收修复的稳定内核
-版本。这是指示补丁修复的错误的首选方法。请参阅 :ref:`cn_describe_changes`
-描述您的更改以了解更多详细信息。
+Fixes: 指示补丁修复了之前提交的一个问题。它可以便于确定错误的来源，这有助于
+检查错误修复。这个标签还帮助稳定内核团队确定应该接收修复的稳定内核版本。这是
+指示补丁修复的错误的首选方法。请参阅 :ref:`zh_describe_changes` 了解更多信息。
 
-.. _cn_the_canonical_patch_format:
+.. note::
 
-12）标准补丁格式
-----------------
+  附加Fixes:标签不会改变稳定内核规则流程，也不改变所有稳定版补丁抄送
+  stable@vger.kernel.org的要求。有关更多信息，请阅读
+  Documentation/translations/zh_CN/process/stable-kernel-rules.rst 。
+
+.. _zh_the_canonical_patch_format:
+
+标准补丁格式
+------------
 
 本节描述如何格式化补丁本身。请注意，如果您的补丁存储在 ``Git`` 存储库中，则
-可以使用 ``git format-patch`` 进行正确的补丁格式设置。但是，这些工具无法创建
+可以使用 ``git format-patch`` 进行正确的补丁格式化。但是，这些工具无法创建
 必要的文本，因此请务必阅读下面的说明。
 
-标准的补丁，标题行是::
+标准的补丁标题行是::
 
     Subject: [PATCH 001/123] 子系统:一句话概述
 
-标准补丁的信体存在如下部分：
+标准补丁的信体包含如下部分：
 
-  - 一个 "from" 行指出补丁作者。后跟空行（仅当发送修补程序的人不是作者时才需要）。
+  - 一个 ``from`` 行指出补丁作者。后跟空行（仅当发送补丁的人不是作者时才需要）。
 
-  - 解释的正文，行以75列包装，这将被复制到永久变更日志来描述这个补丁。
+  - 说明文字，每行最长75列，这将被复制到永久变更日志来描述这个补丁。
 
   - 一个空行
 
-  - 上面描述的“Signed-off-by” 行，也将出现在更改日志中。
+  - 上述的 ``Signed-off-by:`` 行，也将出现在更改日志中。
 
   - 只包含 ``---`` 的标记线。
 
@@ -511,29 +471,29 @@ Fixes: 指示补丁在以前的提交中修复了一个问题。它可以很容
 
   - 实际补丁（ ``diff`` 输出）。
 
-标题行的格式，使得对标题行按字母序排序非常的容易 - 很多 e-mail 客户端都
-可以支持 - 因为序列号是用零填充的，所以按数字排序和按字母排序是一样的。
+标题行的格式，使得对标题行按字母序排序非常的容易——很多邮件客户端都
+可以支持——因为序列号是用零填充的，所以按数字排序和按字母排序是一样的。
 
-e-mail 标题中的“子系统”标识哪个内核子系统将被打补丁。
+邮件标题中的“子系统”标识哪个内核子系统将被打补丁。
 
-e-mail 标题中的“一句话概述”扼要的描述 e-mail 中的补丁。“一句话概述”
+邮件标题中的“一句话概述”扼要的描述邮件中的补丁。“一句话概述”
 不应该是一个文件名。对于一个补丁系列（“补丁系列”指一系列的多个相关补
 丁），不要对每个补丁都使用同样的“一句话概述”。
 
-记住 e-mail 的“一句话概述”会成为该补丁的全局唯一标识。它会蔓延到 git
+记住邮件的“一句话概述”会成为该补丁的全局唯一标识。它会进入 ``git``
 的改动记录里。然后“一句话概述”会被用在开发者的讨论里，用来指代这个补
-丁。用户将希望通过 google 来搜索"一句话概述"来找到那些讨论这个补丁的文
+丁。用户将希望通过搜索引擎搜索“一句话概述”来找到那些讨论这个补丁的文
 章。当人们在两三个月后使用诸如 ``gitk`` 或 ``git log --oneline`` 之类
 的工具查看数千个补丁时，也会很快看到它。
 
 出于这些原因，概述必须不超过70-75个字符，并且必须描述补丁的更改以及为
-什么需要补丁。既要简洁又要描述性很有挑战性，但写得好的概述应该这样做。
+什么需要补丁。既要简洁又要描述性很有挑战性，但写得好的概述应该这样。
 
 概述的前缀可以用方括号括起来：“Subject: [PATCH <tag>...] <概述>”。标记
 不被视为概述的一部分，而是描述应该如何处理补丁。如果补丁的多个版本已发
-送出来以响应评审（即“v1，v2，v3”）或“rfc”，以指示评审请求，那么通用标记
-可能包括版本描述符。如果一个补丁系列中有四个补丁，那么各个补丁可以这样
-编号：1/4、2/4、3/4、4/4。这可以确保开发人员了解补丁应用的顺序，并且他们
+送出来以响应评审（即“v1，v2，v3”）则必须包含版本号，或包含“RFC”以指示
+评审请求。如果一个补丁系列中有四个补丁，那么各个补丁可以这样编号：1/4、2/4、
+3/4、4/4。这可以确保开发人员了解补丁应用的顺序，且
 已经查看或应用了补丁系列中的所有补丁。
 
 一些标题的例子::
@@ -541,95 +501,134 @@ e-mail 标题中的“一句话概述”扼要的描述 e-mail 中的补丁。
     Subject: [patch 2/5] ext2: improve scalability of bitmap searching
     Subject: [PATCHv2 001/207] x86: fix eflags tracking
 
-"From" 行是信体里的最上面一行，具有如下格式：
+``From`` 行是信体里的最上面一行，具有如下格式::
+
         From: Patch Author <author@example.com>
 
-"From" 行指明在永久改动日志里，谁会被确认为作者。如果没有 "From" 行，那
-么邮件头里的 "From: " 行会被用来决定改动日志中的作者。
+``From`` 行指明在永久改动日志里，谁会被确认为作者。如果没有 ``From`` 行，那
+么邮件头里的 ``From:`` 行会被用来决定改动日志中的作者。
 
-说明的主题将会被提交到永久的源代码改动日志里，因此对那些早已经不记得和
-这个补丁相关的讨论细节的有能力的读者来说，是有意义的。包括补丁程序定位
-错误的（内核日志消息、OOPS消息等）症状，对于搜索提交日志以寻找适用补丁的人
-尤其有用。如果一个补丁修复了一个编译失败，那么可能不需要包含所有编译失败；
+说明文字将会被提交到永久的源代码改动日志里，因此应针对那些早已经不记得和这
+个补丁相关的讨论细节的读者。包括补丁处理的故障症状（内核日志消息、oops消息
+等），这对于可能正在搜索提交日志以查找适用补丁的人特别有用。文本应该写得如
+此详细，以便在数周、数月甚至数年后阅读时，能够为读者提供所需的细节信息，以
+掌握创建补丁的 **原因** 。
+
+如果一个补丁修复了一个编译失败，那么可能不需要包含 *所有* 编译失败；
 只要足够让搜索补丁的人能够找到它就行了。与概述一样，既要简洁又要描述性。
 
-"---" 标记行对于补丁处理工具要找到哪里是改动日志信息的结束，是不可缺少
+``---`` 标记行对于补丁处理工具要找到哪里是改动日志信息的结束，是不可缺少
 的。
 
-对于 "---" 标记之后的额外注解，一个好的用途就是用来写 diffstat，用来显
-示修改了什么文件和每个文件都增加和删除了多少行。diffstat 对于比较大的补
-丁特别有用。其余那些只是和时刻或者开发者相关的注解，不合适放到永久的改
-动日志里的，也应该放这里。
-使用 diffstat的选项 "-p 1 -w 70" 这样文件名就会从内核源代码树的目录开始
+对于 ``---`` 标记之后的额外注解，一个好的用途就是用来写 ``diffstat`` ，用来显
+示修改了什么文件和每个文件都增加和删除了多少行。 ``diffstat`` 对于比较大的补
+丁特别有用。
+使用 ``diffstat`` 的选项 ``-p 1 -w 70`` 这样文件名就会从内核源代码树的目录开始
 ，不会占用太宽的空间（很容易适合80列的宽度，也许会有一些缩进。）
+（ ``git`` 默认会生成合适的diffstat。）
+
+其余那些只适用于当时或者与维护者相关的注解，不合适放到永久的改动日志里的，也
+应该放这里。较好的例子就是 ``补丁更改记录`` ，记录了v1和v2版本补丁之间的差异。
+
+请将此信息放在将变更日志与补丁的其余部分分隔开的 ``---`` 行 **之后** 。版本
+信息不是提交到git树的变更日志的一部分。只是供审阅人员使用的附加信息。如果将
+其放置在提交标记上方，则需要手动交互才能将其删除。如果它位于分隔线以下，则在
+应用补丁时会自动剥离::
+
+  <commit message>
+  ...
+  Signed-off-by: Author <author@mail>
+  ---
+  V2 -> V3: Removed redundant helper function
+  V1 -> V2: Cleaned up coding style and addressed review comments
 
-在后面的参考资料中能看到适当的补丁格式的更多细节。
+  path/to/file | 5+++--
+  ...
 
-.. _cn_explicit_in_reply_to:
+在后面的参考资料中能看到正确补丁格式的更多细节。
 
-15) 明确回复邮件头(In-Reply-To)
--------------------------------
+.. _zh_backtraces:
 
-手动添加回复补丁的的标题头(In-Reply_To:) 是有帮助的（例如，使用 ``git send-email`` ）
-将补丁与以前的相关讨论关联起来，例如，将bug修复程序链接到电子邮件和bug报告。
+提交消息中的回溯（Backtraces）
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+回溯有助于记录导致问题的调用链。然而，并非所有回溯都有帮助。例如，早期引导调
+用链是独特而明显的。而逐字复制完整的dmesg输出则会增加时间戳、模块列表、寄存
+器和堆栈转储等分散注意力的信息。
+
+因此，最有用的回溯应该从转储中提取相关信息，以更容易集中在真实问题上。下面是
+一个剪裁良好的回溯示例::
+
+  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
+  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
+  Call Trace:
+  mba_wrmsr
+  update_domains
+  rdtgroup_mkdir
+
+.. _zh_explicit_in_reply_to:
+
+明确回复邮件头（In-Reply-To）
+-----------------------------
+
+手动添加回复补丁的的邮件头（In-Reply_To:）是有用的（例如，使用 ``git send-email`` ），
+可以将补丁与以前的相关讨论关联起来，例如，将bug补丁链接到电子邮件和bug报告。
 但是，对于多补丁系列，最好避免在回复时使用链接到该系列的旧版本。这样，
-补丁的多个版本就不会成为电子邮件客户端中无法管理的引用序列。如果链接有用，
+补丁的多个版本就不会成为电子邮件客户端中无法管理的引用树。如果链接有用，
 可以使用 https://lore.kernel.org/ 重定向器（例如，在封面电子邮件文本中）
 链接到补丁系列的早期版本。
 
-16) 发送git pull请求
---------------------
-
-如果您有一系列补丁，那么让维护人员通过git pull操作将它们直接拉入子系统存储
-库可能是最方便的。但是，请注意，从开发人员那里获取补丁比从邮件列表中获取补
-丁需要更高的信任度。因此，许多子系统维护人员不愿意接受请求，特别是来自新的
-未知开发人员的请求。如果有疑问，您可以在封面邮件中使用pull 请求作为补丁系列
-正常发布的一个选项，让维护人员可以选择使用其中之一。
-
-pull 请求的主题行中应该有[Git Pull]。请求本身应该在一行中包含存储库名称和
-感兴趣的分支；它应该看起来像::
+给出基础树信息
+--------------
 
-  Please pull from
+当其他开发人员收到您的补丁并开始审阅时，知道应该将您的工作放到代码树历史记录
+中的什么位置通常很有用。这对于自动化持续集成流水（CI）特别有用，这些流水线试
+图运行一系列测试，以便在维护人员开始审阅之前确定提交的质量。
 
-      git://jdelvare.pck.nerim.net/jdelvare-2.6 i2c-for-linus
+如果您使用 ``git format-patch`` 生成补丁，则可以通过 ``--base`` 标志在提交中
+自动包含基础树信息。使用此选项最简单、最方便的方法是配合主题分支::
 
-  to get these changes:
+    $ git checkout -t -b my-topical-branch master
+    Branch 'my-topical-branch' set up to track local branch 'master'.
+    Switched to a new branch 'my-topical-branch'
 
+    [perform your edits and commits]
 
-pull 请求还应该包含一条整体消息，说明请求中将包含什么，一个补丁本身的 ``Git shortlog``
-以及一个显示补丁系列整体效果的 ``diffstat`` 。当然，将所有这些信息收集在一起
-的最简单方法是让 ``git`` 使用 ``git request-pull`` 命令为您完成这些工作。
+    $ git format-patch --base=auto --cover-letter -o outgoing/ master
+    outgoing/0000-cover-letter.patch
+    outgoing/0001-First-Commit.patch
+    outgoing/...
 
-一些维护人员（包括Linus）希望看到来自已签名提交的请求；这增加了他们对你的
-请求信心。特别是，在没有签名标签的情况下，Linus 不会从像 Github 这样的公共
-托管站点拉请求。
+当你编辑 ``outgoing/0000-cover-letter.patch`` 时，您会注意到在它的最底部有一
+行 ``base-commit:`` 尾注，它为审阅者和CI工具提供了足够的信息以正确执行
+``git am`` 而不必担心冲突::
 
-创建此类签名的第一步是生成一个 GNRPG 密钥，并由一个或多个核心内核开发人员对
-其进行签名。这一步对新开发人员来说可能很困难，但没有办法绕过它。参加会议是
-找到可以签署您的密钥的开发人员的好方法。
+    $ git checkout -b patch-review [base-commit-id]
+    Switched to a new branch 'patch-review'
+    $ git am patches.mbox
+    Applying: First Commit
+    Applying: ...
 
-一旦您在Git 中准备了一个您希望有人拉的补丁系列，就用 ``git tag -s`` 创建一
-个签名标记。这将创建一个新标记，标识该系列中的最后一次提交，并包含用您的私
-钥创建的签名。您还可以将changelog样式的消息添加到标记中；这是一个描述拉请求
-整体效果的理想位置。
+有关此选项的更多信息，请参阅 ``man git-format-patch`` 。
 
-如果维护人员将要从中提取的树不是您正在使用的存储库，请不要忘记将已签名的标记
-显式推送到公共树。
+.. note::
 
-生成拉请求时，请使用已签名的标记作为目标。这样的命令可以实现::
+    ``--base`` 功能是在2.9.0版git中引入的。
 
-  git request-pull master git://my.public.tree/linux.git my-signed-tag
+如果您不使用git格式化补丁，仍然可以包含相同的 ``base-commit`` 尾注，以指示您
+的工作所基于的树的提交哈希。你应该在封面邮件或系列的第一个补丁中添加它，它应
+该放在 ``---`` 行的下面或所有其他内容之后，即只在你的电子邮件签名之前。
 
 参考文献
 --------
 
-Andrew Morton, "The perfect patch" (tpp).
+Andrew Morton，“完美的补丁”（tpp）
   <https://www.ozlabs.org/~akpm/stuff/tpp.txt>
 
-Jeff Garzik, "Linux kernel patch submission format".
+Jeff Garzik，“Linux内核补丁提交格式”
   <https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>
 
-Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
+Greg Kroah-Hartman，“如何惹恼内核子系统维护人员”
   <http://www.kroah.com/log/linux/maintainer.html>
 
   <http://www.kroah.com/log/linux/maintainer-02.html>
@@ -642,16 +641,15 @@ Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
 
   <http://www.kroah.com/log/linux/maintainer-06.html>
 
-NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
+不！！！别再发巨型补丁炸弹给linux-kernel@vger.kernel.org的人们了！
   <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
 
-Kernel Documentation/process/coding-style.rst:
-  :ref:`Documentation/translations/zh_CN/process/coding-style.rst <cn_codingstyle>`
+内核 Documentation/translations/zh_CN/process/coding-style.rst
 
-Linus Torvalds's mail on the canonical patch format:
+Linus Torvalds关于标准补丁格式的邮件
   <https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.org>
 
-Andi Kleen, "On submitting kernel patches"
-  Some strategies to get difficult or controversial changes in.
+Andi Kleen，“提交补丁之路”
+  一些帮助合入困难或有争议的变更的策略。
 
   http://halobates.de/on-submitting-patches.pdf
-- 
2.30.2


-- 
Wu XiangCheng
0x32684A40BCA7AEA7

