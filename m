Return-Path: <linux-doc+bounces-31482-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D79D66B1
	for <lists+linux-doc@lfdr.de>; Sat, 23 Nov 2024 01:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40402B21BC4
	for <lists+linux-doc@lfdr.de>; Sat, 23 Nov 2024 00:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B115DA954;
	Sat, 23 Nov 2024 00:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u05keqOz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACA17583
	for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2024 00:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321160; cv=none; b=SDugLjF1WTZcMALCvGomRF0OmhQvVeTHuMfibcX1oOEe+enIwrsrPOLH2KR/AMBRN/tKa1NzGrTHvwLJ+mv1sY4jX/WZEwVYVCQ6nM+n1xoZFuoaXTy+ernlz6MvSGDjHbBnV81IiKW6612r7OwYIi/BR6hHNmGnX7VijGb+Bgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321160; c=relaxed/simple;
	bh=AHCdX8/xinJ6RwqG4IEXhJMejLQ5bAM2pfpvjXgd0xQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EJGgAAMqtJ1Tl/cOEqTnnwwQm3xNjNDGIkOeHCuD//Aom43nSiikG2v7ZBV0ujOlHIROnbC+Ays9w9155CJuTUXwT4uXr3VC38UEFq9w18+oYrCTDL0hDAqvOTqDygU+L32Ub+/wFYxFDOeaXRB+PW4hzrFESlwCKCY4V3OD+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u05keqOz; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee6a218044so50062787b3.3
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 16:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321157; x=1732925957; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PzyWd1Ozzz3SQNuZyfgRru/W6uNkQPbCi35gmVjFow4=;
        b=u05keqOz5nlqphgC8jXMohDEaw+eqrUgoaqerbVWzKTGIkyZYNa+o1jTqD+exgm0KQ
         Z047FbK22c+g0m1FuKURu2q0HrvB0vbG/aynHk5QUfU6b5WRKg3qWnhIlb7Y9iET8yjC
         gisswr+PmEMYdIW/PttApi4Gm7ZyQKSvqPEoO1XhJkQ4cYxMQ05odph7G+hQ1fyOP0sK
         xWG+5QEB8O4dvqhH7zgE7XCLUO5DGKbF6BD4FSzP/zfbo+gouQIy6smg75/u3bPehvYB
         FEMqOz41Rj362LN4IykLjQN+B30SEJm9xPKYv9a6hgDNQ7DPavCLfQ5pJuvjWozhBz9L
         hjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321157; x=1732925957;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzyWd1Ozzz3SQNuZyfgRru/W6uNkQPbCi35gmVjFow4=;
        b=Vv9Z1st/ZhQarKpyx/EFaqoym5faQ15e4rNfvY18VwREUW9e05DQ6S9Neh37TUiNp8
         YPm2HzWL62i++T3Pud9JoiS1ihem2HcIaRlZee79voF9u0JsarNKI8A9NU2JHwBkoFVm
         mOLSnvWAh7AJJPmEn55rRsFixOylw/0yziG3Eve3IwqgcGbQEWhWca72vWHu5mbaMJWN
         dT888bM3D+CfJLKgu7ZIJgyi4tDYSm5l/wGdtjcEO0xCom+dup8f3PdxL97hqS2dDCYS
         DSuMNN4DxZ4UXWX3ZinSg1sy3vrvPvO6QT/nNpno84HkVjIYTb4Oo/lnsIXGZHvsdQC9
         PgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVif2aZ2mAuXiudDHsiq5D5oJsFH6KIhcEh7qIWgHmjtNgPi6gsiwb0XJQpMCxDJO/IzgXFB7qF2Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HkFQG2MjYJBhumcJghxN3b5gd76A8FK2USQ1MguT2C+mQyLR
	6RfXhANj2d2jpOpYmtk0a4bSx9F2IBFcF6hAb1l651EkhGRfF9JMmbu6wZ0j+Hu/YDwKbOsUSOY
	BVM9T7g==
X-Google-Smtp-Source: AGHT+IGaHsvNgSBBFeb1KNK1VHScVmnycGaGvWkQd+Oy8DpEaKXryKh9jKUOlebIrijGejNroleRwAK5Bosy
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:8d0a:0:b0:6ec:aa45:a975 with SMTP id
 00721157ae682-6eee08a975fmr29537b3.1.1732321157317; Fri, 22 Nov 2024 16:19:17
 -0800 (PST)
Date: Sat, 23 Nov 2024 00:18:57 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHEfQWcC/23QwW6EIBAG4FcxnDsGBq1omqbv0fSAOijJIltwz
 TYb371oPdhkj38yfMz8DxYpWIqsyR4s0GKj9VMK9UvGulFPA4HtU2bIsRAcEeg+09RTD873C4V
 tPoKu2qLoTWuMESw9vQYy9r6zn18pm+AdzGMgfcJEiVLUWOZSlQVKDgKc07dA4WPwfrhQ3nl3a
 IG+b2m3+Y9kjmLU+25N9rZrAgXyApHnKCsllADkELWzs78seqLpZL5vaKsjQQpposmmdBUcDrJ
 t49HG2YefvZel2j89KpDPK1gq4CBlXanUhZSVPB+xiYs6Kena54pKSi1115N5xY7UP2Vd11/W8 irAsQEAAA==
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
Subject: [PATCH v9 0/5] Extended MODVERSIONS Support
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

This patch series is intended for use alongside the Implement DWARF
modversions series [1] to enable RUST and MODVERSIONS at the same
time.

