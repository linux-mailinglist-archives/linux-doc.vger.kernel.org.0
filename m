Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1984810FB8
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2019 01:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfEAXDw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 May 2019 19:03:52 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:54486 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEAXDw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 May 2019 19:03:52 -0400
Received: by mail-yw1-f74.google.com with SMTP id d71so1085960ywd.21
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2019 16:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=D2ed1P31yZM+QgJhlTzUd+8uEk27FFwdOzf2d998Bjo=;
        b=m4vpSF6hFQAvyyKEfmi7ffOWm5Cf8YCWIkxIT3+iDVpIWfsS1ULEGwFu6Ost8hat7u
         rnhVAV5Vv9xJT6lOo63I/DHxpQiJpkpLAZN5u2XWO0V9OZ52Ydehqa5w7vEuBON6+gXZ
         3STK4kvqQOndMzEtqqLGS2SsTTQyPWssIWHMj8ElJqdMrQ0MviI+sSHecTz/rzS/tJ10
         CF6G0RJyeUDcEjoGw8kICUMbi8yNT0pIJerdnIVD9Od+WW+ixwtgrJBY3UFTTqTO2Fw3
         Zh8c7NNZ6oqBIahVmM/STUzcD/MOIBXoqKt5JLGq4l8hekE/mIoIfmXWjCZu/3iEiU9+
         WUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=D2ed1P31yZM+QgJhlTzUd+8uEk27FFwdOzf2d998Bjo=;
        b=kc3x478Q9VKDQxVXV78dQo+y6qskZrOP3ZrwgwyWF+mtjP1qwsTaDOk0J0ykoOIJhT
         rZmWXpfmYKcdamGtLLvNlJhGwCewlrye2EfWg+KzHkL89GgsP0e+RHaCZ3V0FxO+pJKz
         7qcLA5ScMdPL9n/gIpw8C8jN6OkGi+ruKkIgf9K/d8YI56hPpnlAMjH2P01cjRpkS92p
         sk+3EDWV3CGYwJgOZ3NiHGb5BAchAC5y5DE6e/oa3JHMZ9YSPgh+bdJQ68AT4eAAhx1v
         c9dgnaYGBVIH/JFs7JWPsNoxLIdswHolCBEY+afWSwJul7cz1zELB6Jsfbxu7DGBUipU
         Sqmg==
X-Gm-Message-State: APjAAAWuCy1HPRL2AwKn2WCSakwdmgAPeLOGE7HzihIcp3wvFgm8jZyb
        p+HtSEoRu8rYVISgaLb7n2Fozrb5bRlhNFR1TmjbyA==
X-Google-Smtp-Source: APXvYqyFMKmsofIlGtyIYxY2auw/Yjye1Kqb5EY69r+kXArsnv/jL7sTkqGRu0OAeuaZKfIN87CHtxO88oGy68C0yADwLw==
X-Received: by 2002:a25:6649:: with SMTP id z9mr362486ybm.25.1556751830941;
 Wed, 01 May 2019 16:03:50 -0700 (PDT)
Date:   Wed,  1 May 2019 16:01:15 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 06/17] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, richard@nod.at, rientjes@google.com,
        rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
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
index 2b99679148dc7..77368f498d84c 100644
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
2.21.0.593.g511ec345e18-goog

