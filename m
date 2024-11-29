Return-Path: <linux-doc+bounces-31487-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AF39D66CC
	for <lists+linux-doc@lfdr.de>; Sat, 23 Nov 2024 01:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 069C416133D
	for <lists+linux-doc@lfdr.de>; Sat, 23 Nov 2024 00:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26DA364BA;
	Sat, 23 Nov 2024 00:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NihGDptW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30FA282F1
	for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2024 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321168; cv=none; b=EA+45VTe4OOWZ4CDyyqjDa+B0K/jiGXuWNFVEqbZK7MbxdDZ9UhCrs8QF7Pfa4oZ8lKb6GxXRT/hWPsJuYdomIa4Br93W7m113K4wEbVyZLa2kJhNOSRrgza4tNXQn8/D3kM24UtwRrb05nr+33Qc7wI/9gwEE0f87G5K9s3WPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321168; c=relaxed/simple;
	bh=PQ7BWLWokR6IGFsP7MriMLRRm+M2pMmO0KrDpLKXuSE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nIaPnghr+TOOhQhR+keeCJIZBaVuZaULG32WstsALPXB+MFgXAfqndwZjc0EnxO9PKn9wo6VqQ4KmjypJPe4vF1FG0yRff1xmovmd5Q7K3r2+59e6rYJ79Apmc8I+TDrSLz6FArTYAt6oTl9+5oc+AKxnvHcC6wWfHGmAtlZOkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NihGDptW; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3891f31330so4965536276.3
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 16:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321166; x=1732925966; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
        b=NihGDptW9vpAuiqofIJu9xrjbb668IEeziLlXNVE1nj6gRo7lRGbmNH+ZpsxEcaFT7
         Pm77HjX4yGO9QbILF1TeEXSNIaIgUWhN+Ot1DgKFNjUTabznvNJVHmtXQ5TOoafnhN9d
         MhxLBxuiIr431DMrKorX1JXN54IWfJB7f0PaDidBweR3dL/ig0JYfIBXBPRafVcNryiq
         r2TrqYv6KaBVqBvb/6My58C0AH3LRO/A6iWYuLaIhCZ02haA+xorOV870ML9IeBL1/hH
         BCREJ7fVPtze2ZUdoJSf8WxoBb9/x9M7RucvWA+e++PJ0u2SxjbfE+QQLKUjtkT3QQbc
         Id/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321166; x=1732925966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
        b=nsnYkM6OU0hxxNk85z2hYu5LcniW/Wr2m35cvVhYCRorV5rKOGPL4+mgSKP6RX+0+n
         hnjQPPbMOrAM2w3RJeTs5vFeYnn6GnPj4wMrFR48w5WH58miLGdPzdiBpsF+LctK/6oc
         TXOpaHPKD0FO3ejHU/GTo1zogcGJqGStAJJLXPyPmy0J4qlvckyPk9JXQhgYU2B5ljQj
         iz6YiOimTEHZ3BB/XvWV7zzp28aiS4jmbb3ICax1x4VOwknfaBNwpN4VLylKLCYydDHX
         mePX18As7P7ggmZF1xq0R/IkWK6E7L1+ZWCkZSu0r91jA+1KaNP5j0n7AcRuR3GK8i4v
         +yiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVua99n4y6Uy6oLK54Gxzw/vXt6y/eswurw5AbAlBlOs2brIxvcNSpBG+Fbt8PvPHA4lG6V4sTVamk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBot26LyarR6KdgpvuRzfwKy1rSEeQnz0w2U411gRaX3Dp7tSQ
	vwoA4A1E4mWVv+4jtSMs+1ONU3RMrvawZ/fm39YsoLIgPcFAqlmciowV0Ni/PqkIkcxRzaoX6dO
	tDOgDVw==
X-Google-Smtp-Source: AGHT+IFASTUqLlC21MX7tf98zKEIqUbvVG9QZO9snVRK1MZEWyuq2nupvFJacSFrArEoQiOGv1QJT6Re3Cl/
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:8c85:0:b0:e2e:3401:ea0f with SMTP id
 3f1490d57ef6-e38f8be09dbmr2980276.7.1732321165984; Fri, 22 Nov 2024 16:19:25
 -0800 (PST)
Date: Sat, 23 Nov 2024 00:19:02 +0000
In-Reply-To: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v9-5-bc0403f054bf@google.com>
Subject: [PATCH v9 5/5] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sami Tolvanen <samitolvanen@google.com>

Previously, two things stopped Rust from using MODVERSIONS:
1. Rust symbols are occasionally too long to be represented in the
   original versions table
2. Rust types cannot be properly hashed by the existing genksyms
   approach because:
	* Looking up type definitions in Rust is more complex than C
	* Type layout is potentially dependent on the compiler in Rust,
	  not just the source type declaration.

CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
it to do so by selecting both features.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig  |  3 ++-
 rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..2cfbefe0933ed129fdc1cca4121183e6285840d3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1956,7 +1956,8 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
+	select EXTENDED_MODVERSIONS if MODVERSIONS
+	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/rust/Makefile b/rust/Makefile
index 9da9042fd62796ddb852f4bf7cf46d70f0b8ca97..397ce424a0509c2a1b4ebccd5d430b86b4ecbac6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -316,10 +316,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(NM) -p --defined-only $< \
-		| awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -388,11 +389,36 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+ifdef CONFIG_MODVERSIONS
+cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
+	$(call rust_exports,$@,"%s\n",$$3) | \
+	scripts/gendwarfksyms/gendwarfksyms \
+		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
+		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
+		$@ >> $(dot-target).cmd)
+endif
+
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gendwarfksyms)
 endef
 
+define rule_rust_cc_library
+	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
+	$(call cmd,gendwarfksyms)
+endef
+
+# helpers.o uses the same export mechanism as Rust libraries, so ensure symbol
+# versions are calculated for the helpers too.
+$(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
+	+$(call if_changed_rule,rust_cc_library)
+
+# Disable symbol versioning for exports.o to avoid conflicts with the actual
+# symbol versions generated from Rust objects.
+$(obj)/exports.o: private skip_gendwarfksyms = 1
+
 $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
@@ -404,13 +430,16 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
+$(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
@@ -422,6 +451,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/uapi.o: private rustc_target_flags = --extern ffi
+$(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
     $(obj)/uapi/uapi_generated.rs FORCE

-- 
2.47.0.371.ga323438b13-goog


