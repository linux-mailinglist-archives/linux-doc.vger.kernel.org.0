Return-Path: <linux-doc+bounces-95144-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nS1UNH2+S2o2ZgEAu9opvQ
	(envelope-from <linux-doc+bounces-95144-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 16:41:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD89712177
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 16:41:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=FKilO3SP;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95144-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95144-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CB50317FE02
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 14:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C1E37703B;
	Mon,  6 Jul 2026 14:00:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CD376BD9
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:00:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346442; cv=none; b=bzojnteVJt1CZuWLzMxCN4kApXDGzmaphXxQC/k1SGzA0OgfdygefHCBZCAH0x4ezzKnbcn7TSPvR1IvlEr4g52e/HKZzV6fl3B3tsXRieHlntoSBYetl0SKlUhEzQRCj2vciqmxKdyWJJM1FfHUo4yF5GhOM/hm4K+jAQ3O3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346442; c=relaxed/simple;
	bh=GT+ppberu0anEAeC+qXazUY5shgeTwe7gFCmxdinqZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hK83PjeQnkXuFe6e61naIpOJ+vThknpBHg+nFYkvCEvoFxmxCA/AdItrk6pKzljvoOfIfwZv758Wi7hYSSIDfzqBV362OTguMqSHUYxvkyvNwxVu84R85vqNz93to2E2BncNdYU2rFBYSL7F1siRqVBA88Ni+4On4zDjNlraULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FKilO3SP; arc=none smtp.client-ip=209.85.222.170
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5c9211d2so245252785a.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783346439; x=1783951239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMQ0qI/f+RyF4bWPFQs8Uzubn//EeZ6p5jr0pifSbWk=;
        b=FKilO3SP2i/MAFuuSbllSSYXybkBdbne+G8dJ7Lv8rhQ+Su912RjmfvR6l6v2XeQq9
         T6QneZonXsGfGhcZft2Yo+QU4pqJOzVTncMqHB/680MlWXIKTdCpNImFVLHAWeLx9T8E
         Ne3EPpGdxF/bC8tbCObFJgz2Z7JAmiNvq8B+HbpThOAVE+MTVoMhNKhUu7vNxjznIkk5
         VBAIOQ8ra4/DhPm0osHX+++XEi7ZzZBwa+MzDHO9GcAQ4aFy8DPAY8d4sBhfDQrxmecW
         1c1KqcTXf76ScLQCQkedoPi3YYFJYyiozzZ0cjv6zsZPeG/YfpEtcU6yw87ZKdioYSPd
         /vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346439; x=1783951239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMQ0qI/f+RyF4bWPFQs8Uzubn//EeZ6p5jr0pifSbWk=;
        b=Ogbvtmc1YyKC1khxW7Wwzrf/7Lxzhb8vdXcGZWDwf+cOwQkYH6rxMijMXquZ6c1bdj
         YC63s3Jnc9MyKUoQHF8U7x5gJvX7r1UI1Cq/TGPPlykz6RyDsTWr+QKM5WX0kyPpDi8b
         lv53X0jnMBTzaYofCNKAQkCZcmHt35fnrbNMtt0NQcriDmMRsnbXFZXns0shuhGcUdKq
         nII5MyZZZB6HwDWbjY3a4WWtA6Ju1+FxoZigT3tj29L3Q9tc9cwBkiOrLF82mjCshpft
         Im78ZnK/5yhX2pxQkGENpetG3Xq/iVnhgn8/uLgFZk67uBlNFId2KTVM7LlJRpmDnDYE
         tNyg==
X-Gm-Message-State: AOJu0YzSYVlhFddTXElsbE/9bjijLDWw5XJWxdoC8gnrEYKj4KTh6XNu
	lcX7h2PsMXnHXP/9iKTtE2T0aVfb83dqGhAofbPbrZAoTCoaaLPse0oGYuxuaO2jDGI=
X-Gm-Gg: AfdE7cn182ptGMGXu/xCz1EGnxg371/TjILIl1YBM+K2RgGiVmpioZB+pUGE9LUYEYJ
	xYKWGEVrUgYG00TdGFamDe+8ZIMdE9k4+0K1hRrhNKPPOWyxoC0Sw35WbHQpmKK57FnbyUa5mlP
	gblBmeoFOdZF893ZHZ0M+08MhD7mf/UVd1DraOO0bfa6LmouIBIho2OD/WL6aW/Yk08DotsAU0Q
	TkJ65iX+rrQi8CkO05XVFopONm28rkmWBFm3MjTEe8eqZbkvFR3cPQ6pvjiJKCL/Udky0DKi47l
	LrmW5gpb3yNBuXs6PBoXwjXLVaIuCnlXDbPGD+mmGJ4B/M66byxOa37BKPRRKSJaMyMtdYKgVRm
	poSSLP4Z5pew1Uu4Bpp9W4XQ5mJkK+Jo2v60RrfM7eGLiTdxB9ghspmKQR2UlhOYz/sS21CWKYb
	2Xc8SF5mo=
X-Received: by 2002:a05:620a:880b:b0:92b:3720:bc5d with SMTP id af79cd13be357-92ebb55780cmr90485685a.38.1783346432478;
        Mon, 06 Jul 2026 07:00:32 -0700 (PDT)
Received: from fedora ([172.56.218.236])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cce037sm918577385a.38.2026.07.06.07.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:00:30 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com,
	pmladek@suse.com,
	lance.yang@linux.dev,
	marc.herbert@linux.intel.com,
	kees@kernel.org,
	leitao@debian.org,
	gourry@gourry.net,
	joel.granados@kernel.org,
	lirongqing@baidu.com,
	nathan@kernel.org,
	xur@google.com,
	lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com
Subject: [PATCH v3 0/2] syscall_user_dispatch: add build/runtime configs
Date: Mon,  6 Jul 2026 10:00:17 -0400
Message-ID: <20260706140020.873735-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:lance.yang@linux.dev,m:marc.herbert@linux.intel.com,m:kees@kernel.org,m:leitao@debian.org,m:gourry@gourry.net,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:nathan@kernel.org,m:xur@google.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95144-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[gourry.net];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gourry.net:from_mime,gourry.net:dkim,gourry.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FD89712177

Syscall User Dispatch is presently compiled in by default for all
architectures enabling CONFIG_GENERIC_ENTRY, and some users may
not wish to have the feature functional at runtime.

Add CONFIG_SYSCALL_USER_DISPATCH and kernel.syscall_user_dispatch
to make it a configurable feature at both build and runtime.

CONFIG_SYSCALL_USER_DISPATCH depends on CONFIG_GENERIC_ENTRY
but is separately configurable.

The runtime control is enabled by default, and disabling the feature
while a task has already armed it does not cause it to become inactive
in that task's context. Instead it remains active until the user
attempts to disable/re-enable via prctl or ptrace.  On the next attempt
to re-enable, the prctl/ptrace call fails gracefully.

Gregory Price (2):
  syscall_user_dispatch: Make it configurable in Kconfig
  syscall_user_dispatch: add kernel.syscall_user_dispatch sysctl

 Documentation/admin-guide/sysctl/kernel.rst   | 17 +++++++++
 arch/Kconfig                                  | 10 +++++
 include/linux/entry-common.h                  | 11 ++----
 include/linux/syscall_user_dispatch.h         | 28 +++++++++++++-
 include/linux/syscall_user_dispatch_types.h   |  2 +-
 kernel/entry/Makefile                         |  3 +-
 kernel/entry/syscall_user_dispatch.c          | 38 +++++++++++++++----
 .../selftests/syscall_user_dispatch/config    |  2 +-
 8 files changed, 92 insertions(+), 19 deletions(-)

---

Changes since v2:
  - CONFIG_SYSCTL -> CONFIG_PROC_SYSCTL
  - selftest fixup for CONFIG_SYSCALL_USER_DISPATCH
  - Reword "IP address range"
  - __always_inline fixup (tglx)
  - include ordering (tglx)
  - proc_dobool (tglx)
  - whitespace (tglx)

-- 
2.54.0


