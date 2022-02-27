Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77AC4C5F36
	for <lists+linux-doc@lfdr.de>; Sun, 27 Feb 2022 22:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbiB0VzI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 27 Feb 2022 16:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiB0VzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Feb 2022 16:55:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0083F3ED3B;
        Sun, 27 Feb 2022 13:54:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 813AF61182;
        Sun, 27 Feb 2022 21:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668FDC340E9;
        Sun, 27 Feb 2022 21:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645998868;
        bh=3t/p0jjcIOQ9cnqtHEjQ0OotL7Yc14GpfGoJxO8STBo=;
        h=From:To:Cc:Subject:Date:From;
        b=fEN1qIU97LxKCmuCdc9bVegKovR9x6UfjibzNHVn1irr0D+YEfGHf0yjjfo7iHueV
         4QgkmaAV4DSyjmNuWtZeHjsRM2jMUq0GjuVX47A2MeqPhpCY1+8G+anF3UaRWe7WqW
         ZgtocMGvAP2SC692l+obVuP6XHhAGoE8FGhgR3ofJZXpmYJlkxhPaWHdsxHto9/N8X
         bNwXhbBWv6P4LAa2hH6Escq0WtJV/NIhBCMO84e2RkGvxu7TmlN3zkB6yMNAwUfCtx
         FzOUXESTY0K3zlmNMpF+/voHgGnrAVayMih5W6jj+FQE4pUuWy4UZPFPZrhf4CuvdQ
         KEQHjoNZIeq4g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-btrfs@vger.kernel.org
Subject: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
Date:   Sun, 27 Feb 2022 22:52:43 +0100
Message-Id: <20220227215408.3180023-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

During a patch discussion, Linus brought up the option of changing
the C standard version from gnu89 to gnu99, which allows using variable
declaration inside of a for() loop. While the C99, C11 and later standards
introduce many other features, most of these are already available in
gnu89 as GNU extensions as well.

An earlier attempt to do this when gcc-5 started defaulting to
-std=gnu11 failed because at the time that caused warnings about
designated initializers with older compilers. Now that gcc-5.1 is the
minimum compiler version used for building kernels, that is no longer a
concern. Similarly, the behavior of 'inline' functions changes between
gnu89 and gnu89, but this was taken care of by defining 'inline' to
include __attribute__((gnu_inline)) in order to allow building with
clang a while ago.

One minor issue that remains is an added gcc warning for shifts of
negative integers when building with -Werror, which happens with the
'make W=1' option, as well as for three drivers in the kernel that always
enable -Werror, but it was only observed with the i915 driver so far.

Nathan Chancellor reported an additional -Wdeclaration-after-statement
warning that appears in a system header on arm, this still needs a
workaround.

Since the differences between gnu99, gnu11 and gnu17 are fairly minimal
and mainly impact warnings at the -Wpedantic level that the kernel
never enables, the easiest way is to just leave out the -std=gnu89
argument entirely, and rely on the compiler default language setting,
which is gnu11 for gcc-5, and gnu1x/gnu17 for all other supported
versions of gcc or clang.

Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
Link: https://github.com/ClangBuiltLinux/linux/issues/1603
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I put the suggestion into patch form, based on what we discussed
in the thread.  I only gave it minimal testing, but it would
be good to have it in linux-next if we want to do this in the
merge window.
---
 Documentation/process/programming-language.rst             | 4 ++--
 .../translations/it_IT/process/programming-language.rst    | 4 ++--
 .../translations/zh_CN/process/programming-language.rst    | 4 ++--
 .../translations/zh_TW/process/programming-language.rst    | 4 ++--
 Makefile                                                   | 7 +++----
 arch/arm64/kernel/vdso32/Makefile                          | 3 +--
 drivers/gpu/drm/i915/Makefile                              | 1 +
 drivers/staging/greybus/tools/Makefile                     | 3 ++-
 fs/btrfs/Makefile                                          | 1 +
 scripts/Makefile.extrawarn                                 | 1 +
 10 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index ec474a70a02f..894f2a6eb9db 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -5,8 +5,8 @@ Programming Language
 
 The kernel is written in the C programming language [c-language]_.
 More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
-under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
-(including some C99 features). ``clang`` [clang]_ is also supported, see
+under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11
+(including some C17 features). ``clang`` [clang]_ is also supported, see
 docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
 
 This dialect contains many extensions to the language [gnu-extensions]_,
diff --git a/Documentation/translations/it_IT/process/programming-language.rst b/Documentation/translations/it_IT/process/programming-language.rst
index 41db2598ce11..aa21097737ae 100644
--- a/Documentation/translations/it_IT/process/programming-language.rst
+++ b/Documentation/translations/it_IT/process/programming-language.rst
@@ -10,8 +10,8 @@ Linguaggio di programmazione
 
 Il kernel è scritto nel linguaggio di programmazione C [it-c-language]_.
 Più precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ usando
