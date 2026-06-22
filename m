Return-Path: <linux-doc+bounces-93125-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z5zXMVuEOWrBugcAu9opvQ
	(envelope-from <linux-doc+bounces-93125-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 20:52:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376F6B1E52
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 20:52:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=W0e2ekRr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93125-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93125-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C53C306DA93
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 18:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C4D3469FC;
	Mon, 22 Jun 2026 18:49:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DE346E72
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 18:49:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154144; cv=none; b=souV1wP03VyL8o4JXVxd8CPyFA7vK3YoFAfVXOYhZmjTb+Dq82TRL2dBahoaTTSuGonvpgPSPoiFKviqdfix4V+5rN22boRcsGcFkfyveV60R7UoMCwjjQautoHtrTDkIkxu8AcwD+AOZwsGAyuHR+kquzQN/aqR57k4uefuGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154144; c=relaxed/simple;
	bh=DIjLzbnkRJ/pEuBgYb3z2HOVtgcinNlZvsdJq/Cs5OY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=M6AZyTqTcX92Ev2Np1grO7JAbvN0J8AoQhT/WOtthVBvst5U9UATGSSWLFE/K/VOd98XgG9L4Ug4LpA6EMQa/d+TxEGjBB6bOuGZ7hmiaJa+ZPHET3Wccwohdy0LkxEUy7MriuYli5Qbmk4g/4tPYSV8Z+PeYbusHXsoNDmwUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W0e2ekRr; arc=none smtp.client-ip=209.85.128.73
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-49221de4ed4so30527565e9.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782154141; x=1782758941; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OEWwFi6TggeUgPIb5O1s/aY8eVgW9dSMubR6vHRGBr0=;
        b=W0e2ekRrwJxi0Xb5VaP5CAjCcgPLqZwKTkBd2/qYqZ7JjbhH/EW/M7ryasr1Uqaj4I
         TIzGIW+8qLLdxkwZfpdq5CNYnMzTP3yB4HtkWpiAn9Bkt6Rl5yRjUp6YJcM9QPqRFrp5
         kwQ8PTJ22hHI70ol1GijCnlPHw5bPb25GI9gXTuVb+345yFNjQokT8nvuRqcmq72Y6Dm
         +biy1vFWJopfzCOfhmjxIv09IMKT2p7xXgnZCDuv5MKJrda3Kj19MHFSh0tb3WpowIfD
         3qpwSvhB97GUxPW6suSXffJZ8/qY4KBR2hcXsoKaIaSxNt2BJ19nICVk98GPpIb1xu+r
         EVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154141; x=1782758941;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEWwFi6TggeUgPIb5O1s/aY8eVgW9dSMubR6vHRGBr0=;
        b=T2C1UpRNPNvALumm88OqkgdpUrLYiYnEACtoslydhci74tq//U+zLigaqcKC8PoZGp
         PMRLlfr6uPwkLrFEcHmZ/nlP/GpW+QVCSGAS0spKy2hngGzEFt/T6Di/327wNQCIT1LD
         HPqpCKVf2mprmxRv4LOAS5ZrS9ucXEW5UdQ21RJQWxFyyE6LLbiohqpC8MqCnlX1UOtP
         uCq6yEW9aNNefc+KLl+SyL/aq/kbNq+Bx4j3trIlofUoUGIH/5y2zACiOOnCuMXKXv1r
         AKkIdI8bi+v4FOFr9fZtCa56/Ia5eIMEskhpdJWepTLFcgUdwaZaaefeEVF3khPXm/+A
         uQgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BZ763hRg2ndN9uRSo5SSGfNKAmhJIEd26J4wdoP5fVCYllcRPQ7pnW70DJnIbbnLir9Ad2QcsK8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlFie5iov7p2cE7pypdVefBHHGyZYW50/eIWAW2Kh0fYZDleI
	goItwdC8ktd5aoKcA/U01Vi9JWXAcpXIDIt7cS8ItNvMoELWxjl+84/UUV5QKnJarryUJ5FFbZS
	U1LvGlrSQePlg2wxu+g==
X-Received: from wmnj21.prod.google.com ([2002:a05:600c:755:b0:492:4a9f:3d5a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c059:10b0:490:bb45:79da with SMTP id 5b1f17b1804b1-49240e427f0mr195668185e9.13.1782154140754;
 Mon, 22 Jun 2026 11:49:00 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:48:42 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260622184851.2309827-1-tarunsahu@google.com>
Subject: [PATCH v3 0/9] liveupdate: kvm: guest_memfd preservation
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:rppt@kernel.org,m:pbonzini@redhat.com,m:graf@amazon.com,m:skhan@linuxfoundation.org,m:pratyush@kernel.org,m:tarunsahu@google.com,m:pasha.tatashin@soleen.com,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tarunsahu@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93125-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarunsahu@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6376F6B1E52

Hello,
This is Non-RFC patch series for guest_memfd preservation. After
having multiple discussion across hypervisor liveupdate meeting,
guest_memfd bi-weekly meeting, the design for the basic support of
guest_memfd preservation is final. This series is going to include
guest_memfd which are fully shared and does not support private mem
and backed by PAGE_SIZE pages.

Steps to test:
1. Compile Kernel with CONFIG_LIVEUPDATE_GUEST_MEMFD=y
2. boot kernel with command line: kho=on liveupdate=on
3. run the following kselftest
	$ .selftests/kvm/guest_memfd_preservation_test --stage 1
	$ <kexec> --reuse-cmdline
	$ .selftests/kvm/guest_memfd_preservation_test --stage 2

NOTE: Assert the following:
	$ ls /dev/liveupdate
	$ ls /dev/kvm
	$ dmesg | grep liveupdate # (should have kvm_vm_luo &&
		# guest_memfd_luo handler registered)

The changes are rebased on:
	kvm/next + liveupdate/next (merge) + [3] + [4] + [5]
	Where,
	[3]: luo: conversion of serialized_data to KHOSER_PTR
	[4]: luo: APIs to retrieve file internally from session
	[5]: selftests: liveupdate sefltests library
Here is the github repo:
	https://github.com/tar-unix/linux/tree/gmem-pre

V3 <- RFC V2 [2]
1. Finalize the design
2. resolve sashiko reported bugs
3. Use of KHOSER_PTR instead of raw serialized_data as per [3]

RFC V2 [2] <- RFC V1 [1]
1. Removed mem_attr_array as it is not needed for fully-shared
2. Removed pre-faulted condition
3. Added vm_type preservation for ARM64.
4. Removed liveupdate_get_file_incoming api patch as it is sent
   separately [4] by Samiullah.

[1] https://lore.kernel.org/all/cover.1779080766.git.tarunsahu@google.com/
[2] https://lore.kernel.org/all/c054ba0fb2639932bbe354420d3f4f84cce84905.1780676742.git.tarunsahu@google.com/
[3] https://lore.kernel.org/all/20260622111215.4157974-1-tarunsahu@google.com/
[4] https://lore.kernel.org/all/20260613012521.835490-1-skhawaja@google.com/
[5] https://lore.kernel.org/all/20260612214512.464146-1-vipinsh@google.com/

Tarun Sahu (9):
  liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
  kvm: Prepare core VM structs and helpers for LUO support
  kvm: kvm_luo: Allow kvm preservation with LUO
  kvm: guest_memfd: Move internal definitions and helper to new header
  kvm: guest_memfd: Add support for freezing and unfreezing mappings
  kvm: guest_memfd_luo: add support for guest_memfd preservation
  docs: add documentation for guest_memfd preservation via LUO
  selftests: kvm: Split ____vm_create() to expose init helpers
  selftests: kvm: Add guest_memfd_preservation_test

 Documentation/core-api/liveupdate.rst         |   1 +
 Documentation/liveupdate/vmm.rst              | 107 ++++
 MAINTAINERS                                   |  14 +
 include/linux/kho/abi/kvm.h                   | 106 ++++
 include/linux/kvm_host.h                      |  14 +
 kernel/liveupdate/Kconfig                     |  15 +
 tools/testing/selftests/kvm/Makefile.kvm      |   6 +-
 .../kvm/guest_memfd_preservation_test.c       | 236 +++++++++
 .../testing/selftests/kvm/include/kvm_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  26 +-
 virt/kvm/Makefile.kvm                         |   1 +
 virt/kvm/guest_memfd.c                        | 185 +++++--
 virt/kvm/guest_memfd.h                        |  44 ++
 virt/kvm/guest_memfd_luo.c                    | 497 ++++++++++++++++++
 virt/kvm/kvm_luo.c                            | 195 +++++++
 virt/kvm/kvm_main.c                           |  94 +++-
 virt/kvm/kvm_mm.h                             |  15 +
 17 files changed, 1477 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/liveupdate/vmm.rst
 create mode 100644 include/linux/kho/abi/kvm.h
 create mode 100644 tools/testing/selftests/kvm/guest_memfd_preservation_test.c
 create mode 100644 virt/kvm/guest_memfd.h
 create mode 100644 virt/kvm/guest_memfd_luo.c
 create mode 100644 virt/kvm/kvm_luo.c

-- 
2.55.0.rc0.786.g65d90a0328-goog


