Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7C65E6317
	for <lists+linux-doc@lfdr.de>; Thu, 22 Sep 2022 15:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbiIVNDV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Sep 2022 09:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiIVNDU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Sep 2022 09:03:20 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81BD1ADAB
        for <linux-doc@vger.kernel.org>; Thu, 22 Sep 2022 06:03:18 -0700 (PDT)
Date:   Thu, 22 Sep 2022 21:03:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1663851797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=9xUJy939eAdDhwu/B4PD1tN+oDPnQqnrOrFLcNMORUQ=;
        b=iLxxi31riLUuDlO3HFX0O1+ooZySoD6D2a54MkiyrdlbLrrqIIIU+arCZEHK6fqkUe7Qd3
        poLsdIhM9LAQI2GoYJDKbnsHvN0HLKzjJXbi6TgvpoC7znL6GstfD3wiUnyAwAH1Xsp3t0
        zNNskAManlSCaTiwwChd4czCVV38chY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH 0/2] update and a new translation in zh_CN/admin-guide
Message-ID: <cover.1663850554.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

* Update zh_CN/admin-guide/README.rst to 6.0-rc2
* Add new translation of admin-guide/bootconfig.rst

Thanks!

PS: forgot to cc maillist, so send again, sorry.

Wu XiangCheng (2):
  docs/zh_CN: Update zh_CN/admin-guide/README.rst to 6.0-rc2
  docs/zh_CN: Add new translation of admin-guide/bootconfig.rst

 .../translations/zh_CN/admin-guide/README.rst | 101 ++----
 .../zh_CN/admin-guide/bootconfig.rst          | 293 ++++++++++++++++++
 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 3 files changed, 316 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/bootconfig.rst


base-commit: a8249d62a611f398fafebbb8f6129888e98d5354
-- 
2.30.2


-- 
Wu XiangCheng	0x32684A40BCA7AEA7

