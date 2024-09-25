Return-Path: <linux-doc+bounces-25739-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE2986328
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 17:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E49B1F27B3E
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 15:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B3D199FDA;
	Wed, 25 Sep 2024 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rXWec9Qx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2EC199FDB
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276575; cv=none; b=WQtI185KnQ4cBFrHpBdGo32X4BjhFq+d+fGutsNScKb8t6pMVZcIRhVeKGEcLRBYzvuYeVPkz+pgCp1LfkTvacR2sSe/ccAwjA2CHkSN6ODUSVNzkvnfzIsW/8nUakxcK2RumS+UNAsFUykui557cuMupZ9vrus5pnOUWTIobyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276575; c=relaxed/simple;
	bh=31w9JHpb/FOSX9EXfChPlaKIxGcZxzD1C7F5EPjfIx4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QwnKqkgjGWreNuFsC9IWZSkxhz4NJhMNNY4xsxHUpR9nxslO4jrHtxUWUYg5spbg+T35SlsiGq1qUoVQLOacczLF2BAbRfY2D77Sfmuv1kH8++MfMQGtm7l+KjwY2Ysa+kL+KzdLPI893EYZNZkACRqy8VcGNLCNyHqEYQq1z0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rXWec9Qx; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e2146737f2so28283387b3.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276571; x=1727881371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7Siui3EQaHZbOP2Zf5u6bj1Z6F9xVc5htz8ViId7Yw=;
        b=rXWec9QxGp9iLyg3M9A0z666zG+oP1PcSihhjizChPy05vnNcsyx9xLL/z4hX6lSef
         qFy4BSKuzWSFawXI68+XsubjKO+eet/40TIgqZ7RsfGZS986AuWvF8nKN5qpiFKslsmO
         2bArQxQb3mhxvvbCgKFbAX7uhsCXllG5X1zigVUxzuu6x5bX2y0QgHhJ8KJxprmV7B07
         1T1VVmdSq3ytxkjpX8wNbaWviGn7gBt+HOuYUzOBw3QVk5wbVkr97BL/tcUWZ1Mjf+Hh
         KBv/YdE7rb1fZQmYY8Dofb7w+CogKyoRXNS8KyaxBsHDBW0ay0LD+K2ehinLZWsJxlgN
         zhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276571; x=1727881371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7Siui3EQaHZbOP2Zf5u6bj1Z6F9xVc5htz8ViId7Yw=;
        b=ohESMJV/Hplx9+uYIGeCFDSwKYgK3iLd5lvrrwgLWJFmdEm/IkP+aVFtKWIdBZLakQ
         u8zv6Er14N54WmAnSSQzGqeYJv6fOnfrCn+XE5qXrJa72730DEXXofpeaL4+Np//fyie
         gu0uC3xZvEU1YC8xzntN8W4C3o5yF+9/hZJIzCVY31OdlqDHq0vrkpW4Zn6eMpnHfjxQ
         KJ2QmZhcKej/UgqAWrN62HZgqa2NjXNWwF4YFZVYjme9sVZSuMBBhAzKu79qC0Sz7X9u
         IlJLqE2h9MwvsDL2uGpuJ/Jgz4P77EUyxpY/P/U1RRKmItgj3tbDfYNYSu5+7j/qu79y
         jcfA==
X-Forwarded-Encrypted: i=1; AJvYcCVbjv2YprzP0dKT/x7OGUnYLZUU/8C3dtBQwxx6cGZVuuB9EZnmiWeZEDDJ8Idtt/16MK4VIKrz+38=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwnGxeR9NGBTkKOD7Ygat5iXN1OlGDEpE+4VL8e94yHS8rxDpB
	8RbsxD/V9m6Uy3odB/xjOQ+imlhntyADYPPNwQHgLSrJGL3qXQtDmW+mdZDiEJ1xIZGdHQ==
X-Google-Smtp-Source: AGHT+IGUGK/IbClqwN6y6QvmI8hCfQn6s2hVSiVHB1d+dhN6jVJxxhzTiRxXUiYwgEqTcxKFspPDWKFo
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:f90:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e21d9f2676mr100587b3.5.1727276571410; Wed, 25 Sep 2024
 08:02:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:24 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=ardb@kernel.org;
 h=from:subject; bh=s5eg4POBUMz0+xutAa57cnb7wChxapKHTEsRfaj5xkM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6rmrbx/K9pd0n9poZ7rKarM71/pb64Mu3OE7WFCew
 +trFZHXUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYiIMfIsHzp8ptxntWap0qz
 /54LMvVhTo1RvbxcftLGA6VFgfY+Jxn+B/cyx9dHTT/wO+rQQaXszxPMFk1geHr9aqrVTv/NPxI dmAE=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-54-ardb+git@google.com>
Subject: [RFC PATCH 24/28] tools/objtool: Treat indirect ftrace calls as
 direct calls
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

In some cases, the compiler may rely on indirect calls using GOT slots
as memory operands to emit function calls. This leaves it up to the
linker to relax the call to a direct call if possible, i.e., if the
destination address is known at link time and in range, which may not be
the case when building shared libraries for user space.

On x86, this may happen when building in PIC mode with ftrace enabled,
and given that vmlinux is a fully linked binary, this relaxation is
always possible, and therefore mandatory per the x86_64 psABI.

This means that the indirect calls to __fentry__ that are observeable in
vmlinux.o will have been converted to direct calls in vmlinux, and can
be treated as such by objtool.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/check.c | 32 ++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 04725bd83232..94a56099e22d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1696,11 +1696,39 @@ static int add_call_destinations(struct objtool_file *file)
 	struct reloc *reloc;
 
 	for_each_insn(file, insn) {
-		if (insn->type != INSN_CALL)
+		if (insn->type != INSN_CALL &&
+		    insn->type != INSN_CALL_DYNAMIC)
 			continue;
 
 		reloc = insn_reloc(file, insn);
-		if (!reloc) {
+		if (insn->type == INSN_CALL_DYNAMIC) {
+			if (!reloc)
+				continue;
+
+			/*
+			 * GCC 13 and older on x86 will always emit the call to
+			 * __fentry__ using a relaxable GOT-based symbol
+			 * reference when operating in PIC mode, i.e.,
+			 *
+			 *   call   *0x0(%rip)
+			 *             R_X86_64_GOTPCRELX  __fentry__-0x4
+			 *
+			 * where it is left up to the linker to relax this into
+			 *
+			 *   call   __fentry__
+			 *   nop
+			 *
+			 * if __fentry__ turns out to be DSO local, which is
+			 * always the case for vmlinux. Given that this
+			 * relaxation is mandatory per the x86_64 psABI, these
+			 * calls can simply be treated as direct calls.
+			 */
+			if (arch_ftrace_match(reloc->sym->name)) {
+				insn->type = INSN_CALL;
+				add_call_dest(file, insn, reloc->sym, false);
+			}
+
+		} else if (!reloc) {
 			dest_off = arch_jump_destination(insn);
 			dest = find_call_destination(insn->sec, dest_off);
 
-- 
2.46.0.792.g87dc391469-goog