-l'opzione ``-std=gnu89`` [it-gcc-c-dialect-options]_: il dialetto GNU
-dello standard ISO C90 (con l'aggiunta di alcune funzionalità da C99).
+l'opzione ``-std=gnu11`` [it-gcc-c-dialect-options]_: il dialetto GNU
+dello standard ISO C11 (con l'aggiunta di alcune funzionalità da C17).
 Linux supporta anche ``clang`` [it-clang]_, leggete la documentazione
 :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
 
diff --git a/Documentation/translations/zh_CN/process/programming-language.rst b/Documentation/translations/zh_CN/process/programming-language.rst
index 2a47a1d2ec20..58d2b3bd2d85 100644
--- a/Documentation/translations/zh_CN/process/programming-language.rst
+++ b/Documentation/translations/zh_CN/process/programming-language.rst
@@ -9,8 +9,8 @@
 ============
 
 内核是用C语言 :ref:`c-language <cn_c-language>` 编写的。更准确地说，内核通常是用 :ref:`gcc <cn_gcc>`
-在 ``-std=gnu89`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect-options>` 下编译的：ISO C90的 GNU 方言（
-包括一些C99特性）
+在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect-options>` 下编译的：ISO C11的 GNU 方言（
+包括一些C17特性）
 
 这种方言包含对语言 :ref:`gnu-extensions <cn_gnu-extensions>` 的许多扩展，当然，它们许多都在内核中使用。
 
diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index 54e3699eadf8..235de05f7e2c 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -12,8 +12,8 @@
 ============
 
 內核是用C語言 :ref:`c-language <tw_c-language>` 編寫的。更準確地說，內核通常是用 :ref:`gcc <tw_gcc>`
-在 ``-std=gnu89`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect-options>` 下編譯的：ISO C90的 GNU 方言（
-包括一些C99特性）
+在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect-options>` 下編譯的：ISO C11的 GNU 方言（
+包括一些C17特性）
 
 這種方言包含對語言 :ref:`gnu-extensions <tw_gnu-extensions>` 的許多擴展，當然，它們許多都在內核中使用。
 
diff --git a/Makefile b/Makefile
index 289ce2be8032..3ff6ba766f02 100644
--- a/Makefile
+++ b/Makefile
@@ -432,7 +432,7 @@ HOSTCXX	= g++
 endif
 
 export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
-			      -O2 -fomit-frame-pointer -std=gnu89
+			      -O2 -fomit-frame-pointer
 export KBUILD_USERLDFLAGS :=
 
 KBUILD_HOSTCFLAGS   := $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
@@ -514,8 +514,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
-		   -Werror=return-type -Wno-format-security \
-		   -std=gnu89
+		   -Werror=return-type -Wno-format-security
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
@@ -782,7 +781,7 @@ KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
-# The kernel builds with '-std=gnu89' so use of GNU extensions is acceptable.
+# The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 6c01b63ff56d..3250d0e25782 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -67,8 +67,7 @@ VDSO_CFLAGS += -DENABLE_COMPAT_VDSO=1
 VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -fno-strict-aliasing -fno-common \
                -Werror-implicit-function-declaration \
-               -Wno-format-security \
-               -std=gnu89
+               -Wno-format-security
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
 VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1b62b9f65196..1618a6e0af4e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -17,6 +17,7 @@ subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
 subdir-ccflags-y += -Wno-missing-field-initializers
 subdir-ccflags-y += -Wno-sign-compare
+subdir-ccflags-y += -Wno-shift-negative-value
 subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
diff --git a/drivers/staging/greybus/tools/Makefile b/drivers/staging/greybus/tools/Makefile
index ad0ae8053b79..a3bbd73171f2 100644
--- a/drivers/staging/greybus/tools/Makefile
+++ b/drivers/staging/greybus/tools/Makefile
@@ -12,7 +12,8 @@ CFLAGS	+= -std=gnu99 -Wall -Wextra -g \
 	    -Wredundant-decls \
 	    -Wcast-align \
 	    -Wsign-compare \
-	    -Wno-missing-field-initializers
+	    -Wno-missing-field-initializers \
+	    -Wno-shift-negative-value
 
 CC	:= $(CROSS_COMPILE)gcc
 
diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
index 4188ba3fd8c3..99f9995670ea 100644
--- a/fs/btrfs/Makefile
+++ b/fs/btrfs/Makefile
@@ -17,6 +17,7 @@ subdir-ccflags-y += $(condflags)
 subdir-ccflags-y += -Wno-missing-field-initializers
 subdir-ccflags-y += -Wno-sign-compare
 subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-shift-negative-value
 
 obj-$(CONFIG_BTRFS_FS) := btrfs.o
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 8be892887d71..650d0b8ceec3 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -36,6 +36,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-type-limits
+KBUILD_CFLAGS += -Wno-shift-negative-value
 
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
 
-- 
2.29.2

