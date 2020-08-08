Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D2523F6B2
	for <lists+linux-doc@lfdr.de>; Sat,  8 Aug 2020 08:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgHHGuE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 8 Aug 2020 02:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgHHGuD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Aug 2020 02:50:03 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4ACC061756
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 23:50:03 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so2319848pfw.9
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=skKsNjbR2sJekoTD7WKJQrDhL0mkikJinH+fXZp5WE8=;
        b=ea8Mv7s+x7UdwoHVdf5SJ9Cq0u6VfhxmRBbKZte2jB2D1XEyJuycS5MwF/TICAvOG6
         wQNq3cm/44Kuh0MCS/RxFXsDUPtYAGGd/0DxZWkWGAzqzjS3HNuZFkqonQzfI++B6ZBg
         EsG+bFZpc4DozCP/f10ZiP6pH4v9azmL3TKaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=skKsNjbR2sJekoTD7WKJQrDhL0mkikJinH+fXZp5WE8=;
        b=s3RHSqEunhmG5sD2ByV7EjTgN0RsIr7dTtPClSHsjpz1LqIbzVzIGu8xhnh+8rFf05
         I2kJFnBjVze7b+02ZL7MQfciqAMbjN+r7cZPYILxvtWuPcX62hv79cnGzfHqRIx7HXRD
         Q6owYMSsJjFa3kK/P3Ea3dl+u6PPw3fQHzc/R+5isUpwmb7kOpXIdEBjZH7FQm3OcnvP
         fWgjqrtbAliiiE4NwRWE6Ut2Jqi5R288rPig5crWTEpYQInjOqsfL5JSqZvCMyJ+gN7r
         F+e8uSSkAYS9Rh0iTYA5ACocMBmEulEBPHX1MLZLV+76dvtvRjpSuNSLYJVqL49qylfg
         pmfQ==
X-Gm-Message-State: AOAM5322z/yvKd3n2Pkl9P0XqupnND9AeEW4SUkICo2zpxqey46E4Q2J
        vaXzCrH4BiyYQFbHj4y3jfV0nNo+cnw=
X-Google-Smtp-Source: ABdhPJxNkNRAvvV1SMnZ96w4Ht5xtafmTpd1uB4vQPCMQMVv4eN9p49igoUEy55OeoNMF0Xxp3RRBQ==
X-Received: by 2002:a63:d1f:: with SMTP id c31mr13975091pgl.27.1596869403032;
        Fri, 07 Aug 2020 23:50:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g5sm7294301pjx.53.2020.08.07.23.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 23:50:01 -0700 (PDT)
Date:   Fri, 7 Aug 2020 23:49:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH] docs: Fix function name trailing double-()s
Message-ID: <202008072348.3BA3DD14E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I noticed a double-() after a function name in deprecated.rst today. Fix
that one and two others in the Documentation/ tree.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/RCU/lockdep.rst                           | 2 +-
 Documentation/process/deprecated.rst                    | 2 +-
 Documentation/translations/it_IT/process/deprecated.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/lockdep.rst b/Documentation/RCU/lockdep.rst
index f1fc8ae3846a..cc860a0c296b 100644
--- a/Documentation/RCU/lockdep.rst
+++ b/Documentation/RCU/lockdep.rst
@@ -49,7 +49,7 @@ checking of rcu_dereference() primitives:
 		is invoked by both RCU-sched readers and updaters.
 	srcu_dereference_check(p, c):
 		Use explicit check expression "c" along with
-		srcu_read_lock_held()().  This is useful in code that
+		srcu_read_lock_held().  This is useful in code that
 		is invoked by both SRCU readers and updaters.
 	rcu_dereference_raw(p):
 		Don't check.  (Use sparingly, if at all.)
diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 4a9aa4f0681e..918e32d76fc4 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -142,7 +142,7 @@ only NUL-terminated strings. The safe replacement is strscpy().
 (Users of strscpy() still needing NUL-padding should instead
 use strscpy_pad().)
 
-If a caller is using non-NUL-terminated strings, strncpy()() can
+If a caller is using non-NUL-terminated strings, strncpy() can
 still be used, but destinations should be marked with the `__nonstring
 <https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html>`_
 attribute to avoid future compiler warnings.
diff --git a/Documentation/translations/it_IT/process/deprecated.rst b/Documentation/translations/it_IT/process/deprecated.rst
index e108eaf82cf6..a642ff3fdc8b 100644
--- a/Documentation/translations/it_IT/process/deprecated.rst
+++ b/Documentation/translations/it_IT/process/deprecated.rst
@@ -130,7 +130,7 @@ chi usa solo stringe terminate. La versione sicura da usare �
 strscpy(). (chi usa strscpy() e necessita di estendere la
 terminazione con NUL deve aggiungere una chiamata a memset())
 
-Se il chiamate no usa stringhe terminate con NUL, allore strncpy()()
+Se il chiamate no usa stringhe terminate con NUL, allore strncpy()
 pu� continuare ad essere usata, ma i buffer di destinazione devono essere
 marchiati con l'attributo `__nonstring <https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html>`_
 per evitare avvisi durante la compilazione.
-- 
2.25.1


-- 
Kees Cook
