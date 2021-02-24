Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AA0323A96
	for <lists+linux-doc@lfdr.de>; Wed, 24 Feb 2021 11:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhBXKct (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Feb 2021 05:32:49 -0500
Received: from m32-153.88.com ([43.250.32.153]:61486 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234846AbhBXKcs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Feb 2021 05:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=TaEYyYJ3hcsJuajVH3tr3mACZgrI4C3HFpc7g
        No72eQ=; b=HyBdub1G4ZRw4isD8p38fYXlsKOBBXtZ9pRhmXFk7EFAF1jJ0ZR6f
        b8pxEhdG4yQmkJQ62gLAVQvyErOW9fjIflO3m2KRQIu5VZOrnKsC+IBOeFXvA1ua
        wVkIuIwldCGh9Kk5Pixhna6RkXwoWpJ9JVc3v+KiQI2C/uMWE6cnDg=
Received: from mipc (unknown [120.242.70.144])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiIgKzZgZKgHAA--.10980S2;
        Wed, 24 Feb 2021 18:32:01 +0800 (CST)
Date:   Wed, 24 Feb 2021 18:32:00 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v1 7/9] docs/zh_CN: Improve zh_CN/process/6.Followthrough
Message-ID: <fb25d4f1e4b59269d74ec492797d7da3c0eea057.1614162064.git.bobwxc@email.cn>
References: <cover.1614162064.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614162064.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiIgKzZgZKgHAA--.10980S2
X-Coremail-Antispam: 1UD129KBjvAXoWfXrWxKF1fArykAr1DArW5ZFb_yoW8uFykJo
        Z5Ca1Yvw4DJayaqa45Kan8Gr1DXrs5AFsxCw4kKFnxZr1UGw40q3Z5JFsxXryrurWakrW3
        tFyxGF1SkF18A3W3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5v7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4DMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvj4RROJ5DUUUU
X-Originating-IP: [120.242.70.144]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve language and grammar of zh_CN/process/6.Followthrough.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/process/6.Followthrough.rst         | 143 +++++++++---------
 1 file changed, 75 insertions(+), 68 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/6.Followthrough.rst b/Documentation/translations/zh_CN/process/6.Followthrough.rst
index f509e077e1cb..6cbaf93c882a 100644
--- a/Documentation/translations/zh_CN/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_CN/process/6.Followthrough.rst
@@ -1,145 +1,152 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+
+:Translator:
+
+ 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
+
+:校译:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
 
 .. _cn_development_followthrough:
 
 跟进
 ====
 
-在这一点上，您已经遵循了到目前为止给出的指导方针，并且，随着您自己的工程技能
+此时，您已经遵循了到目前为止给出的指导方针，并且，随着您自己的工程技能
 的增加，已经发布了一系列完美的补丁。即使是经验丰富的内核开发人员也能犯的最大
 错误之一是，认为他们的工作现在已经完成了。事实上，发布补丁意味着进入流程的下
 一个阶段，可能还需要做很多工作。
 
-一个补丁在第一次发布时就非常出色，没有改进的余地,这是很罕见的。内核开发流程
-认识到这一事实，因此，它非常注重对已发布代码的改进。作为代码的作者，您应该与
+一个补丁在首次发布时就非常出色、没有改进的余地，这是很罕见的。内核开发流程已
+认识到这一事实，因此它非常注重对已发布代码的改进。作为代码的作者，您应该与
 内核社区合作，以确保您的代码符合内核的质量标准。如果不参与这个过程，很可能会
-阻止将补丁包含到主线中。
+无法将补丁合并到主线中。
 
 与审阅者合作
 ------------
 
 任何意义上的补丁都会导致其他开发人员在审查代码时发表大量评论。对于许多开发
-人员来说，与审查人员合作可能是内核开发过程中最令人生畏的部分。但是，如果你
+人员来说，与审阅人员合作可能是内核开发过程中最令人生畏的部分。但是如果你
 记住一些事情，生活会变得容易得多：
 
- - 如果你已经很好地解释了你的补丁，评论人员会理解它的价值，以及为什么你会
-   费尽心思去写它。但是这个并不能阻止他们提出一个基本的问题：五年或十年后
-   用这个代码维护一个内核会是什么感觉？你可能被要求做出的许多改变——从编码风格
+ - 如果你已经很好地解释了你的补丁，审阅人员会理解它的价值，以及为什么你会
+   费尽心思去写它。但是这个并不能阻止他们提出一个基本的问题：在五年或十年后
+   维护含有此代码的内核会怎么样？你可能被要求做出的许多改变——从编码风格
    的调整到大量的重写——都来自于对Linux的理解，即从现在起十年后，Linux仍将在
-   开发中。
+-   开发中。
 
  - 代码审查是一项艰苦的工作，这是一项相对吃力不讨好的工作；人们记得谁编写了
-   内核代码，但对于那些审查它的人来说，几乎没有什么持久的名声。因此，评论
+   内核代码，但对于那些审查它的人来说，几乎没有什么长久的名声。因此，审阅
    人员可能会变得暴躁，尤其是当他们看到同样的错误被一遍又一遍地犯下时。如果
-   你得到了一个看起来愤怒、侮辱或完全冒犯你的评论，抵制以同样方式回应的冲动。
-   代码审查是关于代码的，而不是关于人的，代码审查人员不会亲自攻击您。
+   你得到了一个看起来愤怒、侮辱或完全冒犯你的评论，请抑制以同样方式回应的冲动。
+   代码审查是关于代码的，而不是关于人的，代码审阅人员不会亲自攻击您。
 
- - 同样，代码审查人员也不想以牺牲你雇主的利益为代价来宣传他们雇主的议程。
+ - 同样，代码审阅人员也不想以牺牲你雇主的利益为代价来宣传他们雇主的议程。
    内核开发人员通常希望今后几年能在内核上工作，但他们明白他们的雇主可能会改
    变。他们真的，几乎毫无例外地，致力于创造他们所能做到的最好的内核；他们并
    没有试图给雇主的竞争对手造成不适。
 
-所有这些归根结底都是，当审阅者向您发送评论时，您需要注意他们正在进行的技术
-观察。不要让他们的表达方式或你自己的骄傲阻止这种事情的发生。当你在一个补丁
+所有这些归根结底就是，当审阅者向您发送评论时，您需要注意他们正在进行的技术
+评论。不要让他们的表达方式或你自己的骄傲阻止此事。当你在一个补丁
 上得到评论时，花点时间去理解评论人想说什么。如果可能的话，请修复审阅者要求
-您修复的内容。然后回复审稿人：谢谢他们，并描述你将如何回答他们的问题。
+您修复的内容。然后回复审阅者：谢谢他们，并描述你将如何回答他们的问题。
 
 请注意，您不必同意审阅者建议的每个更改。如果您认为审阅者误解了您的代码，请
 解释到底发生了什么。如果您对建议的更改有技术上的异议，请描述它并证明您对该
-问题的解决方案是正确的。如果你的解释有道理，审稿人会接受的。不过，如果你的
-解释不能证明是有说服力的，尤其是当其他人开始同意审稿人的观点时，请花些时间
-重新考虑一下。你很容易对自己解决问题的方法视而不见，以至于你没有意识到某个
-问题根本是错误的，或者你甚至没有解决正确的问题。
+问题的解决方案是正确的。如果你的解释有道理，审阅者会接受的。不过，如果你的
+解释证明缺乏说服力，尤其是当其他人开始同意审稿人的观点时，请花些时间
+重新考虑一下。你很容易对自己解决问题的方法视而不见，以至于你没有意识到某些
+东西完全是错误的，或者你甚至没有解决正确的问题。
 
-Andrew Morton建议，每一条不会导致代码更改的评论都应该导致额外的代码注释；
-这可以帮助未来的评论人员避免出现第一次出现的问题。
+Andrew Morton建议，每一个不会导致代码更改的审阅评论都应该产生一个额外的代码
+注释；这可以帮助未来的审阅人员避免第一次出现的问题。
 
-一个致命的错误是忽视评论，希望它们会消失。他们不会走的。如果您在没有对之前
-收到的注释做出响应的情况下重新发布代码，那么很可能会发现补丁毫无用处。
+忽视评论、希望它们会消失是一个致命的错误。它们不会走的。如果您在没有对之前
+收到的评论做出响应的情况下重新发布代码，那么很可能会发现补丁毫无用处。
 
 说到重新发布代码：请记住，审阅者不会记住您上次发布的代码的所有细节。因此，
-提醒审查人员以前提出的问题以及您如何处理这些问题总是一个好主意；补丁变更
+提醒审阅人员以前提出的问题以及您如何处理这些问题总是一个好主意；补丁变更
 日志是提供此类信息的好地方。审阅者不必搜索列表档案来熟悉上次所说的内容；
-如果您帮助他们开始运行，当他们重新访问您的代码时，他们的心情会更好。
+如果您帮助他们直接开始，当他们重新查看您的代码时，心情会更好。
 
 如果你已经试着做正确的事情，但事情仍然没有进展呢？大多数技术上的分歧都可以
-通过讨论来解决，但有时人们只需要做出决定。如果你真的认为这个决定对你不利，
-你可以试着向更高的权力上诉。在这篇文章中，更高的权力倾向于Andrew Morton。
-Andrew在内核开发社区中受i很大的尊重；他经常为似乎被绝望地阻塞事情清障。
-尽管如此，对Andrew的呼吁不应轻而易举，也不应在所有其他替代方案都被探索之前
-使用。当然，记住，他也可能不同意你的意见。
+通过讨论来解决，但有时人们仍需要做出决定。如果你真的认为这个决定对你不利，
+你可以试着向有更高权力的人上诉。对于本文，更高权力的人是Andrew Morton。
+Andrew在内核开发社区中非常受尊敬；他经常为似乎被绝望阻塞的事情清障。
+尽管如此，不应轻易就直接找Andrew，也不应在所有其他替代方案都被尝试之前
+找他。当然，记住，他也可能不同意你的意见。
 
 接下来会发生什么
 ----------------
 
-如果一个补丁被认为是添加到内核中的一件好事，并且一旦大多数审查问题得到解决，
+如果一个补丁被认为适合添加到内核中，并且大多数审查问题得到解决，
 下一步通常是进入子系统维护人员的树中。工作方式因子系统而异；每个维护人员都
-有自己的工作方式。特别是，可能有不止一棵树——一棵树，也许，专门用于计划下一
+有自己的工作方式。特别是可能有不止一棵树——也许一棵树专门用于计划下一
 个合并窗口的补丁，另一棵树用于长期工作。
 
-对于应用于没有明显子系统树（例如内存管理修补程序）的区域的修补程序，默认树
-通常以-mm结尾。影响多个子系统的补丁也可以最终通过-mm树。
+对于应用到不属于明显子系统树（例如内存管理修补程序）的区域的修补程序，默认树
+通常上溯到-mm。影响多个子系统的补丁也可以最终进入-mm树。
 
 包含在子系统树中可以提高补丁的可见性。现在，使用该树的其他开发人员将默认获
 得补丁。子系统树通常也为Linux提供支持，使其内容对整个开发社区可见。在这一点
 上，您很可能会从一组新的审阅者那里得到更多的评论；这些评论需要像上一轮那样
-得到回答。
+得到回应。
 
-在这一点上也会发生什么，这取决于你的补丁的性质，是与其他人正在做的工作发生
+在这时也会发生点什么，这取决于你的补丁的性质，是否与其他人正在做的工作发生
 冲突。在最坏的情况下，严重的补丁冲突可能会导致一些工作被搁置，以便剩余的补丁
 可以成形并合并。另一些时候，冲突解决将涉及到与其他开发人员合作，可能还会
 在树之间移动一些补丁，以确保所有的应用都是干净的。这项工作可能是一件痛苦的
-事情，但要计算您的福祉：在Linux下一棵树出现之前，这些冲突通常只在合并窗口
-中出现，必须迅速解决。现在可以在合并窗口打开之前，在空闲时解决这些问题。
+事情，但也需庆幸现在的幸福：在linux-next树出现之前，这些冲突通常只在合并窗口
+中出现，必须迅速解决。现在可以在合并窗口打开之前的空闲时间解决这些问题。
 
 有朝一日，如果一切顺利，您将登录并看到您的补丁已经合并到主线内核中。祝贺你！
-然而，一旦庆祝活动完成（并且您已经将自己添加到维护人员文件中），就值得记住
-一个重要的小事实：工作仍然没有完成。并入主线带来了自身的挑战。
+然而，一旦庆祝完了（并且您已经将自己添加到维护人员文件中），就一定要记住
+一个重要的小事实：工作仍然没有完成。并入主线也带来了它的挑战。
 
-首先，补丁的可见性再次提高。可能会有新一轮的开发者评论，他们以前不知道这
-个补丁。忽略它们可能很有诱惑力，因为您的代码不再存在任何被合并的问题。但是，
+首先，补丁的可见性再次提高。可能会有以前不知道这个补丁的开发者的新一轮评论。
+忽略它们可能很有诱惑力，因为您的代码不再存在任何被合并的问题。但是，
 要抵制这种诱惑，您仍然需要对有问题或建议的开发人员作出响应。
 
-不过，更重要的是：将代码包含在主线中会将代码交给更大的一组测试人员。即使您
-为尚未提供的硬件提供了驱动程序，您也会惊讶于有多少人会将您的代码构建到内核
-中。当然，如果有测试人员，也会有错误报告。
+不过，更重要的是：将代码包含在主线中会将代码交给更多的一些测试人员。即使您
+为尚未可用的硬件提供了驱动程序，您也会惊讶于有多少人会将您的代码构建到内核
+中。当然，如果有测试人员，也可能会有错误报告。
 
-最糟糕的错误报告是回归。如果你的补丁导致回归，你会发现很多不舒服的眼睛盯着
+最糟糕的错误报告是回归。如果你的补丁导致回归，你会发现多到让你不舒服的眼睛盯着
 你；回归需要尽快修复。如果您不愿意或无法修复回归（其他人都不会为您修复），
 那么在稳定期内，您的补丁几乎肯定会被移除。除了否定您为使补丁进入主线所做的
-所有工作之外，如果由于未能修复回归而取消补丁，很可能会使将来的工作更难合并。
+所有工作之外，如果由于未能修复回归而取消补丁，很可能会使将来的工作更难被合并。
 
-在处理完任何回归之后，可能还有其他普通的bug需要处理。稳定期是修复这些错误并
-确保代码在主线内核版本中的首次发布尽可能可靠的最好机会。所以，请回答错误
+在处理完任何回归之后，可能还有其他普通缺陷需要处理。稳定期是修复这些错误并
+确保代码在主线内核版本中的首次发布尽可能可靠的最好机会。所以，请回应错误
 报告，并尽可能解决问题。这就是稳定期的目的；一旦解决了旧补丁的任何问题，就
-可以开始创建酷的新补丁。
+可以开始尽情创建新补丁。
 
-别忘了，还有其他里程碑也可能会创建bug报告：下一个主线稳定版本，当著名的发行
-商选择包含补丁的内核版本时，等等。继续响应这些报告是您工作的基本骄傲。但是，
-如果这不是足够的动机，那么也值得考虑的是，开发社区会记住那些在合并后对代码
-失去兴趣的开发人员。下一次你发布补丁时，他们会以你以后不会在身边维护它为假
-设来评估它。
+别忘了，还有其他节点也可能会创建缺陷报告：下一个主线稳定版本，当著名的发行
+商选择包含您补丁的内核版本时等等。继续响应这些报告是您工作的基本素养。但是
+如果这不能提供足够的动机，那么也需要考虑：开发社区会记住那些在合并后对代码
+失去兴趣的开发人员。下一次你发布补丁时，他们会以你以后不会持续维护它为前提
+来评估它。
 
 其他可能发生的事情
 ------------------
 
-有一天，你可以打开你的邮件客户端，看到有人给你寄了一个代码补丁。毕竟，这是
+某天，当你打开你的邮件客户端时，看到有人给你寄了一个代码补丁。毕竟，这是
 让您的代码公开存在的好处之一。如果您同意这个补丁，您可以将它转发给子系统
 维护人员（确保包含一个正确的From:行，这样属性是正确的，并添加一个您自己
-的签准），或者回复一个Acked-by，让原始发送者向上发送它。
+的 signoff ），或者回复一个 Acked-by: 让原始发送者向上发送它。
 
-如果您不同意补丁，请发送一个礼貌的回复，解释原因。如果可能的话，告诉作者需要
-做哪些更改才能让您接受补丁。对于代码的编写者和维护者所反对的合并补丁，存在着
+如果您不同意补丁，请礼貌地回复，解释原因。如果可能的话，告诉作者需要
+做哪些更改才能让您接受补丁。合并代码的编写者和维护者所反对的补丁的确存在着
 一定的阻力，但仅此而已。如果你被认为不必要的阻碍了好的工作，那么这些补丁最
-终会经过你身边并进入主线。在Linux内核中，没有人对任何代码拥有绝对的否决权。
-除了Linus。
+终会绕过你并进入主线。在Linux内核中，没有人对任何代码拥有绝对的否决权。
+可能除了Linus。
 
 在非常罕见的情况下，您可能会看到完全不同的东西：另一个开发人员发布了针对您
-的问题的不同解决方案。在这一点上，两个补丁中的一个可能不会合并，“我的在这里
-是第一个”不被认为是一个令人信服的技术论据。如果有人的补丁取代了你的补丁而进
-入了主线，那么只有一种方法可以回应你：高兴你的问题得到解决，继续你的工作。
-以这种方式把一个人的工作推到一边可能会伤害和气馁，但是在他们忘记了谁的补丁
-真正被合并很久之后，社区会记住你的反应。
+的问题的不同解决方案。在这时，两个补丁之一可能不会被合并，“我的补丁首先
+发布”不被认为是一个令人信服的技术论据。如果有别人的补丁取代了你的补丁而进
+入了主线，那么只有一种方法可以回应你：很高兴你的问题解决了，请继续工作吧。
+以这种方式把某人的工作推到一边可能导致伤心和气馁，但是社区会记住你的反应，
+即使很久以后他们已经忘记了谁的补丁真正被合并。
-- 
2.20.1

