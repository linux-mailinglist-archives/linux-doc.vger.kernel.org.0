Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF20A3AF923
	for <lists+linux-doc@lfdr.de>; Tue, 22 Jun 2021 01:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhFUXVN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Jun 2021 19:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhFUXVM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 19:21:12 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2881C061767
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id z6-20020a0cfec60000b0290263740e5b2aso956009qvs.6
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rjB5gl/OyQ1mYdw8idF1qN2FUIQyyWYhNBNVDiw+uvU=;
        b=Fx/5r3tL8gCFAJtd4rl2DAmVtq/Hcag/FqOXfbZTiumpQvK7IpCiwSoO4s2r3Pg4kG
         DjgqzwZbw38zdRoLWEIFqajlU0HyzgooEI43aq0nXoB3xcXQkKM3CW4mob90gDiP9WK2
         hHrDsQKAVpOhYF9U5V1S3QpzKlSx5rhNkESwPwwewApEl53L6IrVLx7uL19uIuHFuiOo
         6lolqnl8of8SHB6qJI16xb6wkcrAAnCL9U5ewHgz0C+f0vibak7dCVxmIJY/mPLRKbjo
         OXIV6b2Ew6sgl0PP+wDqL797jk1u3lvn2QWTbcBZRMFj+LYkj51nlwS6pHOjBj5NB8Kb
         CkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rjB5gl/OyQ1mYdw8idF1qN2FUIQyyWYhNBNVDiw+uvU=;
        b=Vitknpnj2DDujLWl4QU8KkJzkIjR6YHNbeTZpQbuF0PIuEvEB2eTVXl0kn96EuNi1Y
         9ZW0DmQYcyeKghUGnAInCjtygvg6oTUtLngCTS+bLSf9jhQGehJXMG3n2LfQuDIMAGSh
         cFJFfqm9HUI1NEQ0DhpJ60u8Vc62T7YEzeaehF3aVMxwq5XAuqcl7bdTL6xMRiZusyxk
         X6+uZGYH7Wugqkd2VW4onXEqB2cvIebQbYAyX7jyxlMpYT1falSKZ+6g6Jg+HbWjDDVW
         lz7Si1WJY+EUD8wpa8zkGnX6samQcfrI8kulAgYnbgLYICKcAYYQx3UK22uGqZHiRibH
         aPxw==
X-Gm-Message-State: AOAM531P7A0TQmSH72ZnQRghH0jLfB5jdLtweudc7OngNwfaiDAHLsau
        P13yKFTu2KzrRmecV+OoqdgJfvWjLgyg5CN4XSo=
X-Google-Smtp-Source: ABdhPJyXTOipiZC/T1Rh2LGkpucm8jFtJ6//dT3xhNEPf1PixdbviPLfrtW8WqYG2ren4BZlrLSA6JcmNbcRdaRhqhk=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:dfd:ebf9:4ec7:1783])
 (user=ndesaulniers job=sendgmr) by 2002:a25:aea4:: with SMTP id
 b36mr794382ybj.428.1624317536807; Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:18:21 -0700
In-Reply-To: <20210621231822.2848305-1-ndesaulniers@google.com>
Message-Id: <20210621231822.2848305-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210621231822.2848305-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH v2 2/3] compiler_attributes.h: cleanups for GCC 4.9+
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since
commit 6ec4476ac825 ("Raise gcc version requirement to 4.9")
we no longer support building the kernel with GCC 4.8; drop the
preprocess checks for __GNUC_MINOR__ version. It's implied that if
__GNUC_MAJOR__ is 4, then the only supported version of __GNUC_MINOR__
left is 9.

Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/compiler_attributes.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 225511b17223..84b1c970acb3 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -27,7 +27,7 @@
  */
 #ifndef __has_attribute
 # define __has_attribute(x) __GCC4_has_attribute_##x
-# define __GCC4_has_attribute___assume_aligned__      (__GNUC_MINOR__ >= 9)
+# define __GCC4_has_attribute___assume_aligned__      1
 # define __GCC4_has_attribute___copy__                0
 # define __GCC4_has_attribute___designated_init__     0
 # define __GCC4_has_attribute___externally_visible__  1
@@ -35,8 +35,8 @@
 # define __GCC4_has_attribute___noclone__             1
 # define __GCC4_has_attribute___no_profile_instrument_function__ 0
 # define __GCC4_has_attribute___nonstring__           0
-# define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
-# define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >= 9)
+# define __GCC4_has_attribute___no_sanitize_address__ 1
+# define __GCC4_has_attribute___no_sanitize_undefined__ 1
 # define __GCC4_has_attribute___fallthrough__         0
 #endif
 
-- 
2.32.0.288.g62a8d224e6-goog

