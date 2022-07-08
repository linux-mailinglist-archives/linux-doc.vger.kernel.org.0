Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D7156B023
	for <lists+linux-doc@lfdr.de>; Fri,  8 Jul 2022 03:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiGHBVE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 Jul 2022 21:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbiGHBVD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jul 2022 21:21:03 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D90572EDD
        for <linux-doc@vger.kernel.org>; Thu,  7 Jul 2022 18:21:00 -0700 (PDT)
Received: from [192.168.100.8] (unknown [223.106.33.172])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9Nvhsdi2F0QAA--.4150S3;
        Fri, 08 Jul 2022 09:20:48 +0800 (CST)
Message-ID: <201a680d-e6e5-61e9-5533-af3ad6b945fc@loongson.cn>
Date:   Fri, 8 Jul 2022 09:20:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] docs/zh_CN: Add a new translation of
 reporting-regressions.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, xu xin <xu.xin16@zte.com.cn>,
        Yang Yang <yang.yang29@zte.com.cn>,
        Junhua Huang <huang.junhua@zte.com.cn>,
        Tang Yizhou <yizhou.tang@shopee.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>, linux-doc@vger.kernel.org
References: <YrZufcSEnvBWj+7Z@bobwxc.mipc> <YsbuDGIpUjOzfAAh@bobwxc.mipc>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <YsbuDGIpUjOzfAAh@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf9Nvhsdi2F0QAA--.4150S3
X-Coremail-Antispam: 1UD129KBjvAXoWfuF43GryDCFy7uFy5tw4UXFb_yoW5JFy5Go
        WSy3y5uws8Wa17Jr45Ga17Gr9rJF18GrnxCFsxKrnrJr1Uur1FyF1kJrW3trWxZry5G3Wf
        t347tF47GFyUA3W3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYT7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
        JVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
        73UjIFyTuYvjfUFVyIUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,WEIRD_QUOTING
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/7 22:30, Wu XiangCheng 写道:
> Last English version used:
>
> commit d2b40ba2cce2 ("docs: *-regressions.rst: explain how quickly
> issues should be handled")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>


Thanks,

Yanteng


> ---
> v2:
> * fix all existed file path
> * modified some words under Yanteng's advice, thanks
>
> v1:
> see <https://lore.kernel.org/linux-doc/YrZufcSEnvBWj+7Z@bobwxc.mipc/>
>
>   .../translations/zh_CN/admin-guide/index.rst  |   2 +-
>   .../admin-guide/reporting-regressions.rst     | 370 ++++++++++++++++++
>   2 files changed, 371 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index be535ffaf4b0..2f6970d0a032 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -36,6 +36,7 @@ Todolist:
>      :maxdepth: 1
>   
>      reporting-issues
> +   reporting-regressions
>      security-bugs
>      bug-hunting
>      bug-bisect
> @@ -44,7 +45,6 @@ Todolist:
>   
>   Todolist:
>   
> -*   reporting-bugs
>   *   ramoops
>   *   dynamic-debug-howto
>   *   kdump/index
> diff --git a/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst b/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
> new file mode 100644
> index 000000000000..c0461ee855bc
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
> @@ -0,0 +1,370 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
> +.. 【重分发信息参见本文件结尾】
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/admin-guide/reporting-regressions.rst
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +
> +============
> +报告回归问题
> +============
> +
> +“*我们拒绝出现回归*”是Linux内核开发的首要规则；Linux的发起者和领军开发者Linus
> +Torvalds立下了此规则并确保它被落实。
> +
> +本文档描述了这条规则对用户的意义，以及Linux内核开发模型如何确保解决所有被报告
> +的回归；关于内核开发者如何处理的方面参见 Documentation/process/handling-regressions.rst 。
> +
> +
> +本文重点（亦即“太长不看”）
> +==========================
> +
> +#. 如果某程序在原先的Linux内核上运行良好，但在较新版本上效果更差、或者根本不
> +   能用，那么你就碰见回归问题了。注意，新内核需要使用类似配置编译；更多相关细
> +   节参见下方。
> +
> +#. 按照 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst 中
> +   所说的报告你的问题，该文档已经包含了所有关于回归的重要方面，为了方便起见也
> +   复制到了下面。两个重点：在报告主题中使用“[REGRESSION]”开头并抄送或转发到
> +   `回归邮件列表 <https://lore.kernel.org/regressions/>`_
> +   （regressions@lists.linux.dev）。
> +
> +#. 可选但是建议：在发送或转发报告时，指明该回归发生的起点，以便Linux内核回归
> +   追踪机器人“regzbot”可以追踪此问题::
> +
> +       #regzbot introduced v5.13..v5.14-rc1
> +
> +
> +与用户相关的所有Linux内核回归细节
> +=================================
> +
> +
> +基本重点
> +--------
> +
> +
> +什么是“回归”以及什么是“无回归规则”？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +如果某程序/实例在原先的Linux内核上运行良好，但在较新版本上效果更差、或者根本
> +不能用，那么你就碰见回归问题了。“无回归规则”不允许出现这种情况。如果偶然发
> +生了，导致问题的开发者应当迅速修复问题。
> +
> +也就是说，若Linux 5.13中的WiFi驱动程序运行良好，但是在5.14版本上却不能用、速
> +度明显变慢或出现错误，那就出现了回归。如果某正常工作的应用程序突然在新内核上
> +出现不稳定，这也是回归；这些问题可能是由于procfs、sysfs或Linux提供给用户空间
> +软件的许多其他接口之一的变化。但请记住，前述例子中的5.14需要使用类似于5.13的
> +配置构建。这可以用 ``make olddefconfig`` 实现，详细解释见下。
> +
> +注意本节第一句话中的“实例”：即使开发者需要遵循“无回归”规则，但仍可自由地改
> +变内核的任何方面，甚至是导出到用户空间的API或ABI，只要别破坏现有的应用程序或
> +用例。
> +
> +还需注意，“无回归”规则只限制内核提供给用户空间的接口。它不适用于内核内部接
> +口，比如一些外部开发的驱动程序用来插入钩子到内核的模块API。
> +
> +如何报告回归？
> +~~~~~~~~~~~~~~
> +
> +只需按照 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst 中
> +所说的报告你的问题，该文档已经包含了要点。下面几点概述了一下只在回归中重要的
> +方面：
> +
> + * 在检查可加入讨论的现有报告时，别忘了搜索 `Linux回归邮件列表
> +   <https://lore.kernel.org/regressions/>`_ 和 `regzbot网页界面
> +   <https://linux-regtracking.leemhuis.info/regzbot/>`_ 。
> +
> + * 在报告主题的开头加上“[REGRESSION]”。
> +
> + * 在你的报告中明确最后一个正常工作的内核版本和首个出问题的版本。如若可能，
> +   用二分法尝试找出导致回归的变更，更多细节见下。
> +
> + * 记得把报告发到Linux回归邮件列表（regressions@lists.linux.dev）。
> +
> +   * 如果通过邮件报告回归，请抄送回归列表。
> +
> +   * 如果你使用某些缺陷追踪器报告回归，请通过邮件转发已提交的报告到回归列表，
> +     并抄送维护者以及出问题的相关子系统的邮件列表。
> +
> +   如果是稳定版或长期支持版系列（如v5.15.3…v5.15.5）的回归，请记得抄送
> +   `Linux稳定版邮件列表 <https://lore.kernel.org/stable/>`_ （stable@vger.kernel.org）。
> +
> +  如果你成功地执行了二分，请抄送肇事提交的信息中所有签了“Signed-off-by:”的人。
> +
> +在抄送你的报告到列表时，也请记得通知前述的Linux内核回归追踪机器人。只需在邮件
> +中包含如下片段::
> +
> +       #regzbot introduced: v5.13..v5.14-rc1
> +
> +Regzbot会就将你的邮件视为在某个特定版本区间的回归报告。上例中即linux v5.13仍
> +然正常，而Linux 5.14-rc1是首个您遇到问题的版本。如果你执行了二分以查找导致回
> +归的提交，请使用指定肇事提交的id代替::
> +
> +       #regzbot introduced: 1f2e3d4c5d
> +
> +添加这样的“regzbot命令”对你是有好处的，它会确保报告不会被忽略。如果你省略了
> +它，Linux内核的回归跟踪者会把你的回归告诉regzbot，只要你发送了一个副本到回归
> +邮件列表。但是回归跟踪者只有一个人，有时不得不休息或甚至偶尔享受可以远离电脑
> +的时光（听起来很疯狂）。因此，依赖此人手动将回归添加到 `已追踪且尚未解决的
> +Linux内核回归列表 <https://linux-regtracking.leemhuis.info/regzbot/>`_ 和
> +regzbot发送的每周回归报告，可能会出现延迟。 这样的延误会导致Linus Torvalds
> +在决定“继续开发还是发布新版本？”时忽略严重的回归。
> +
> +真的修复了所有的回归吗？
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +几乎所有都是，只要引起问题的变更（肇事提交）被可靠定位。也有些回归可以不用这
> +样，但通常是必须的。
> +
> +谁需要找出回归的根本原因？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +受影响代码区域的开发者应该自行尝试定位问题所在。但仅靠他们的努力往往是不可
> +能做到的，很多问题只发生在开发者的无法接触的其他特定外部环境中——例如特定的
> +硬件平台、固件、Linux发行版、系统的配置或应用程序。这就是为什么最终往往是报
> +告者定位肇事提交；有时用户甚至需要再运行额外测试以查明确切的根本原因。开发
> +者应该提供建议和可能的帮助，以使普通用户更容易完成该流程。
> +
> +如何找到罪魁祸首？
> +~~~~~~~~~~~~~~~~~~
> +
> +如 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst （简要）
> +和 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst （详细）中所
> +述，执行二分。听起来工作量很大，但大部分情况下很快就能找到罪魁祸首。如果这很
> +困难或可靠地重现问题很耗时，请考虑与其他受影响的用户合作，一起缩小搜索范围。
> +
> +当出现回归时我可以向谁寻求建议？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +发送邮件到回归邮件列表（regressions@lists.linux.dev）同时抄送Linux内核的回归
> +跟踪者（regressions@leemhuis.info）;如果问题需要保密处理，可以省略列表。
> +
> +
> +关于回归的更多细节
> +------------------
> +
> +
> +“无回归规则”的目标是什么？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +用户应该放心升级内核版本，而不必担心有程序可能崩溃。这符合内核开发者的利益，
> +可以使更新有吸引力：他们不希望用户停留在停止维护或超过一年半的稳定/长期Linux
> +版本系列上。这也符合所有人的利益，因为 `那些系列可能含有已知的缺陷、安全问题
> +或其他后续版本已经修复的问题
> +<http://www.kroah.com/log/blog/2018/08/24/what-stable-kernel-should-i-use/>`_ 。
> +此外，内核开发者希望使用户测试最新的预发行版或常规发行版变得简单而有吸引力。
> +这同样符合所有人的利益，如果新版本出来后很快就有相关报告，会使追踪和修复问题
> +更容易。
> +
> +实际中“无回归”规则真的可行吗？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +这不是句玩笑话，请见Linux创建者和主要开发人员Linus Torvalds在邮件列表中的许
> +多发言，其中一些在 Documentation/process/handling-regressions.rst 中被引用。
> +
> +此规则的例外情况极为罕见；之前当开发者认为某个特定的情况有必要援引例外时，
> +基本都被证明错了。
> +
> +谁来确保“无回归”被落实？
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +照看和支撑树的子系统维护者应该关心这一点——例如，Linus Torvalds之于主线，
> +Greg Kroah-Hartman等人之于各种稳定/长期系列。
> +
> +他们都得到了别人的帮助，以确保回归报告不会被遗漏。其中之一是Thorsten
> +Leemhuis，他目前担任Linux内核的“回归跟踪者”；为了做好这项工作，他使用了
> +regzbot——Linux内核回归跟踪机器人。所以这就是为什么要抄送或转发你的报告到
> +回归邮件列表来通知这些人，已经最好在你的邮件中包含“regzbot命令”来立即追踪它。
> +
> +回归通常多久能修复？
> +~~~~~~~~~~~~~~~~~~~~
> +
> +开发者应该尽快修复任何被报告的回归，以提供及时为受影响的用户提供解决方案，并
> +防止更多用户遇到问题；然而，开发人员需要花足够的时间和注意力确保回归修复不会
> +造成额外的损害。
> +
> +因此，答案取决于各种因素，如回归的影响、存在时长或出现于哪个Linux版本系列。
> +但最终，大多数的回归应该在两周内修复。
> +
> +当问题可以通过升级某些软件解决时，是回归吗？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +基本都是。如果开发人员告诉您其他情况，请咨询上述回归跟踪者。
> +
> +当新内核变慢或能耗增加，是回归吗？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +是的，但有一些差别。在微型基准测试中变慢5%不太可能被视为回归，除非它也会对
> +广泛基准测试的结果产生超过1%的影响。如果有疑问，请寻求建议。
> +
> +当更新Linux时外部内核模块崩溃了，是回归吗？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +不，因为“无回归”规则仅限于Linux内核提供给用户空间的接口和服务。因此，它不包括
> +构建或运行外部开发的内核模块，因为它们在内核空间中运行与挂进内核使用的内部接
> +口偶尔会变化。
> +
> +如何处理安全修复引起的回归？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +在极为罕见的情况下，安全问题无法在不引起回归的情况下修复；这些修复都被放弃了，
> +因为它们终究会引起问题。幸运的是这种两难境地基本都可以避免，受影响区域的主要
> +开发者以及Linus Torvalds本人通常都会努力在不引入回归的情况下解决安全问题。
> +
> +如果你仍然面临此种情况，请查看邮件列表档案是否有人尽力避免过回归。如果没有，
> +请报告它；如有疑问，请如上所述寻求建议。
> +
> +当修复回归时不可避免会引入另一个，如何处理？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +很遗憾这种事确实会出现，但幸运的是并不经常出现；如果发生了，受影响代码区的资
> +深开发者应当调查该问题以找到避免回归的解决方法，至少避免它们的影响。如果你遇
> +到这样的情况，如上所述：检查之前的讨论是否有人已经尽了最大努力，如有疑问请寻
> +求建议。
> +
> +小提示：如果人们在每个开发周期中定期给出主线预发布（即v5.15-rc1或-rc3）以供
> +测试，则可以避免这种情况。为了更好地解释，可以设想一个在Linux v5.14和v5.15-rc1
> +之间集成的更改，该更改导致了回归，但同时是应用于5.15-rc1的其他改进的强依赖。
> +如果有人在5.15发布之前就发现并报告了这个问题，那么所有更改都可以直接撤销，从
> +而解决回归问题。而就在几天或几周后，此解决方案变成了不可能，因为一些软件可能
> +已经开始依赖于后续更改之一：撤销所有更改将导致上述用户软件出现回归，这是不可
> +接受的。
> +
> +若我所依赖的功能在数月前被移除了，是回归吗？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +是的，但如前节所述，通常很难修复此类回归。因此需要逐案处理。这也是定期测试主
> +线预发布对所有人有好处的另一个原因。
> +
> +如果我似乎是唯一受影响的人，是否仍适用“无回归”规则？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +适用，但仅限于实际使用：Linux开发人员希望能够自由地取消那些只能在阁楼和博物
> +馆中找到的硬件的支持。
> +
> +请注意，有时为了取得进展，不得不出现回归——后者也是防止Linux停滞不前所必需
> +的。因此如果回归所影响的用户很少，那么为了他们和其他人更大的利益，还是让事情
> +过去吧。尤其是存在某种规避回归的简单方法，例如更新一些软件或者使用专门为此目
> +的创建的内核参数。
> +
> +回归规则是否也适用于staging树中的代码？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +不，参见 `适用于所有staging代码配置选项的帮助文本
> +<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/Kconfig>`_ ，
> +其早已声明::
> +
> +       请注意：这些驱动正在积极开发中，可能无法正常工作，并可能包含会在不久的
> +       将来发生变化的用户接口。
> +
> +虽然staging开发人员通常坚持“无回归”的原则，但有时为了取得进展也会违背它。这就
> +是为什么当staging树的WiFi驱动被基本推倒重来时，有些用户不得不处理回归（通常可
> +以忽略）。
> +
> +为什么较新版本必须“使用相似配置编译”？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +因为Linux内核开发人员有时会集成已知的会导致回归的变更，但使它们成为可选的，并
> +在内核的默认配置下禁用它们。这一技巧允许进步，否则“无回归”规则将导致停滞。
> +
> +例如，试想一个新的可以阻止恶意软件滥用某个内核的接口的安全特性，同时又需要满足
> +另一个很罕见的应用程序。上述的方法可使两方都满意：使用这些应用程序的人可以关闭
> +新的安全功能，而其他不会遇到麻烦的人可以启用它。
> +
> +如何创建与旧内核相似的配置？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +用一个已知良好的内核启动机器，并用 ``make olddefconfig`` 配置新版的Linux。这
> +会让内核的构建脚本从正在运行的内核中摘录配置文件（“.config”文件），作为即将编
> +译的新版本的基础配置；同时将所有新的配置选项设为默认值，以禁用可能导致回归的
> +新功能。
> +
> +如何报告在预编译的普通内核中发现的回归？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +您需要确保新的内核是用与旧版相似的配置编译（见上文），因为那些构建它们的人可
> +能启用了一些已知的与新内核不兼容的特性。如有疑问，请向内核的提供者报告问题并
> +寻求建议。
> +
> +
> +用“regzbot”追踪回归的更多信息
> +-----------------------------
> +
> +什么是回归追踪？为啥我需要关心它？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +像“无回归”这样的规则需要有人来确保它们被遵守，否则会被有意/无意打破。历史证
> +明了这一点对于Linux内核开发也适用。这就是为什么Linux内核的回归跟踪者Thorsten
> +Leemhuis，，和另一些人尽力关注所有的回归直到他们解决。他们从未为此获得报酬，
> +因此这项工作是在尽最大努力的基础上完成的。
> +
> +为什么/如何使用机器人追踪Linux内核回归？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +由于Linux内核开发过程的分布式和松散结构，完全手动跟踪回归已经被证明是相当困难
> +的。因此Linux内核的回归跟踪者开发了regzbot来促进这项工作，其长期目标是尽可能为
> +所有相关人员自动化回归跟踪。
> +
> +Regzbot通过监视跟踪的回归报告的回复来工作。此外，它还查找用“Link:”标签引用这
> +些报告的补丁；对这些补丁的回复也会被跟踪。结合这些数据，可以很好地了解当前修
> +复过程的状态。
> +
> +如何查看regzbot当前追踪的回归？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +参见 `regzbot在线 <https://linux-regtracking.leemhuis.info/regzbot/>`_ 。
> +
> +何种问题可以由regzbot追踪？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +该机器人只为了跟踪回归，因此请不要让regzbot涉及常规问题。但是对于Linux内核的
> +回归跟踪者来说，让regzbot跟踪严重问题也可以，如有关挂起、损坏数据或内部错误
> +（Panic、Oops、BUG（）、warning…）的报告。
> +
> +如何修改被追踪回归的相关信息？
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +在直接或间接回复报告邮件时使用“regzbot命令”即可。最简单的方法是：在“已发送”文
> +件夹或邮件列表存档中找到报告，然后使用邮件客户端的“全部回复”功能对其进行回复。
> +在该邮件中的独立段落中可使用以下命令之一（即使用空行将这些命令中的一个或多个与
> +其余邮件文本分隔开）。
> +
> + * 更新回归引入起点，例如在执行二分之后::
> +
> +       #regzbot introduced: 1f2e3d4c5d
> +
> + * 设置或更新标题::
> +
> +       #regzbot title: foo
> +
> + * 监视讨论或bugzilla.kernel.org上有关讨论或修复的工单::
> +
> +       #regzbot monitor: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
> +       #regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=123456789
> +
> + * 标记一个有更多相关细节的地方，例如有关但主题不同的邮件列表帖子或缺陷追踪器中的工单::
> +
> +       #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=123456789
> +
> + * 标记回归已失效::
> +
> +       #regzbot invalid: wasn't a regression, problem has always existed
> +
> +Regzbot还支持其他一些主要由开发人员或回归追踪人员使用的命令。命令的更多细节请
> +参考 `入门指南 <https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md>`_
> +和 `参考手册 <https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md>`_ 。
> +
> +..
> +   正文结束
> +..
> +   如本文件开头所述，本文以GPL-2.0+或CC-BY-4.0许可发行。如您想仅在CC-BY-4.0许
> +   可下重分发本文，请用“Linux内核开发者”作为作者，并用如下链接作为来源：
> +   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
> +..
> +   注意：本RST文件内容只有在来自Linux内核源代码时是使用CC-BY-4.0许可的，因为经
> +   过处理的版本（如经内核的构建系统）可能包含来自使用更严格许可证的文件的内容。
>
> base-commit: 4d627ef12b409fd149226617180f1cc6088bbf12

