Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B334E3B2B12
	for <lists+linux-doc@lfdr.de>; Thu, 24 Jun 2021 11:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhFXJIT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Jun 2021 05:08:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58658 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229918AbhFXJIR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Jun 2021 05:08:17 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LwStRgo_0WAA--.5330S2;
        Thu, 24 Jun 2021 17:05:53 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 0/8] docs/zh_CN: add infiniband translation.
Date:   Thu, 24 Jun 2021 17:06:49 +0800
Message-Id: <cover.1624525360.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0LwStRgo_0WAA--.5330S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyUCr4rWF4rKw4UXFykAFb_yoW8Cr13pF
        n7KryfK3WUAF1akw4fGFW7JF4fJ3WxG398Jr92qwn5tFsYqw4Fqrn0k34jgFWxtr18Xa15
        Xr4Fgr1DW3yxCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUeLvtDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

translation linux-next/Documentation/infiniband/* into Chinese.

Yanteng Si (8):
  docs/zh_CN: add infiniband index translation
  docs/zh_CN: add infiniband core_locking translation
  docs/zh_CN: add infiniband ipoib translation
  docs/zh_CN: add infiniband opa_vnic translation
  docs/zh_CN: add infiniband sysfs translation
  docs/zh_CN: add infiniband tag_matching translation
  docs/zh_CN: add infiniband user_mad translation
  docs/zh_CN: add infiniband user_verbs translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../zh_CN/infiniband/core_locking.rst         | 114 ++++++++++++
 .../translations/zh_CN/infiniband/index.rst   |  39 +++++
 .../translations/zh_CN/infiniband/ipoib.rst   | 110 ++++++++++++
 .../zh_CN/infiniband/opa_vnic.rst             | 155 +++++++++++++++++
 .../translations/zh_CN/infiniband/sysfs.rst   |  20 +++
 .../zh_CN/infiniband/tag_matching.rst         |  62 +++++++
 .../zh_CN/infiniband/user_mad.rst             | 163 ++++++++++++++++++
 .../zh_CN/infiniband/user_verbs.rst           |  71 ++++++++
 9 files changed, 735 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/core_locking.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/ipoib.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/opa_vnic.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/sysfs.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/tag_matching.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/user_mad.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/user_verbs.rst

-- 
2.27.0

