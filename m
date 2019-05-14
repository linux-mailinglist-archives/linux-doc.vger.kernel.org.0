Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88CE1E497
	for <lists+linux-doc@lfdr.de>; Wed, 15 May 2019 00:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfENWSs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 May 2019 18:18:48 -0400
Received: from mail-oi1-f201.google.com ([209.85.167.201]:35220 "EHLO
        mail-oi1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfENWSr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 18:18:47 -0400
Received: by mail-oi1-f201.google.com with SMTP id h17so270582oih.2
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6hh/O85dR1gwknNQHXWXeYuPNs8/qiARAkO8t2jh/6Y=;
        b=pktwE2H0lkcFv7/9jqXmIsyveGdsCVelMrwl3cqH3txcAlfCnUeZ37dhZxF8UH+mJj
         Snw5Jm8u4RQjcqSq7yPzBmSgLMf/1eHtUlumh+NpwywZFZDIN1anDe6OB6AlKTg141kA
         5mI1+qqW99DY990j90tKYxM+9soRcSIaIhwSETrcMPC5Fw2Hvjbtp+qRQT1t5L4gJ/zU
         jXLH/gHr2MsYOB5YVs8dlqDoP6gWf7kgzgteMmFFQlTaNoF/V4ckEVaF34U+xTEonucY
         iQ1EkqEBHKa0Jt4fbn5sxK9Ov2Oy8pgv7eTNHj+PLXPxFNqmry8DRB3TebSutP/GbjtC
         C76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6hh/O85dR1gwknNQHXWXeYuPNs8/qiARAkO8t2jh/6Y=;
        b=ns/Ucfk3MBwqYoBw5SOxob1omyim4vpkWoJhxvxIcStNl/MHyLVGyABQa7il5JhLdD
         Vb1BM1kjxnav8oQKJtSBRZFb6/ais2E1MF5uO41D0zX/9r3nKY5X+UDy/gfGCU7+474X
         9NVpfGMbao3EqaRn3WktFETYnDfbCdK/Hd6SUeEOrps0UkqrJn0HIfuXeQf2xWuDtGgk
         /CPAZZjvupxwppoo4dZR1Gd1k8BsfyRL5IDsJT49vk+YJy35XC2dE0IzrYiAvgNFwK1i
         7F0n3v5n1X6p8dq1XEolM3njE3h9i0dUDmiWQFwbnD9RtafHYKGclg8tAEDvrleYJhui
         +Czg==
X-Gm-Message-State: APjAAAXSmoS/x0KzZkLJzeiEG8+JHsA6uWkFG01m+fBauyRX3lXWTdSq
        RfU4t7PRNK4mIYdYFvazcWLtV1cE3WwoKLxQ9AUqFw==
X-Google-Smtp-Source: APXvYqwM3IIpnD+1gT/FoKuuZ38KlKypDLYmem1eGy8VXLyPhIPBqWZAB3GDuzAEJQCCRqZLoC5ufBjoXToe9b3uGCSmBw==
X-Received: by 2002:aca:49d8:: with SMTP id w207mr4531843oia.19.1557872326590;
 Tue, 14 May 2019 15:18:46 -0700 (PDT)
Date:   Tue, 14 May 2019 15:16:59 -0700
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
Message-Id: <20190514221711.248228-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v4 06/18] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 Kconfig  | 2 ++
 Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 48a80beab6853..10428501edb78 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index 26c92f892d24b..2ea87a8fe770d 100644
--- a/Makefile
+++ b/Makefile
@@ -969,7 +969,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.1020.gf2820cf01a-goog

