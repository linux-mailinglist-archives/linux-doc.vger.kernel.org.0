Return-Path: <linux-doc+bounces-96430-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6MIJ1sTU2qwWgMAu9opvQ
	(envelope-from <linux-doc+bounces-96430-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 06:08:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66A743BF0
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 06:08:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UYFO8J+T;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96430-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96430-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC8583019FDC
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 04:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD6B369D7D;
	Sun, 12 Jul 2026 04:08:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1083090C4
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 04:08:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829332; cv=none; b=D6VoTiQb3YmyNEX1vJSXq/ZBT8qtYIeX0agCiS4/nPzFNKsmRPuACbZHYRmgMm1/nqKyp1uk06pTlFdjxeSWCpa3orVp3ye6pwxAs31TiQuVX5mz84kVa9dY0iv3s4zGmiE1wGvr3NZIBkzYTpSXm+NF59TlzAcfK035ETY7RBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829332; c=relaxed/simple;
	bh=h6B0OjtVcGTWtjlzNMQQRejqoZpZDRXhjwZUYIoAIUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bchKJNoNU2f7lxNE5NEZSc3ztYak0bFqwOgXAnn80p/FtNXtEevtzNJuz65YivtLjiYRKjo3ObGy3cjEnYZ2YKs2bMZU4gVKIoygtPhvBbfHIhaXnQBkfybhHIMXUngXkIPMurS0m5oW9C1cYnFMzegUmdIhQ3OR1ZVzgqAxuB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYFO8J+T; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc61541f8cso38003295ad.0
        for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 21:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829330; x=1784434130; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t37Gu0kxoMG3/ekSSSPa6GLm4FmEdZkOax2Tk1RKTwE=;
        b=UYFO8J+T9mdKCwwncTHii6Rnnng+fAt2iuWC7rA9o6ZyZtHiG/5RvvgoSv/KW4IGXt
         sVZegZyK+Mjozbl1VXowKrbo+fGY5aNFMvMff6xD1GpGUtRPwu7sh4INH6h3YKUW1uhx
         NRoCFlqbzp7thOuoBbiYsF5cpP1N2VXa8gfnLv5FcXM4FtjH2BaJcPK2Rkk+gtcMl3A9
         2BcLXGKSWm13xJhUNEKBTAmWp3m2+tEzuV/5a+5ir6Rv/XVnMvmAbsbbRcFFiRHaUyWJ
         76hcA21SlxBM1hL/F/AIdlt1Dy+pUJt70cFAjCZs5k/rgl0wAcgM/V+dikdILKKNobK4
         3RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829330; x=1784434130;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t37Gu0kxoMG3/ekSSSPa6GLm4FmEdZkOax2Tk1RKTwE=;
        b=Ss/XrTV55BDld22+HMfcEfiRpnNV4YXPBNSJoTSvfjMYozF8bYAbEbWyfWOWr1ionf
         mxMISKPudbN94S7tZOJ3bMetUITwCuUaWHurZf+qPs/hyASSi+e90lLmI/SsL9Z7SQua
         KqzdKYZm9r4HKhoF8eD+GCiB5r3m/z6rziQmgl5s5ywrgIpPeNPvHOi2vOyn/9C3p5m2
         WKflJkBuwkwvbf31uATej2pA0XnQWujnnG2D9UOPWlL3HwZN/vqvjO8R21IrwZz2hxeW
         Acz7aTA9ybMzfzHziJwo47rYd+QbQYLOTIaIRzWY/APd+vyaYm9vQVaomIbd303MQ90/
         AEXw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2QRvWo8BZsNUranF9uNAI3sXHMmnCq0pRoXOPEYWqOK16/o1k1QcWgI7RJhmoCXX2lY3RvYcqrRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVMcnbQlestmLx1uLNNv+UAnNbUgRNbs0fUb/44RrZv/yITvqK
	epu5z1UFZmR1axsuPzlSCT4sWUCDciQYXHWbzktNF++dODHHXmZl3umD
X-Gm-Gg: AfdE7cnrPhLwe83BCOJoSwfrm/UEdjy+Z3rnBzd+7BWhkiNaZTlqI4PAIMLn35VoYzD
	snbWTIan9I6k5z+AlXZ4NpONFtH17BZfmdIdNkpYxp2vW1FvZFzPNCyuR1Y1MSG1UxnE9c5oTtw
	/8gtVHM2QmMzjI0li/5gWJUsM8/+iOiVPr/3DYny8G8Txjex46np0I+HxOBhdiNC4GIsZSiE9sP
	R4+Nqqu4+fvgQ8VVkTF5Em4rmzczwNifMSNrfS7ONID75LvmOw7XzmlfypLYIhDu1D02hgepLEp
	wuW3+qLjL2IY7Ap/1K9tcCiqleAK/jyOcKO3O1quX7c/666j/bZmnCPO1fxlKJt+vbGqmLNhL0Q
	poqmeXbtK2OTTqD+NrKXfttSkLjXAHJKEnOSnNj3buBH5w8PTgznjz3uIQiAFMaJY6KaJ6keeUr
	bUf4wj2Ly6Hx/devrr
X-Received: by 2002:a17:90b:2585:b0:38d:ec55:7aa7 with SMTP id 98e67ed59e1d1-38dec5589c6mr496049a91.19.1783829330453;
        Sat, 11 Jul 2026 21:08:50 -0700 (PDT)
Received: from [127.0.0.2] ([98.35.8.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm56808928eec.10.2026.07.11.21.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:08:49 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Subject: [PATCH v2 0/5] binfmt_misc: bpf-backed binary type handlers
Date: Sat, 11 Jul 2026 21:08:13 -0700
Message-Id: <20260711-binfmt-misc-bpf-v2-v2-0-d6591ceaf207@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4TU2oC/y3NQQ7CIBCF4asY1o4B0lpx5T1MY4QO7aQWGmhQ0
 /TuIrr8XzLfrCxiIIzsvFtZwESRvMsh9ztmhrvrEajLzSSXR94IAZqcnRaYKBrQs4UkgdvaCKu
 UVtixfDgHtPQq6LXNPVBcfHiXH0l81z/HG3j6MBbn596KmwRwaCqtVG1OFRpxGTE4fBx86Fm7b
 dsH8KzV07cAAAA=
X-Change-ID: 20260711-binfmt-misc-bpf-v2-0f5c1f99b9ed
To: Christian Brauner <brauner@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Kees Cook <kees@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>, 
 John Ericson <mail@johnericson.me>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96430-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:shuah@kernel.org,m:andrii@kernel.org,m:kees@kernel.org,m:viro@zeniv.linux.org.uk,m:jack@suse.cz,m:corbet@lwn.net,m:jannh@google.com,m:mail@johnericson.me,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:farid.m.zakaria@gmail.com,m:faridmzakaria@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[faridmzakaria@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,suse.cz,lwn.net,google.com,johnericson.me,vger.kernel.org,kvack.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faridmzakaria@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B66A743BF0

This is a continuation of Christian's bpf-backed binfmt_misc POC [1], which he offered
to hand off to me. I am carrying it forward. The kernel design is his and is
unchanged. This series rebases it onto his binfmt_misc locking/cleanup series [2]
and adds selftests (+ fixed from the one's shared), and therefore does
not apply to mainline alone.

As for motivation for this whole change, Christian did a great VL;MR;
write-up [1].

TL;DR: binfmt_misc can match a binary and hand it to a fixed interpreter,
but it can't match programmatically or compute the interpreter per binary.
The Nix community would love to support relocatable binaries, where the
correct loader can only be found relative to the binary itself.
This adds a 'B' handler type: a binfmt_misc_ops struct_ops program that
inspects the binary and picks the interpreter with one new kfunc,
bpf_binprm_set_interp(). 

  bpftool struct_ops register nix_origin.bpf.o /sys/fs/bpf
  echo ':nix-origin:B:nix_origin::::' > /proc/sys/fs/binfmt_misc/register

Patch 5's nix_origin.bpf.c is Christian's example program with a small fix
so it passes the verifier. Christian, happy to add a Co-developed-by: and your
Signed-off-by: if you would like the credit in the trailer.

For those that want to validate this functionality on a NixOS machine,
you may find my flake.nix handy [3]. It builds the kernel, compiles the
bpf objects against its BTF, and runs the selftest on boot,

  # be sure to change virtualisation.sharedDirectories in flake.nix to your checkout
  $ nix build .#nixosConfigurations.micro-vm.config.system.build.vm -o /tmp/vm
  $ NIXPKGS_QEMU_KERNEL_micro_vm=$PWD/arch/x86/boot/bzImage \
  $ NIX_DISK_IMAGE=/tmp/vm.qcow2 \
  $ QEMU_KERNEL_PARAMS="binfmt_autotest console=ttyS0" \
  $ QEMU_OPTS="-nographic -no-reboot" \
  /tmp/vm/bin/run-micro-vm-vm

[1] https://lore.kernel.org/r/20260707-work-bpf-binfmt_misc-v1-0-74b995c84ec1@kernel.org
[2] https://lore.kernel.org/all/20260710-work-binfmt_misc-locking-v3-0-a162f7cb58d6@kernel.org/
[3] https://gist.github.com/fzakaria/0155e11a0882bd3d6e63f4070e7fac0c

To: Christian Brauner <brauner@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
To: Martin KaFai Lau <martin.lau@linux.dev>
To: Shuah Khan <shuah@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Jann Horn <jannh@google.com>
Cc: John Ericson <mail@johnericson.me>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
Changes in v2:
- Patch 5 adds new tests that validate the functionality:
  - a bpf handler matches a synthetic aarch64 header and routes it to a fixed
     interpreter the program chooses;
  - a handler resolves a "$ORIGIN/..."-relative PT_INTERP to an
     interpreter co-located with the binary (i.e, Nix usecase);
- Patch 3 is rebased to fit the new binfmt_misc code style: the 'B' field parsing is now a
  parse_bpf_fields() helper matching the new parse_{magic,extension}_fields()
  split, and load_misc_binary() keeps the bpf retry loop in the
  __free() cleanup style.
- Link to v1: https://lore.kernel.org/r/20260707-work-bpf-binfmt_misc-v1-0-74b995c84ec1@kernel.org

---
Christian Brauner (4):
      exec: stash a bpf-selected interpreter in struct linux_binprm
      binfmt_misc: add binfmt_misc_ops bpf struct_ops
      binfmt_misc: wire up bpf-backed 'B' entries
      bpf: allow fs kfuncs for binfmt_misc_ops programs

Farid Zakaria (1):
      selftests/exec: add binfmt_misc bpf-backed handler test

 Documentation/admin-guide/binfmt-misc.rst        |  40 +++-
 fs/Kconfig.binfmt                                |  14 ++
 fs/Makefile                                      |   1 +
 fs/binfmt_misc.c                                 | 149 +++++++++++-
 fs/binfmt_misc_bpf.c                             | 275 +++++++++++++++++++++++
 fs/bpf_fs_kfuncs.c                               |  23 +-
 fs/exec.c                                        |   1 +
 include/linux/binfmt_misc.h                      |  49 ++++
 include/linux/binfmts.h                          |   1 +
 tools/testing/selftests/exec/Makefile            |  37 +++
 tools/testing/selftests/exec/binfmt_bpf_app.c    |  12 +
 tools/testing/selftests/exec/binfmt_bpf_interp.c |  15 ++
 tools/testing/selftests/exec/binfmt_misc_bpf.c   | 260 +++++++++++++++++++++
 tools/testing/selftests/exec/bpf_interp.bpf.c    |  52 +++++
 tools/testing/selftests/exec/nix_origin.bpf.c    | 179 +++++++++++++++
 15 files changed, 1091 insertions(+), 17 deletions(-)
---
base-commit: 6203a47c1d78f948cd5e9ad1a4c089745e466870
change-id: 20260711-binfmt-misc-bpf-v2-0f5c1f99b9ed

Best regards,
-- 
Farid Zakaria <farid.m.zakaria@gmail.com>


