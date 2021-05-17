Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34D0382753
	for <lists+linux-doc@lfdr.de>; Mon, 17 May 2021 10:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbhEQIrH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 May 2021 04:47:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38372 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235579AbhEQIrC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 04:47:02 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxucksLaJgfzwYAA--.37122S2;
        Mon, 17 May 2021 16:45:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v7 0/3] docs/zh_CN add three core api docs
Date:   Mon, 17 May 2021 16:46:12 +0800
Message-Id: <cover.1621239725.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxucksLaJgfzwYAA--.37122S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUZFWUZF1DKFW8XFy7Jrb_yoW5uFWDpa
        y7KrWaq3W5GF1Uuws7W3y8Zr1UWa4xuws8K39rXwnYqFs0krW0yw4jgFyaqas3tr1vgF1F
        vF43KFyq934jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUhdbbUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v6 -> v7:

* Translate sentences introduced by fixing build warnings.
* Pick Jiaxun's review-by tag for [patch 2-3/3]

https://lore.kernel.org/linux-doc/cover.1621062577.git.siyanteng@loongson.cn/T/#t

v5 -> v6:

* fix build warnings.

https://lore.kernel.org/linux-doc/CAEensMwf+w8aOuMqBy_wrWGBVBnVZdjKNJgS4jRQTAO4zwN1vw@mail.gmail.com/T/#t
https://lore.kernel.org/linux-doc/CAEensMzL31Lq2NTVC74hfQyPy+7mTd=74p5Kkamf4LZ_GAieLA@mail.gmail.com/T/#t

v4 -> v5:

* Pick Alex's review-by tag for [patch 1-3/3]

v3 -> v4:

Some bad translations have been modified as suggested by Jiaxun. Thank you for your review.

v2 -> v3:

* Pick Xiangcheng Wu's review-by tag for [patch 1-3/3]

* fix two original links. [1/3 and 3/3]

v1 -> v2:

* Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review

  https://lore.kernel.org/linux-doc/cover.1618836460.git.siyanteng@loongson.cn/T/#t

* As Matthew and Xiangcheng suggested:

  call kernel-doc to generate related docs (0001 and 0002).Thanks!

  I tested it on other computers (at least three) with no problem,
  But on my computers it prints 1000+ warnings, I tried to find the
  cause in the past few days but no clue.
  So, the two patches may print as follows:(maybe your computer won't print anything)

  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
  Declaration is '.. c:None:: struct list_head *prev'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
  Declaration is '.. c:None:: struct list_head *next'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
  Declaration is '.. c:None:: void (*sync)(void)'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:283: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:283.
  Declaration is '.. c:function:: void list_splice_init_rcu(struct list_head *list, struct list_head *head, void (*sync)(void))'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:283: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:283.
  Declaration is '.. c:None:: struct list_head *list'.
  ...

  I'm a little skeptical now that something's wrong with my computer.

Yanteng Si (3):
  docs/zh_CN: add core-api kernel-api.rst translation
  docs/zh_CN: add core-api printk-basics.rst translation
  docs/zh_CN: add core-api printk-formats.rst translation

 .../translations/zh_CN/core-api/index.rst     |   7 +-
 .../zh_CN/core-api/kernel-api.rst             | 369 +++++++++++
 .../zh_CN/core-api/printk-basics.rst          | 110 ++++
 .../zh_CN/core-api/printk-formats.rst         | 580 ++++++++++++++++++
 4 files changed, 1064 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/printk-formats.rst

-- 
2.27.0

