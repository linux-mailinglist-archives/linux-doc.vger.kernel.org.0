Return-Path: <linux-doc+bounces-25717-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979E98624C
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 17:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A181F28FD7
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 15:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD2F13DBBE;
	Wed, 25 Sep 2024 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VFVz+AlT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D478B50
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276519; cv=none; b=Wau1RaFx7GY9FK6jgAdRY4bPDAoqYmfUFt4PwlCP9XfEc15lebRonypmRESfKP9FKkCPAwmEF5DY1T7feoFcTecKKRCZ9F9Qth7RufyoiJHh9VDSruqXqZVcPQ55vRwsMCcnEzmanPkws9TYsl3CnA+6TB0LbPsOllNTCu4lnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276519; c=relaxed/simple;
	bh=rk1TLausu3D2x4uz05lRhrdTMxiTSLA2fDl1meeIK+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cfS9a3m37jHpslkOuYNNSpUkSNyLTztB3cwNiwdTPpZiMhQVUsJmfT+qdenYxE28H9zOiHXY5g6DghfjwDVkL8R0Ex0P8WIo3FNHItULhpn1QSZdOPqrnC/DqsykEBcGe8QndMpZDYuPeTtWdFGQFPAHitLqP225X82vMxaY4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VFVz+AlT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42cb115566eso63191715e9.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276515; x=1727881315; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjSReXj8XxN+J1aHSpg+bgY7XO8zJXJrh2uX1BeFRGQ=;
        b=VFVz+AlT0fVj8J3pb0uIJQLGxkYCKkAvLDgcAohPDUXmaMuk6UTbw4uq+CHcsEoRZ/
         5x5aSnW20fDUqHmuY3uMAA6I80/9rPDD/5xGciRxrWzTnMT2UtipActHUBezkRFpEjjj
         sOG059kJtCdOCKA5XBwzrZmIOIa5S/UmblboEdVQKaDLNiR6M6X2DIjGQ4+n7oN0yCPj
         sb6pNNvyVesjn3JTHhpQAoqB4ylt5fKdSAS0LSqxRycl+oVbZWRIh3MrNoaPcUJI0dRJ
         +onoD54UsA3PxnhIJe/kNKf8LKnhjzLE+eMh0qFTJDtNpVvQBt0X749C/T9XvKosb9xa
         ZuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276515; x=1727881315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjSReXj8XxN+J1aHSpg+bgY7XO8zJXJrh2uX1BeFRGQ=;
        b=KMUbTZPPPsO7MEA+ulAa23iDJd7aY2E8kQDrpMaRSn94YB4N438tRQDs03xFmzst0o
         5ZAgdglD3wN5QuKrrPbyFw/KVyXvKRY3zVtUvsJM0T9u6esBWvYd/AGiw29MQ8LdBvM/
         SaHwVWwWYQujGTI4oeP4UlYVY9FNy3Q/47WedtJLNbk0AnU3Eh13B7ebG0D04X4MAVMd
         OWNzV/JFlK/XOWDyrKOxOdheFamBXa9rgLfy1nKgIQs/CJf6phOmDUKpv52NvObZUAIP
         Rb6sw8dhcy0BODol/3l/Q84seKXH9HF3N3vHPZC4JyCUxwlQsq81RF0FGo6fsI/52uOg
         6BuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZhDCc+q8NmeojH9hPYvd3jhPJGJHUq+Q9hUbvESZPTFbl2aDaC9dd/K3Qn2BTgQFRik8ySTEMySg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbrTyXZRpkmsZuTc7o2FxJ+xmrpIOH3shP6ri8aJIe1SN18H2
	P0KNiC+38NYzfpg9w1KWYfRzsu4CiTfdvmtfAZp0xDR1ZVPJ3uSRiwDvP7DQFEW2trZUoQ==
X-Google-Smtp-Source: AGHT+IGzIZ2o2YM9LwRx7GUBkPXP1nnHd93bOM06M/lDtcRNJJFbQb+/UGpm4f4GZO5kVPvAO8R9y3yP
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:214f:b0:42c:b32e:6ba7 with SMTP id
 5b1f17b1804b1-42e9624246bmr34035e9.6.1727276514236; Wed, 25 Sep 2024 08:01:54
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:02 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=ardb@kernel.org;
 h=from:subject; bh=Etb53DEUMtJxbS45M94XzvcBugumXuKFZ3M2B/KYBNo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6jquDX165ub5J178W1mVH21S/GxP0fqUgljlqYpRR
 x60nEvpKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPRa2RkeBV2XNd/yacJf4IS
 mc47ex9ud90aJbN1Uf8PDSuxLfrPTjD8rwhuEVogxe0Xov++IjA4keVg55+fz6JEZeM/B04o0/B nBgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-32-ardb+git@google.com>
Subject: [RFC PATCH 02/28] Documentation: Bump minimum GCC version to 8.1
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Bump the minimum GCC version to 8.1 to gain unconditional support for
referring to the per-task stack cookie using a symbol rather than
relying on the fixed offset of 40 bytes from %GS, which requires
elaborate hacks to support.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/admin-guide/README.rst | 2 +-
 Documentation/process/changes.rst    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index f2bebff6a733..3dda41923ed6 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -259,7 +259,7 @@ Configuring the kernel
 Compiling the kernel
 --------------------
 
- - Make sure you have at least gcc 5.1 available.
+ - Make sure you have at least gcc 8.1 available.
    For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
 
  - Do a ``make`` to create a compressed kernel image. It is also possible to do
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 00f1ed7c59c3..59b7d3d8a577 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,7 +29,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  5.1              gcc --version
+GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  13.0.1           clang --version
 Rust (optional)        1.78.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
-- 
2.46.0.792.g87dc391469-goog


