Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE2F179887
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2020 20:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgCDTD3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Mar 2020 14:03:29 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46496 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbgCDTD3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Mar 2020 14:03:29 -0500
Received: by mail-pf1-f196.google.com with SMTP id o24so1408695pfp.13
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 11:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5TjbY4GEQcUBSuOZ3RlaB1Ghuf3vDqDXE20DOsWONH0=;
        b=lv5XmrPOoGKdCPO/GpdsKXBp9iLUqDpmu2DPMA3TlPDemcOpuemqp5eieDPfz+t7Il
         LNN69mMJ6aaxOZzYEsGXWs02yKsHy8OpSdhH6uwUy1G+IWb89y+qhOoqkvef8uvOWjSg
         MCDJE1HLXFcecJXaIleOmpvfLPnhqgj4y0+xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5TjbY4GEQcUBSuOZ3RlaB1Ghuf3vDqDXE20DOsWONH0=;
        b=iWgqC6zbOQrgLl01+dlvCRORe6NoHUplBaN1J90aD0csIe+jT9JxCnbDuPJIJKR8EM
         75Y42rg3YxcDa7oUrT9HrMJeWTWpUExzWFlXPs4Ci5rPa/K16Zxlmz7rJHdMvpQiERuM
         suzQsWXorlVj2SLLkxqleII/PjTgPgbtmylD2xGDrpL4wUsDOkivYol1XKKGmCOIOxnT
         lqmBgz0Mp1ECBRtTZuZTOKlAW3S8yjddrYYmNVMunXYwesjNOcZMCh4q19y+4soStfuN
         Hbr2bDlg0M26QIxUqrHvtpIdt5JDjj2gkb61YKb5fkfQTAxkoFBqGipEy4q2TC/ao0vB
         cagA==
X-Gm-Message-State: ANhLgQ3JE3Y9jSV7IOOZHkElVvpw3gnmhFJQrtxz5+F/hLs38fDDf5M0
        KAU4MhPo4uK3+Dbkdq/Og+JXdyh0K4g=
X-Google-Smtp-Source: ADFU+vsVcBfZ2QwQDf3QDE8S0SgijoH1lmHzLI+CblXB0MxvcDpeHgHCnUP0kbb+4jz5YRecrQczFQ==
X-Received: by 2002:a63:ce42:: with SMTP id r2mr4075199pgi.106.1583348606353;
        Wed, 04 Mar 2020 11:03:26 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x65sm16783249pfd.34.2020.03.04.11.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 11:03:25 -0800 (PST)
Date:   Wed, 4 Mar 2020 11:03:24 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: deprecated.rst: Clean up fall-through details
Message-ID: <202003041102.47A4E4B62@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add example of fall-through, list-ify the case ending statements, and
adjust the markup for links and readability. While here, adjust
strscpy() details to mention strscpy_pad().

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/process/deprecated.rst | 48 +++++++++++++++++-----------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 179f2a5625a0..f9f196d3a69b 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -94,8 +94,8 @@ and other misbehavior due to the missing termination. It also NUL-pads the
 destination buffer if the source contents are shorter than the destination
 buffer size, which may be a needless performance penalty for callers using
 only NUL-terminated strings. The safe replacement is :c:func:`strscpy`.
-(Users of :c:func:`strscpy` still needing NUL-padding will need an
-explicit :c:func:`memset` added.)
+(Users of :c:func:`strscpy` still needing NUL-padding should instead
+use strscpy_pad().)
 
 If a caller is using non-NUL-terminated strings, :c:func:`strncpy()` can
 still be used, but destinations should be marked with the `__nonstring
@@ -122,27 +122,37 @@ memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
 
 Implicit switch case fall-through
 ---------------------------------
-The C language allows switch cases to "fall-through" when a "break" statement
-is missing at the end of a case. This, however, introduces ambiguity in the
-code, as it's not always clear if the missing break is intentional or a bug.
+The C language allows switch cases to fall through to the next case
+when a "break" statement is missing at the end of a case. This, however,
+introduces ambiguity in the code, as it's not always clear if the missing
+break is intentional or a bug. For example, it's not obvious just from
+looking at the code if `STATE_ONE` is intentionally designed to fall
+through into `STATE_TWO`::
+
+	switch (value) {
+	case STATE_ONE:
+		do_something();
+	case STATE_TWO:
+		do_other();
+		break;
+	default:
+		WARN("unknown state");
+	}
 
 As there have been a long list of flaws `due to missing "break" statements
 <https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
-"implicit fall-through".
-
-In order to identify intentional fall-through cases, we have adopted a
-pseudo-keyword macro 'fallthrough' which expands to gcc's extension
-__attribute__((__fallthrough__)).  `Statement Attributes
-<https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html>`_
-
-When the C17/C18  [[fallthrough]] syntax is more commonly supported by
+implicit fall-through. In order to identify intentional fall-through
+cases, we have adopted a pseudo-keyword macro "fallthrough" which
+expands to gcc's extension `__attribute__((__fallthrough__))
+<https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html>`_.
+(When the C17/C18  `[[fallthrough]]` syntax is more commonly supported by
 C compilers, static analyzers, and IDEs, we can switch to using that syntax
-for the macro pseudo-keyword.
+for the macro pseudo-keyword.)
 
 All switch/case blocks must end in one of:
 
-	break;
-	fallthrough;
-	continue;
-	goto <label>;
-	return [expression];
+* break;
+* fallthrough;
+* continue;
+* goto <label>;
+* return [expression];
-- 
2.20.1


-- 
Kees Cook