Elsewhere, we've seen a desire for long symbol name support for LTO
symbol names [2], and the previous series came up [3] as a possible
solution rather than hashing, which some have objected [4] to.

This series adds a MODVERSIONS format which uses a section per column.
This avoids userspace tools breaking if we need to make a similar change
to the format in the future - we would do so by adding a new section,
rather than editing the struct definition. In the new format, the name
section is formatted as a concatenated sequence of NUL-terminated
strings, which allows for arbitrary length names.

Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
but the kernel always knows how to validate both the original and
extended formats.

Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
but it is enabled by default when MODVERSIONS is enabled and must be
explicitly disabled by the user.

Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
unable to retrieve CRCs until they are patched to understand the new
location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
be unable to read the CRCs for long symbols until they are updated to
read the new format. This is not expected to interfere with normal
operation, as the primary use for CRCs embedded in the module is
load-time verification by the kernel. Recording and monitoring of CRCs
is typically done through Module.symvers.

Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
selected, and will implicitly select EXTENDED_MODVERSIONS.

This series depends upon the module verification refactor patches [5]
that were split off of v5 (now in modules-next)
and DWARF-based versions [1].

[1] https://lore.kernel.org/all/20241121204220.2378181-20-samitolvanen@google.com/	
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t

Changes in v9:
- Rebased onto the latest version of Sami's series, on top of linux-next
- Added BASIC_MODVERSIONS to allow using *only* EXTENDED_MODVERSIONS
- Documented where symbol data is stored and format limitations

v8: https://lore.kernel.org/r/20241030-extended-modversions-v8-0-93acdef62ce8@google.com
- Rebased onto latest version of Sami's series, on top of v6.12-rc5
- Pass --stable when KBUILD_GENDWARFKSYMS_STABLE is set.
- Flipped MODVERSIONS/GENDWARFKSYMS order in deps for CONFIG_RUST
- Picked up trailers

v7: https://lore.kernel.org/r/20241023-extended-modversions-v7-0-339787b43373@google.com
- Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
- Drop patches to fix export_report.pl
- Switch from conditional compilation in .mod.c to conditional emission
  in modpost
- Factored extended modversion emission into its own function
- Allow RUST + MODVERSIONS if GENDWARFKSYMS is enabled by selecting
  EXTENDED_MODVERSIONS

v6: https://lore.kernel.org/lkml/20241015231925.3854230-1-mmaurer@google.com/
- Splits verification refactor Luis requested out to a separate change
- Clarifies commits around export_report.pl repairs
- Add CONFIG_EXTENDED_MODVERSIONS to control whether extended
  information is included in the module, per Luis's request.

v5: https://lore.kernel.org/all/20240925233854.90072-1-mmaurer@google.com/
- Addresses Sami's comments from v3 that I missed in v4 (missing early
  return, extra parens)

v4: https://lore.kernel.org/asahi/20240924212024.540574-1-mmaurer@google.com/
- Fix incorrect dot munging in PPC

v3: https://lore.kernel.org/lkml/87le0w2hop.fsf@mail.lhotse/T/
- Split up the module verification refactor into smaller patches, per
  Greg K-H's suggestion.

v2: https://lore.kernel.org/all/20231118025748.2778044-1-mmaurer@google.com/
- Add loading/verification refactor before modifying, per Luis's request

v1: https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaurer@google.com/

--
2.47.0.rc1.288.g06298d1525-goog

---
Matthew Maurer (4):
      modules: Support extended MODVERSIONS info
      modpost: Produce extended MODVERSIONS information
      modules: Allow extended modversions without basic MODVERSIONS
      Documentation/kbuild: Document storage of symbol information

Sami Tolvanen (1):
      rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS

 Documentation/kbuild/modules.rst | 20 +++++++++
 arch/powerpc/kernel/module_64.c  | 24 ++++++++++-
 init/Kconfig                     |  3 +-
 kernel/module/Kconfig            | 25 +++++++++++
 kernel/module/internal.h         | 11 +++++
 kernel/module/main.c             | 92 ++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c          | 45 ++++++++++++++++++++
 rust/Makefile                    | 34 ++++++++++++++-
 scripts/Makefile.modpost         |  2 +
 scripts/mod/modpost.c            | 70 +++++++++++++++++++++++++++---
 10 files changed, 308 insertions(+), 18 deletions(-)
---
base-commit: 96ba0247d78ef4078e1de58b7e73715b93ee2c0b
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241121204220.2378181-20-samitolvanen@google.com>
prerequisite-patch-id: 43f1286f3e4b991fda2aa093539631a01fadf5fb
prerequisite-patch-id: 32a05b89083cfed15e5b877664b0c8138c40d09b
prerequisite-patch-id: e192e2a692c40d96cba919e3baae68c441ab25e4
prerequisite-patch-id: 50e884d28c720e90f201aae7801590d19736541b
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: ff82b9794147dc28504e46a0170cd269623e73bf
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: 2a317596a3288f9b8e06d73df53737bbfafb1d16
prerequisite-patch-id: cac33b6e6672cf3f9f7f798a928ce7b147db271d
prerequisite-patch-id: 62664c468be8afff72a3edaf2c1bcd2f4936a1b2
prerequisite-patch-id: 5157d0421200858de3cc449bf39b3513efba3b24
prerequisite-patch-id: 5a190c60e140cdf33caf4f4da03186a2bd75a531
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: 25255d6bc70d3ba38e45fb6a2c13038df293bd9e
prerequisite-patch-id: 91c6131ab67a6f0fd8cf8bc95fa45144a868f095

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


