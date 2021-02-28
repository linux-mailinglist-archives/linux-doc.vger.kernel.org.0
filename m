Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB48932708E
	for <lists+linux-doc@lfdr.de>; Sun, 28 Feb 2021 06:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbhB1FjA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 28 Feb 2021 00:39:00 -0500
Received: from m32-153.88.com ([43.250.32.153]:27402 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229456AbhB1FjA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 28 Feb 2021 00:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=O94A7SlFqTdhDs3vNd+77ECcysdHwsYKVQROo
        kuzw20=; b=Z+07VgzTil2bUArR7RWi89UgYemyBv9E2GUalzjk0Q1Hz142SkmbX
        siWhTPBRcco4Ph/PsoF7JjL8Mokn2bifVzcl+3ncEbIaDrMhTf58UsKLfnLa2LKq
        uDahpZjk5NONOOoF3rjdNuUPLeBnr8hbwkoPR7BmOHp67YSd7NsGps=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnsyM9LDtgzy0OAA--.39600S2;
        Sun, 28 Feb 2021 13:38:06 +0800 (CST)
Date:   Sun, 28 Feb 2021 13:38:05 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/9] docs/zh_CN: Improve zh_CN/process/1.Intro.rst
Message-ID: <5903c825442fb03cd45b1bbaf3965850fc85b1da.1614488009.git.bobwxc@email.cn>
References: <cover.1614488009.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614488009.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAnsyM9LDtgzy0OAA--.39600S2
X-Coremail-Antispam: 1UD129KBjvAXoWfAw4rWr4kCw1rWF1rGF4fuFg_yoW8KF45uo
        WFy3WF9w4DAwsFqa4Ykw4DGr97WrnYyF43urs3JF13ur4DWr1Yy3Z5JrnrXF95Zr90k3W3
        tr93JFySvFy5A3W3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU537k0a2IF6FyUM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Un189U
        UUUU=
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve language and grammar of zh_CN/process/1.Intro.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/process/1.Intro.rst    | 155 +++++++++---------
 1 file changed, 82 insertions(+), 73 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/1.Intro.rst b/Documentation/translations/zh_CN/process/1.Intro.rst
