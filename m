Return-Path: <linux-doc+bounces-75405-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNDpEeb3hGmb7AMAu9opvQ
	(envelope-from <linux-doc+bounces-75405-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 21:04:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF915F7077
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 21:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AE0D3006800
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 20:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDEA32B98A;
	Thu,  5 Feb 2026 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M00wQn4h"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E732ABFF
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770321890; cv=none; b=laumKozYyd2EhYxnpW1skBbe3duzqDmKj3tTt1MG4CmETclxk8AIaWzIRjl0yfSemO7lGftURkopUBxFpbW/OWS4Y/WQ5MUpxfzJzq/vumVUuyxwtztInqxPadPH2WYhpBe09h+YTBh4oLNrC0q/qFVsvvOBUeBlcMRmvFKJo68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770321890; c=relaxed/simple;
	bh=rp+KY3soTs9OffEIYMUs0A+TcFMDd/NIg5e/e7FzZcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SW+GA3ylBowufrQAaIByEA3tRcvoDFmk+nqeJCG96dcFeFZnQj0MjFe9wDpWZjhojkPObz6IlZXlEAgoMsLY5NoiOxK0X11EK/7GcudnrQWQIpJPi+VYGei6UUSJhJ7g24USINakcU/Ix/cBO7kmyXHRa5IPrkHyJ0pT1IdKnuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M00wQn4h; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b7da62b487so2507211eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770321889; x=1770926689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lutadAeu4e7BBQbDMidbIXRD6r3yDEuccAzMlRoMGq0=;
        b=M00wQn4hIIjghsxWHIcLt2u9HGbV38BlsURscqAqczAsOpkP3QBrqzOfqj/zM9FjnL
         tmJvGm+84Xi1NsYys0+bZ+h0CIzDcCpfOMCOX2DNvudN7MJgtYA//aGAyEV4qOsbwEj1
         xaFjABZ7U6V2Sv9sz+amgVUekmDNj//Zdiawpa41pNunrtnSVwzgfRwaskvurSKacqHF
         5do9HgZwOI0Id5ALxeQEoWK37+bjc5pY+xkuX+jHtwgz/2ZFwWA8J6zoLyTt8pqKnmPW
         PMta4m5DE87D3/WVUTYnUCeyoADmJviDW9PhJhCwajHme9u1KDEyclf4OaHz3RlNGULD
         EMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770321889; x=1770926689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lutadAeu4e7BBQbDMidbIXRD6r3yDEuccAzMlRoMGq0=;
        b=tAZApPLwcZP6YvuGiJCM52QUB8qzESSns/Tao0d4ShDTA7GNcdMzh9bl+e71ytIEDH
         5VGnTEnuDtmIr66B3IpRbtmOCxh9QUx8Ic5unnOlMS+NYg0eZC5NJCrlVM2reaJzw015
         RdEWoPbXKam+74iwovUWwKaFDQSf4dGdbscUo3JmfoBMw5XTCQHUNQytJlLI6t2pWDS8
         AuQmGGWDC6toJWRO43EcVVz9o6UoyzL9P77kZrfuLY31YUvmFsQVtIlA167/H46iqXso
         mQXMchzyNAqVmn0xNsxLFtXXkaXHOB/9STyVcPeDVbvtuS9UuShs+bP7eHXKqseRewIs
         pR/w==
X-Forwarded-Encrypted: i=1; AJvYcCU2aZYzLfYIJxBcPrIdJsm83ylkARhgX1rOPnsgOQacKvtTxQevJf47Pl9txi8rlVIfp+2rzhBTYQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVgy0hv+J2vKI+qGlYD6BrgwELOJmoGOKktmGOufWIRfI+YOF
	40Za/kjJ57eV9l2MawecpJNa0fo/G/WmBNI9Y7TqAbXwwrnCmirJ09x00b2oQg==
X-Gm-Gg: AZuq6aLsCsP0NSmI5rZbSTjEtH5n5xvbnWNrO45ZlJwZ8Aqw4mdUS1M5FxH1TGcEujB
	q94yBKUYe8ixCWyCSybAD65fQNZPrRTyKcuuzbkSMGkxxEJcYuqr8F40zI3bzivSFB5jmiYNFKO
	kAnZLpmHtdDYHY4HWzlj2RfdcWs63OmrDXc/n9l50+f/Wm9KRpvuTcytJl9wyXGLxOkTSrwyjbB
	U7tPPggVUwvfqw8U1OWFDMl4h8QTYqNITFTT3BQ/PBEt6bYuesFlbOaiRdOE3tGcQuMUNmFxgo8
	UY/jWdkc8GqqLJssAc7opun1OmiHcZELgPTiL2yoBG0g2BeOLDANAykDzZE4EIeVjsLxdQ0+Xp2
	wxCymh8H9ei4kdoYaS7tjXjThLIYME1rLHDANxNSBVOLd7Rmw3SzVdVty5hwo+391kTG2JxcR46
	zNKxkNxotPAF8bkOvclpuX3dADNkY0cwPG12FrK1ndYn4llk4knllT9RCLdaKGFQ==
X-Received: by 2002:a05:6a20:3d0a:b0:38d:f405:709e with SMTP id adf61e73a8af0-393ad307e51mr212862637.48.1770314685545;
        Thu, 05 Feb 2026 10:04:45 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:04:45 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V3 0/3] Rust support for powerpc
Date: Thu,  5 Feb 2026 23:34:26 +0530
Message-ID: <20260205180429.3280657-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75405-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF915F7077
X-Rspamd-Action: no action

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been 
merged over it. ppc32 needs some toolchain fixes mentioned in the patch 
`rust: Add PowerPC support` and the discussion for that is done here[1]. 

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out. 

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 12 +++++++++++-
 5 files changed, 36 insertions(+), 11 deletions(-)

-- 
2.52.0


