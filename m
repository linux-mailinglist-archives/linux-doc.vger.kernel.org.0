Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E752F5160
	for <lists+linux-doc@lfdr.de>; Wed, 13 Jan 2021 18:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbhAMRrI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jan 2021 12:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbhAMRrF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 12:47:05 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E4FC0617A2
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 09:46:25 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id m8so2085424qvk.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 09:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=yq6e8x21iFfAp9S42XT6RWdIoTYB1pOUmyd5Btj/OhU=;
        b=pXW9uEoybzqoIj0ClsaeHWBWA70T3dk9LfKY4KehGv2sIBRW6pt8trALyhItVbGu4H
         9tLwKT/COHsIiaqB4pJVIVniXq5cKs9Jayt48MPlN/dlQa52Z3x7BbzjrXeOJhSJNVSy
         C8Dfr5edOHoTchOEWA7hSR0dC6LwSeVpW98o/pg+Ud8BUftfN2sj8pGs4UurxqTHzsqh
         QgfEyyP0jf0ZM6pNzVfSigllz8uB32MYTPSv6MYf9RIbRw0Wzms9Eywmz1PNMLRGPQ7E
         W2c77ChlpCl5i2IgRm0DkoGSl+j2hywom8fhmqkyoptnglr1aBwcSCE6UpO1h5K5tQQf
         GyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yq6e8x21iFfAp9S42XT6RWdIoTYB1pOUmyd5Btj/OhU=;
        b=GRRG2UP3DAdTc1UTXXdGJwI3OZ1W9R9+5H6h5aTA+4aP3ZpdABrlZXhNWgpwU57vrF
         KxbFsBdMLZlVg3OXcPvTQ6CUte0afYKtwv1CvrxJL7mcT/Wgtk4qJbaz3WRX5oe3mfiZ
         Skt3V7w5Qj3o9xU9uWPYb6lPKp4TpFLmxGi64Ss85XzkwcoohCEjrUElKjXkydHqAOa3
         ya4gqFzigv4hLn1LVez1Id63jYIbjK8ZdgmkL2tgOIB3CBxcZ9+NwGzyB0L9xgJ9rGAd
         m+vRb8cO4HzrtKcsBjnnF754iJ8HCmNHMO3uk9XIUKsd2DRKYl3aGQkXsRFuRJBwWS7Y
         w7PA==
X-Gm-Message-State: AOAM531vDk7QxYiCceBN7V76pFMuIJAMcgCozFn/03f4/KOEnG8ApYrR
        3PNPRW4Y8JqeeFuuwYIs7GyQgAwEZ1bXohNdq30=
X-Google-Smtp-Source: ABdhPJzS7C3fXkCFtTS1k+n5KJxSa8FK7Odsr7nIM4YbAujjTqK+Vcd3DdI5pG4jpzHCj32dv7hQovKq7ag/NYZGHrQ=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:584:: with SMTP id
 126mr4753855ybf.112.1610559983954; Wed, 13 Jan 2021 09:46:23 -0800 (PST)
Date:   Wed, 13 Jan 2021 09:46:20 -0800
In-Reply-To: <20210113165923.acvycpcu5tzksbbi@treble>
Message-Id: <20210113174620.958429-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210113165923.acvycpcu5tzksbbi@treble>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH] Documentation: asm-annotation: clarify .L local symbol names
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Mark Brown <broonie@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use more precise language and move the text to a region in the docs to
show that this constraint is not just for SYM_CODE_START*.

Suggested-by: Mark Brown <broonie@kernel.org>
Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/asm-annotations.rst | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/asm-annotations.rst b/Documentation/asm-annotations.rst
index e711ff98102a..76424e0431f4 100644
--- a/Documentation/asm-annotations.rst
+++ b/Documentation/asm-annotations.rst
@@ -100,6 +100,11 @@ Instruction Macros
 ~~~~~~~~~~~~~~~~~~
 This section covers ``SYM_FUNC_*`` and ``SYM_CODE_*`` enumerated above.
 
+``objtool`` requires that all code must be contained in an ELF symbol. Symbol
+names that have a ``.L`` prefix do not emit symbol table entries. ``.L``
+prefixed symbols can be used within a code region, but should be avoided for
+denoting a range of code via ``SYM_*_START/END`` annotations.
+
 * ``SYM_FUNC_START`` and ``SYM_FUNC_START_LOCAL`` are supposed to be **the
   most frequent markings**. They are used for functions with standard calling
   conventions -- global and local. Like in C, they both align the functions to
@@ -153,15 +158,6 @@ This section covers ``SYM_FUNC_*`` and ``SYM_CODE_*`` enumerated above.
   To some extent, this category corresponds to deprecated ``ENTRY`` and
   ``END``. Except ``END`` had several other meanings too.
 
-  Developers should avoid using local symbol names that are prefixed with
-  ``.L``, as this has special meaning for the assembler; a symbol entry will
-  not be emitted into the symbol table. This can prevent ``objtool`` from
-  generating correct unwind info. Symbols with STB_LOCAL binding may still be
-  used, and ``.L`` prefixed local symbol names are still generally useable
-  within a function, but ``.L`` prefixed local symbol names should not be used
-  to denote the beginning or end of code regions via
-  ``SYM_CODE_START_LOCAL``/``SYM_CODE_END``.
-
 * ``SYM_INNER_LABEL*`` is used to denote a label inside some
   ``SYM_{CODE,FUNC}_START`` and ``SYM_{CODE,FUNC}_END``.  They are very similar
   to C labels, except they can be made global. An example of use::
-- 
2.30.0.284.gd98b1dd5eaa7-goog

