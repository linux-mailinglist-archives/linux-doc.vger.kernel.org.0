Return-Path: <linux-doc+bounces-27885-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEB9A2F2C
	for <lists+linux-doc@lfdr.de>; Thu, 17 Oct 2024 23:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43AD01F24766
	for <lists+linux-doc@lfdr.de>; Thu, 17 Oct 2024 21:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4405227B91;
	Thu, 17 Oct 2024 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pk+tRM2a"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C5227B9D
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 21:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199149; cv=none; b=MGXDejrzELRFlguwsmFBZGe0nso10TK9qOghtVuq17EEHWqDvQP5FnIqFGFtNR1P/tMUrEUEetpVrrcFKz3/13JTsBVEnm0hC8VXRCRBwmObHCY8NoBPqGtQn13Dlci+AhPn0x0EBAnIX46LOh1cUbrRCeL8TYejexzFA4DKiBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199149; c=relaxed/simple;
	bh=Y6AaG+nGQ6EPi9z2NWnfbHckcElRhYBDsn4OiQDTt30=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qbyhDUETGJVfBHkJNDC6N3Y46QmpaJB06kyy1JRZAtm+LgJ1z30AeXNmKMxhfcYpg+9Eml6VaPiuTwP34wRpbiqzoKFAepUBw4VruQGPv555creB9ppfewCiTUdaqrXLtJ3J/vbRi5RCbQoAJvlfuGvX2/vVtfiASMrcgxUCOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pk+tRM2a; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ea70bcc4a2so989002a12.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729199144; x=1729803944; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajtp5myrnkoafKCm3p/bequs3OqbdzUjrecmuAy/Zlo=;
        b=Pk+tRM2aooRmzrldjfhk6GvkncY9P1E5vMvnTm1kuBbxYsyAk6aeSpKpysSPapRcUE
         ya6fGWwP0cJH5LPd75piQSGF6ufbW6UtsIDOASyfZ74F1T7xK1lnflDjwTLEbPq8MfsZ
         hhts9i509i/EVL370mg6bO20mxHXNMzjqJ1VGsy+p2KC29XgLev6OD4zv9rm/Ghs42cp
         tW5c/kVaLciOaG3d+GdMNZZjViLHw07eDSA05VUSIi7hSwWWppYGLfWTykV4SLcWQMjS
         v/O5Fd6u92rz1zik1vgHRLY0pIJBKx+kAZ01hv1QHpNuHtL43hujP559J5fxOY3Ai9B/
         ObsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729199144; x=1729803944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajtp5myrnkoafKCm3p/bequs3OqbdzUjrecmuAy/Zlo=;
        b=RrVL7FzlBwFC8/Nv92JxLibFCkC14vp+mCv34aK/prhQDyhgYVNd1XIcurwWlcOfZ4
         4hzTi3kVuhzU962+GmgufqHiaPCHmS1OicWSL0VxFFXXMTZgPgtsrAM9Q+vLMbRd3wtZ
         t2b4G1A3BJ60HC/LakjyYv0DiXPtwYQLr4hDATmwFU9R7TiiZUL8Tqu7O2kzQL6p/FRm
         8aj9/Araa/c6TYbHhvEEtSCZHm2PBWUqeOVdDvGLn0PjPoDjgI6DT0m/6i49175tjENZ
         9ckSozWAW1R/Pc0VkXZQMV705TtNtV2w27pbbwI53IRMqOHQUUVHzTs4Fr/i6l8+B3pI
         /QmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcOJzFxIYdYVQuxaazTfaRttl/fhvZhZh0uTao6Xc8CsP8WVGFD6FDOu7+g1dDu3kzRULVACnqOAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4GZq0Qus5JVrIRoCkXNgH79VxllCrJDTHUk1QY9ta/hNt8Y4w
	jjM46r4WTNMaD2Ezrs8M4Zj7/cm2qOh9ivjT7WIq0eBHih7TlAExOEo0hC/St6gp05SoIw==
X-Google-Smtp-Source: AGHT+IGjRDkVYgyQpZQg7El4xAj5c7QPfMnfmckS6Cih/V7A/YDepan/bVLgyEeMrR3BgWArbVoNd8Ro
X-Received: from elsk.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:dbd])
 (user=elsk job=sendgmr) by 2002:a63:7d58:0:b0:7ea:8cd7:5e67 with SMTP id
 41be03b00d2f7-7eaa6cb9933mr13002a12.10.1729199143828; Thu, 17 Oct 2024
 14:05:43 -0700 (PDT)
Date: Thu, 17 Oct 2024 21:04:30 +0000
In-Reply-To: <CAH5fLgh3JyY9L6Fg+LXVguyx8iPRbHVHqTyXSfM9gq6jdWRdtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAH5fLgh3JyY9L6Fg+LXVguyx8iPRbHVHqTyXSfM9gq6jdWRdtw@mail.gmail.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241017210430.2401398-2-elsk@google.com>
Subject: [PATCH v2] rust: add PROCMACROLDFLAGS
From: HONG Yifan <elsk@google.com>
To: aliceryhl@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: elsk@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mmaurer@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

These are additional flags to be passed when linking proc macros for the
Rust toolchain. If unset, it defaults to $(HOSTLDFLAGS).

This is needed because the list of flags to link hostprogs is not
necessarily the same as the list of flags used to link libmacros.so.
When we build proc macros, we need the latter, not the
former. To distinguish between the two, introduce this new variable
to stand out from HOSTLDFLAGS used to link other host progs.

Signed-off-by: HONG Yifan <elsk@google.com>
---
v1 -> v2: Updated text in kbuild.rst as suggested by aliceryhl@google.com.

 Documentation/kbuild/kbuild.rst | 7 +++++++
 Makefile                        | 1 +
 rust/Makefile                   | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 1796b3eba37b..5ba8c4afd44b 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -91,6 +91,13 @@ HOSTRUSTFLAGS
 -------------
 Additional flags to be passed to $(HOSTRUSTC) when building host programs.

+PROCMACROLDFLAGS
+-------------
+Additional flags to be passed when linking Rust proc macros. Since proc macros
+are loaded by rustc at build time, they must be linked in a way that is
+compatible with the rustc toolchain being used. If unset, it defaults to
+$(HOSTLDFLAGS).
+
 HOSTLDFLAGS
 -----------
 Additional flags to be passed when linking host programs.
diff --git a/Makefile b/Makefile
index b77ac70f8be4..89cdf0eca7de 100644
--- a/Makefile
+++ b/Makefile
@@ -469,6 +469,7 @@ KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS) \
 		       -I $(srctree)/scripts/include
 KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
 			-Zallow-features= $(HOSTRUSTFLAGS)
+KBUILD_PROCMACROLDFLAGS := $(or $(PROCMACROLDFLAGS),$(HOSTLDFLAGS))
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)

diff --git a/rust/Makefile b/rust/Makefile
index 3678e79317f1..95ceaba35975 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -322,7 +322,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
-		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
+		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
--
2.47.0.rc1.288.g06298d1525-goog