index 10a15f3dc282..7d2ef7694267 100644
--- a/Documentation/translations/zh_CN/process/1.Intro.rst
+++ b/Documentation/translations/zh_CN/process/1.Intro.rst
@@ -1,161 +1,169 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: :ref:`Documentation/process/1.Intro.rst <development_process_intro>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+
+:Translator:
+
+ 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
+
+:校译:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
 
 .. _cn_development_process_intro:
 
-介绍
+引言
 ====
 
-执行摘要
+内容提要
 --------
 
-本节的其余部分涵盖了内核开发过程的范围，以及开发人员及其雇主在这方面可能遇
-到的各种挫折。内核代码应该合并到正式的（“主线”）内核中有很多原因，包括对用
+本节的其余部分涵盖了内核开发的过程，以及开发人员及其雇主在这方面可能遇到
+的各种问题。有很多原因使内核代码应被合并到正式的（“主线”）内核中，包括对用
 户的自动可用性、多种形式的社区支持以及影响内核开发方向的能力。提供给Linux
 内核的代码必须在与GPL兼容的许可证下可用。
 
 :ref:`cn_development_process` 介绍了开发过程、内核发布周期和合并窗口的机制。
-涵盖了补丁开发、审查和合并周期中的各个阶段。有一些关于工具和邮件列表的讨论。
-鼓励希望开始内核开发的开发人员作为初始练习跟踪并修复bug。
+涵盖了补丁开发、审查和合并周期中的各个阶段。还有一些关于工具和邮件列表的讨论？
+鼓励希望开始内核开发的开发人员跟踪并修复缺陷以作为初步练习。
 
 
-:ref:`cn_development_early_stage` 包括早期项目规划，重点是尽快让开发社区参与
+:ref:`cn_development_early_stage` 包括项目的早期规划，重点是尽快让开发社区
+参与进来。
 
-:ref:`cn_development_coding` 是关于编码过程的；讨论了其他开发人员遇到的几个
-陷阱。对补丁的一些要求已经涵盖，并且介绍了一些工具，这些工具有助于确保内核
+:ref:`cn_development_coding` 是关于编程过程的；介绍了其他开发人员遇到的几个
+陷阱。也涵盖了对补丁的一些要求，并且介绍了一些工具，这些工具有助于确保内核
 补丁是正确的。
 
-:ref:`cn_development_posting` 讨论发布补丁以供评审的过程。为了让开发社区
-认真对待，补丁必须正确格式化和描述，并且必须发送到正确的地方。遵循本节中的
-建议有助于确保为您的工作提供最好的接纳。
+:ref:`cn_development_posting` 描述发布补丁以供评审的过程。为了让开发社区能
+认真对待，补丁必须被正确格式化和描述，并且必须发送到正确的地方。遵循本节中的
+建议有助于确保您的工作能被较好地接纳。
 
-:ref:`cn_development_followthrough` 介绍了发布补丁之后发生的事情；该工作
-在这一点上还远远没有完成。与审阅者一起工作是开发过程中的一个重要部分；本节
+:ref:`cn_development_followthrough` 介绍了发布补丁之后发生的事情；工作
+在这时还远远没有完成。与审阅者一起工作是开发过程中的一个重要部分；本节
 提供了一些关于如何在这个重要阶段避免问题的提示。当补丁被合并到主线中时，
 开发人员要注意不要假定任务已经完成。
 
 :ref:`cn_development_advancedtopics` 介绍了两个“高级”主题：
 使用Git管理补丁和查看其他人发布的补丁。
 
-:ref:`cn_development_conclusion` 总结了有关内核开发的更多信息，附带有带有
-指向资源的链接.
+:ref:`cn_development_conclusion` 总结了有关内核开发的更多信息，附带有
+相关资源链接。
 
-这个文件是关于什么的
+这个文档是关于什么的
 --------------------
 
 Linux内核有超过800万行代码，每个版本的贡献者超过1000人，是现存最大、最活跃
 的免费软件项目之一。从1991年开始，这个内核已经发展成为一个最好的操作系统
-组件，运行在袖珍数字音乐播放器、台式PC、现存最大的超级计算机以及所有类型的
+组件，运行在袖珍数字音乐播放器、台式电脑、现存最大的超级计算机以及所有类型的
 系统上。它是一种适用于几乎任何情况的健壮、高效和可扩展的解决方案。
 
 随着Linux的发展，希望参与其开发的开发人员（和公司）的数量也在增加。硬件供应商
 希望确保Linux能够很好地支持他们的产品，使这些产品对Linux用户具有吸引力。嵌入
 式系统供应商使用Linux作为集成产品的组件，希望Linux能够尽可能地胜任手头的任务。
-分销商和其他基于Linux的软件供应商对Linux内核的功能、性能和可靠性有着明确的
-兴趣。最终用户也常常希望修改Linux，使之更好地满足他们的需求。
+分销商和其他基于Linux的软件供应商切实关心Linux内核的功能、性能和可靠性。
+最终用户也常常希望修改Linux，使之能更好地满足他们的需求。
 
 Linux最引人注目的特性之一是这些开发人员可以访问它；任何具备必要技能的人都可以
 改进Linux并影响其开发方向。专有产品不能提供这种开放性，这是自由软件的一个特点。
-但是，如果有什么不同的话，内核比大多数其他自由软件项目更开放。一个典型的三个月
+如果有什么不同的话，那就是内核比大多数其他自由软件项目更开放。一个典型的三个月
 内核开发周期可以涉及1000多个开发人员，他们为100多个不同的公司
-（或者根本没有公司）工作。
+（或者根本不隶属公司）工作。
 
-与内核开发社区合作并不是特别困难。但是，尽管如此，许多潜在的贡献者在尝试做
-内核工作时遇到了困难。内核社区已经发展了自己独特的操作方式，使其能够在每天
+与内核开发社区合作并不是特别困难。但尽管如此，仍有许多潜在的贡献者在尝试做
+内核工作时遇到了困难。内核社区已经发展出自己独特的操作方式，使其能够在每天
 都要更改数千行代码的环境中顺利运行（并生成高质量的产品）。因此，Linux内核开发
-过程与专有的开发方法有很大的不同也就不足为奇了。
+过程与专有的开发模式有很大的不同也就不足为奇了。
 
-对于新开发人员来说，内核的开发过程可能会让人感到奇怪和恐惧，但这个背后有充分的
-理由和坚实的经验。一个不了解内核社区的方式的开发人员（或者更糟的是，他们试图
-抛弃或规避内核社区的方式）会有一个令人沮丧的体验。开发社区, 在帮助那些试图学习
+对于新开发人员来说，内核的开发过程可能会让人感到奇怪和恐惧，但这背后有充分的
+理由和坚实的经验。一个不了解内核社区工作方式的开发人员（或者更糟的是，他们
+试图抛弃或规避之）会得到令人沮丧的体验。开发社区在帮助那些试图学习
 的人的同时，没有时间帮助那些不愿意倾听或不关心开发过程的人。
 
-希望阅读本文的人能够避免这种令人沮丧的经历。这里有很多材料，但阅读时所做的
+希望阅读本文的人能够避免这种令人沮丧的经历。这些材料很长，但阅读它们时所做的
 努力会在短时间内得到回报。开发社区总是需要能让内核变更好的开发人员；下面的
-文本应该帮助您或为您工作的人员加入我们的社区。
+文字应该帮助您或为您工作的人员加入我们的社区。
 
 致谢
 ----
 
-本文件由Jonathan Corbet撰写，corbet@lwn.net。以下人员的建议使之更为完善：
+本文档由Jonathan Corbet <corbet@lwn.net> 撰写。以下人员的建议使之更为完善：
 Johannes Berg, James Berry, Alex Chiang, Roland Dreier, Randy Dunlap,
 Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda McPherson,
-Andrew Morton, Andrew Price, Tsugikazu Shibata, 和 Jochen Voß.
+Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 
 这项工作得到了Linux基金会的支持，特别感谢Amanda McPherson，他看到了这项工作
-的价值并把它变成现实。
+的价值并将其变成现实。
 
 代码进入主线的重要性
 --------------------
 
 有些公司和开发人员偶尔会想，为什么他们要费心学习如何与内核社区合作，并将代码
 放入主线内核（“主线”是由Linus Torvalds维护的内核，Linux发行商将其用作基础）。
-在短期内，贡献代码看起来像是一种可以避免的开销；仅仅将代码分开并直接支持用户
+在短期内，贡献代码看起来像是一种可以避免的开销；维护独立代码并直接支持用户
 似乎更容易。事实上，保持代码独立（“树外”）是在经济上是错误的。
 
-作为说明树外代码成本的一种方法，下面是内核开发过程的一些相关方面；本文稍后将
-更详细地讨论其中的大部分内容。考虑：
+为了说明树外代码成本，下面给出内核开发过程的一些相关方面；本文稍后将
+更详细地讨论其中的大部分内容。请考虑：
 
 - 所有Linux用户都可以使用合并到主线内核中的代码。它将自动出现在所有启用它的
-  发行版上。不需要驱动程序磁盘、下载，也不需要为多个发行版的多个版本提供支持；
-  对于开发人员和用户来说，这一切都是可行的。并入主线解决了大量的分布和支持问题
+  发行版上。无需驱动程序磁盘、额外下载，也不需要为多个发行版的多个版本提供
+  支持；这一切将方便所有开发人员和用户。并入主线解决了大量的分发和支持问题。
 
-- 当内核开发人员努力维护一个稳定的用户空间接口时，内部内核API处于不断变化之中.
-  缺乏一个稳定的内部接口是一个深思熟虑的设计决策；它允许在任何时候进行基本的改
-  进，并产生更高质量的代码。但该策略的一个结果是，如果要使用新的内核，任何树外
-  代码都需要持续的维护。维护树外代码需要大量的工作才能使代码保持工作状态。
+- 当内核开发人员努力维护一个稳定的用户空间接口时，内核内部API处于不断变化之中。
+  不维持稳定的内部接口是一个慎重的设计决策；它允许在任何时候进行基本的改
+  进，并产出更高质量的代码。但该策略导致结果是，若要使用新的内核，任何树外
+  代码都需要持续的维护。维护树外代码会需要大量的工作才能使代码保持正常运行。
 
-  相反，位于主线中的代码不需要这样做，因为一个简单的规则要求进行API更改的任何
+  相反，位于主线中的代码不需要这样做，因为基本规则要求进行API更改的任何
   开发人员也必须修复由于该更改而破坏的任何代码。因此，合并到主线中的代码大大
   降低了维护成本。
 
-- 除此之外，内核中的代码通常会被其他开发人员改进。令人惊讶的结果可能来自授权
-  您的用户社区和客户改进您的产品。
+- 除此之外，内核中的代码通常会被其他开发人员改进。您授权的用户社区和客户
+  对您产品的改进可能会令人惊喜。
 
-- 内核代码在合并到主线之前和之后都要经过审查。不管原始开发人员的技能有多强，
+- 内核代码在合并到主线之前和之后都要经过审查。无论原始开发人员的技能有多强，
   这个审查过程总是能找到改进代码的方法。审查经常发现严重的错误和安全问题。
-  这对于在封闭环境中开发的代码尤其如此；这种代码从外部开发人员的审查中获益
+  对于在封闭环境中开发的代码尤其如此；这种代码从外部开发人员的审查中获益
   匪浅。树外代码是低质量代码。
 
 - 参与开发过程是您影响内核开发方向的方式。旁观者的抱怨会被听到，但是活跃的
   开发人员有更强的声音——并且能够实现使内核更好地满足其需求的更改。
 
 - 当单独维护代码时，总是存在第三方为类似功能提供不同实现的可能性。如果发生
-  这种情况，合并代码将变得更加困难——甚至到了不可能的地步。然后，您将面临以下
+  这种情况，合并代码将变得更加困难——甚至成为不可能。之后，您将面临以下
   令人不快的选择：（1）无限期地维护树外的非标准特性，或（2）放弃代码并将用户
   迁移到树内版本。
 
-- 代码的贡献是使整个过程工作的根本。通过贡献代码，您可以向内核添加新功能，并
+- 代码的贡献是使整个流程工作的根本。通过贡献代码，您可以向内核添加新功能，并
   提供其他内核开发人员使用的功能和示例。如果您已经为Linux开发了代码（或者
   正在考虑这样做），那么您显然对这个平台的持续成功感兴趣；贡献代码是确保成功
   的最好方法之一。
 
 上述所有理由都适用于任何树外内核代码，包括以专有的、仅二进制形式分发的代码。
-然而，在考虑任何类型的纯二进制内核代码分布之前，还需要考虑其他因素。这些包括：
+然而，在考虑任何类型的纯二进制内核代码分布之前，还需要考虑其他因素。包括：
 
-- 围绕专有内核模块分发的法律问题充其量是模糊的；相当多的内核版权所有者认为，
-  大多数仅限二进制的模块是内核的派生产品，因此，它们的分发违反了GNU通用公共
-  许可证（下面将详细介绍）。您的作者不是律师，本文档中的任何内容都不可能被
+- 围绕专有内核模块分发的法律问题其实较为模糊；相当多的内核版权所有者认为，
+  大多数仅二进制的模块是内核的派生产品，因此，它们的分发违反了GNU通用公共
+  许可证（下面将详细介绍）。本文作者不是律师，本文档中的任何内容都不可能被
   视为法律建议。封闭源代码模块的真实法律地位只能由法院决定。但不管怎样，困扰
   这些模块的不确定性仍然存在。
 
 - 二进制模块大大增加了调试内核问题的难度，以至于大多数内核开发人员甚至都不会
   尝试。因此，只分发二进制模块将使您的用户更难从社区获得支持。
 
-- 对于只支持二进制的模块的发行者来说，支持也更加困难，他们必须为他们希望支持
-  的每个发行版和每个内核版本提供一个版本的模块。为了提供相当全面的覆盖范围，
+- 对于仅二进制的模块的发行者来说，支持也更加困难，他们必须为他们希望支持
+  的每个发行版和每个内核版本提供不同版本的模块。为了提供较为全面的覆盖范围，
   可能需要一个模块的几十个构建，并且每次升级内核时，您的用户都必须单独升级
-  您的模块。
+  这些模块。
 
-- 上面提到的关于代码评审的所有问题都更加存在于封闭源代码。由于该代码根本不可
-  用，因此社区无法对其进行审查，毫无疑问，它将存在严重问题。
+- 上面提到的关于代码评审的所有问题都更加存在于封闭源代码中。由于该代码根本
+  不可得，因此社区无法对其进行审查，毫无疑问，它将存在严重问题。
 
-尤其是嵌入式系统的制造商，可能会倾向于忽视本节中所说的大部分内容，因为他们
+尤其是嵌入式系统的制造商，可能会倾向于忽视本节中所说的大部分内容；因为他们
 相信自己正在商用一种使用冻结内核版本的独立产品，在发布后不需要再进行开发。
 这个论点忽略了广泛的代码审查的价值以及允许用户向产品添加功能的价值。但这些
-产品也有有限的商业寿命，之后必须发布新版本的产品。在这一点上，代码在主线上
+产品的商业寿命有限，之后必须发布新版本的产品。在这一点上，代码在主线上
 并得到良好维护的供应商将能够更好地占位，以使新产品快速上市。
 
 许可
@@ -164,23 +172,24 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata, 和 Jochen Voß.
 代码是根据一些许可证提供给Linux内核的，但是所有代码都必须与GNU通用公共许可
 证（GPLV2）的版本2兼容，该版本是覆盖整个内核分发的许可证。在实践中，这意味
 着所有代码贡献都由GPLv2（可选地，语言允许在更高版本的GPL下分发）或3子句BSD
-许可（New BSD License, 译者注）覆盖。任何不包含在兼容许可证中的贡献都不会
+许可（New BSD License，译者注）覆盖。任何不包含在兼容许可证中的贡献都不会
 被接受到内核中。
 
 贡献给内核的代码不需要（或请求）版权分配。合并到主线内核中的所有代码都保留
 其原始所有权；因此，内核现在拥有数千个所有者。
 
-这种所有权结构的一个暗示是，任何改变内核许可的尝试都注定会失败。很少有实际
-的场景可以获得所有版权所有者的同意（或者从内核中删除他们的代码）。因此，特
-别是，在可预见的将来，不可能迁移到GPL的版本3。
+这种所有权结构也暗示着，任何改变内核许可的尝试都注定会失败。很少有实际
+情况可以获得所有版权所有者的同意（或者从内核中删除他们的代码）。因此，尤其
+是在可预见的将来，许可证不大可能迁移到GPL的版本3。
 
-所有贡献给内核的代码都必须是合法的免费软件。因此，不接受匿名（或匿名）贡献
-者的代码。所有贡献者都需要在他们的代码上“sign off”，声明代码可以在GPL下与内
-核一起分发。无法提供未被其所有者许可为免费软件的代码，或可能为内核造成版权
-相关问题的代码（例如，由缺乏适当保护的反向工程工作派生的代码）不能被接受。
+所有贡献给内核的代码都必须是合法的免费软件。因此，不接受匿名（或化名）贡献
+者的代码。所有贡献者都需要在他们的代码上“sign off（签发）”，声明代码可以
+在GPL下与内核一起分发。无法提供未被其所有者许可为免费软件的代码，或可能为
+内核造成版权相关问题的代码（例如，由缺乏适当保护的反向工程工作派生的代码）
+不能被接受。
 
-有关版权相关问题的问题在Linux开发邮件列表中很常见。这样的问题通常会得到不少
-答案，但要记住，回答这些问题的人不是律师，不能提供法律咨询。如果您有关于
-Linux源代码的法律问题，那么与了解该领域的律师交流是无法替代的。依靠从技术
-邮件列表中获得的答案是一件冒险的事情。
+有关版权问题的提问在Linux开发邮件列表中很常见。这样的问题通常会得到不少
+答案，但请记住，回答这些问题的人不是律师，不能提供法律咨询。如果您有关于
+Linux源代码的法律问题，没有什么可以代替咨询了解这一领域的律师。依赖从
+技术邮件列表中获得的答案是一件冒险的事情。
 
-- 
2.20.1

