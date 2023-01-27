Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5FC767DDB9
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jan 2023 07:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbjA0Gkd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Jan 2023 01:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjA0GkV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 01:40:21 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A77F6BBDB;
        Thu, 26 Jan 2023 22:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Sender:Reply-To:Content-ID:Content-Description;
        bh=prJFFnuAiUXQdRC1PgWpjhLkRPaYfQrgleVAIYdHgzU=; b=LR5gJJr7AASyucFdQvWC3xWx1J
        O/N3GP7+uQZIZEWF8hwwipU+dOnZKBecFeNZg9bD3mr9nCFruhm/3lyL70GH43R5St9YN9StzHV6a
        JadW58JoIdeKsPu26CVL25BtumVGwziapWk/q94C1T5CLOF7dvKBGdRoZYChKLzrcP1SK+/J/c/KE
        ZvmrgqRB8co5cfcOAtEj/1YqMXbe9PH57hH10IW581RQWoBU+Vme/l8elVn4IoA6r6daDEW3/wUZW
        msBOKi3ePvBmBUodHzUyyjppQYMN3Xw0E28MjzQPbvow2jlIubI4lqVAo7nJ8R5cdTh0pUBffnmXz
        bYHuj8aA==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pLIPK-00DM0u-Jl; Fri, 27 Jan 2023 06:40:18 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Miaohe Lin <linmiaohe@huawei.com>, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 18/35] Documentation: mm: correct spelling
Date:   Thu, 26 Jan 2023 22:39:48 -0800
Message-Id: <20230127064005.1558-19-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct spelling problems for Documentation/mm/ as reported
by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/mm/hmm.rst      |    4 ++--
 Documentation/mm/hwpoison.rst |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -- a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -416,10 +416,10 @@ can be used to make a memory range inacc
 
 This replaces all mappings for pages in the given range with special swap
 entries. Any attempt to access the swap entry results in a fault which is
-resovled by replacing the entry with the original mapping. A driver gets
+resolved by replacing the entry with the original mapping. A driver gets
 notified that the mapping has been changed by MMU notifiers, after which point
 it will no longer have exclusive access to the page. Exclusive access is
-guranteed to last until the driver drops the page lock and page reference, at
+guaranteed to last until the driver drops the page lock and page reference, at
 which point any CPU faults on the page may proceed as described.
 
 Memory cgroup (memcg) and rss accounting
diff -- a/Documentation/mm/hwpoison.rst b/Documentation/mm/hwpoison.rst
--- a/Documentation/mm/hwpoison.rst
+++ b/Documentation/mm/hwpoison.rst
@@ -50,7 +50,7 @@ of applications. KVM support requires a
 For the KVM use there was need for a new signal type so that
 KVM can inject the machine check into the guest with the proper
 address. This in theory allows other applications to handle
-memory failures too. The expection is that near all applications
+memory failures too. The expectation is that near all applications
 won't do that, but some very specialized ones might.
 
 Failure recovery modes
