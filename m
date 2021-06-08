Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7444339ED42
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 06:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhFHEEe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 00:04:34 -0400
Received: from [43.250.32.171] ([43.250.32.171]:6868 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229455AbhFHEEe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Jun 2021 00:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=From:To:Date; bh=OKpUpIat2YDCj+XYUU2HLx5kuqr22PWt/elGx
        20mHII=; b=CXk2+q6hPM56jwkIPkg8eV5EA5E2Rb8N14+sG7FFktuQQdeQ6Tc8+
        rJIY0Uhg3Dwt5fu9MvvikxOvaOuXoFLSuwCWIexCyY9yzE2fXYlbJBF88TvLTSj+
        rFA8HItorMAyv5cJF/nvUz96BftEvQgrlPR/+07pQmt9K/x1IvnA7Q=
Received: from localhost.localdomain (unknown [113.251.8.115])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBH4zbf675g8gEEAA--.14725S2;
        Tue, 08 Jun 2021 12:02:39 +0800 (CST)
From:   Hu Haowen <src.res@email.cn>
To:     alexs@kernel.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] docs/zh_CN: create new translations for zh_CN/dev-tools/testing-overview
Date:   Tue,  8 Jun 2021 12:02:39 +0800
Message-Id: <20210608040239.64212-1-src.res@email.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LCKnCgBH4zbf675g8gEEAA--.14725S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr17KFWUZw1xtF4UXr13urg_yoW3Aw4fpr
        Wv9r97K3WUZry7A340ka4jqr1UCFn7WF43tF18Ja4Sqr18AFsYkrsFgFyqq3y3WrW8ZF98
        AF4rKFyj9w1vy3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgmb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWUuVWrJwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8Xw
        CF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY
        6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
        CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
        0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
        AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
        KfnxnUUI43ZEXa7IUjoGQDUUUUU==
X-Originating-IP: [113.251.8.115]
X-CM-SenderInfo: hvufh21hv6vzxdlohubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Create new translations for dev-tools/testing-overview.rst and link it
to dev-tools/index.rst with TODOList modifications.

Signed-off-by: Hu Haowen <src.res@email.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/dev-tools/index.rst    |   5 +
 .../zh_CN/dev-tools/testing-overview.rst      | 110 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/dev-tools/testing-overview.rst

diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
index fd73c479917b..6424590ea382 100644
--- a/Documentation/translations/zh_CN/dev-tools/index.rst
+++ b/Documentation/translations/zh_CN/dev-tools/index.rst
@@ -11,6 +11,9 @@
 目前这些文档已经整理在一起，不需要再花费额外的精力。
 欢迎任何补丁。
 
+有关测试专用工具的简要概述，参见
+Documentation/dev-tools/translations/zh_CN/testing-overview.rst
+
 .. class:: toc-title
 
 	   目录
@@ -19,6 +22,7 @@
    :maxdepth: 2
 
    gcov
+   testing-overview
 
 Todolist:
 
@@ -29,6 +33,7 @@ Todolist:
  - ubsan
  - kmemleak
  - kcsan
+ - kfence
  - gdb-kernel-debugging
  - kgdb
  - kselftest
diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
new file mode 100644
index 000000000000..a2746c81033b
--- /dev/null
+++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
@@ -0,0 +1,110 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/dev-tools/testing-overview.rst
+:Translator: 胡皓文 Hu Haowen <src.res@email.cn>
+
+============
+内核测试指南
+============
+
+有许多不同的工具可以用于测试Linux内核，因此了解什么时候使用它们可能
+很困难。本文档粗略概述了它们之间的区别，并阐释了它们是怎样糅合在一起
+的。
+
+编写和运行测试
+==============
+
+大多数内核测试都是用kselftest或KUnit框架之一编写的。它们都让运行测试
+更加简化，并为编写新测试提供帮助。
+
+如果你想验证内核的行为——尤其是内核的特定部分——那你就要使用kUnit或
+kselftest。
+
+KUnit和kselftest的区别
+----------------------
+
+.. note::
+     由于本文段中部分术语尚无较好的对应中文释义，可能导致与原文含义
+     存在些许差异，因此建议读者结合原文
+     （Documentation/dev-tools/testing-overview.rst）辅助阅读。
+
+     如对部分翻译有异议或有更好的翻译意见，欢迎联系译者进行修订。
+
+KUnit（Documentation/dev-tools/kunit/index.rst）是用于“白箱”测
+试的一个完整的内核内部系统：因为测试代码是内核的一部分，所以它能够访
+问用户空间不能访问到的内部结构和功能。
+
+因此，KUnit测试最好针对内核中较小的、自包含的部分，以便能够独立地测
+试。“单元”测试的概念亦是如此。
+
+比如，一个KUnit测试可能测试一个单独的内核功能（甚至通过一个函数测试
+一个单一的代码路径，例如一个错误处理案例），而不是整个地测试一个特性。
+
+这也使得KUnit测试构建和运行非常地快，从而能够作为开发流程的一部分被
+频繁地运行。
+
+有关更详细的介绍，请参阅KUnit测试代码风格指南
+Documentation/dev-tools/kunit/style.rst
+
+kselftest（Documentation/dev-tools/kselftest.rst），相对来说，大量用
+于用户空间，并且通常测试用户空间的脚本或程序。
+
+这使得编写复杂的测试，或者需要操作更多全局系统状态的测试更加容易（诸
+如生成进程之类）。然而，从kselftest直接调用内核函数是不行的。这也就
+意味着只有通过某种方式（如系统调用、驱动设备、文件系统等）导出到了用
+户空间的内核功能才能使用kselftest来测试。为此，有些测试包含了一个伴
+生的内核模块用于导出更多的信息和功能。不过，对于基本上或者完全在内核
+中运行的测试，KUnit可能是更佳工具。
+
+kselftest也因此非常适合于全部功能的测试，因为这些功能会将接口暴露到
+用户空间，从而能够被测试，而不是展现实现细节。“system”测试和
+“end-to-end”测试亦是如此。
+
+比如，一个新的系统调用应该伴随有新的kselftest测试。
+
+代码覆盖率工具
+==============
+
+支持两种不同代码之间的覆盖率测量工具。它们可以用来验证一项测试执行的
+确切函数或代码行。这有助于决定内核被测试了多少，或用来查找合适的测试
+中没有覆盖到的极端情况。
+
+:doc:`gcov` 是GCC的覆盖率测试工具，能用于获取内核的全局或每个模块的
+覆盖率。与KCOV不同的是，这个工具不记录每个任务的覆盖率。覆盖率数据可
+以通过debugfs读取，并通过常规的gcov工具进行解释。
+
+:doc:`kcov` 是能够构建在内核之中，用于在每个任务的层面捕捉覆盖率的一
+个功能。因此，它对于模糊测试和关于代码执行期间信息的其它情况非常有用，
+比如在一个单一系统调用里使用它就很有用。
+
+动态分析工具
+============
+
+内核也支持许多动态分析工具，用以检测正在运行的内核中出现的多种类型的
+问题。这些工具通常每个去寻找一类不同的缺陷，比如非法内存访问，数据竞
+争等并发问题，或整型溢出等其他未定义行为。
+
+如下所示：
+
+* kmemleak检测可能的内存泄漏。参阅
+  Documentation/dev-tools/kmemleak.rst
+* KASAN检测非法内存访问，如数组越界和释放后重用（UAF）。参阅
+  Documentation/dev-tools/kasan.rst
+* UBSAN检测C标准中未定义的行为，如整型溢出。参阅
+  Documentation/dev-tools/ubsan.rst
+* KCSAN检测数据竞争。参阅 Documentation/dev-tools/kcsan.rst
+* KFENCE是一个低开销的内存问题检测器，比KASAN更快且能被用于批量构建。
+  参阅 Documentation/dev-tools/kfence.rst
+* lockdep是一个锁定正确性检测器。参阅
+  Documentation/locking/lockdep-design.rst
+* 除此以外，在内核中还有一些其它的调试工具，大多数能在
+  lib/Kconfig.debug 中找到。
+
+这些工具倾向于对内核进行整体测试，并且不像kselftest和KUnit一样“传递”。
+它们可以通过在启用这些工具时运行内核测试以与kselftest或KUnit结合起来：
+之后你就能确保这些错误在测试过程中都不会发生了。
+
+一些工具与KUnit和kselftest集成，并且在检测到问题时会自动打断测试。
+
-- 
2.25.1

