Return-Path: <linux-doc+bounces-94244-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hoKzN30mRGpopgoAu9opvQ
	(envelope-from <linux-doc+bounces-94244-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 22:26:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA966E7CD1
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 22:26:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TiAVMuAD;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94244-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94244-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4706C301752E
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 20:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6092E477980;
	Tue, 30 Jun 2026 20:26:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D99413230
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 20:26:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851195; cv=none; b=qF6346xE/GJG+1W+SKZV2pO0/lztVmO79UjoxedeLfQfki4leKnYeWn9hY/iY5tRrrFrqUqrbhVy5dGEaHKHjaLkc7eC8nmUSlnod9Fsp6tqFmqXH0W7RyOPtt6Xe+i1t44Gw8V8snejcX0P6c9pWjbTI+Rgl10LtxMS7+03LdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851195; c=relaxed/simple;
	bh=r9DP1WrPcFuQt7L7Madw71gK8Lh0+d+hmwFEhXPi7rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTda7ndjJ3gJBdhtU+9LMEN5w8P8jcDQYUrkrGi8PmrKzbZtDiU42VQywvSP4aSl/M0C3fysLLvEXRupw1PoFWHi0EQi4ZF4f+2wZXicGgPdGY/Fm+yat9TS68ZHReY+F8YLX8m5t/HbbDdGHVzC4SlWOroyompVlruEJ3W/0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiAVMuAD; arc=none smtp.client-ip=74.125.82.41
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13b2d7dc8d1so1892828c88.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782851193; x=1783455993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9v6wKrWvaDwEMJHkU6XfuSctxTdMgZ4Jkqoo8ewLzos=;
        b=TiAVMuADA443UBcaVCbeLdvt6L4n9g/3gW67xabe7TY0cXvtB7353Wh6wD4KSRS+q/
         5vYEXDQYoNd8xmshI4soizB91n5BjQ1HP8xtPfknN906/VChnQUWeow60dKYnAdfjxYk
         QftiT/f7XVSjq8MQDuu8bq2grVxnqY9eItMMLWI2m9dHSSykwCi/x4fhPqLhqBvmfLbK
         ERVyGigtVKkd1cYfllQI0AccT/2ycr7fWinwvZHNees9iJDHoNhezvNq/2AFoXeBRrjD
         Zvrgclf43CsUa2XKpWwk5Fyv0jVJSLNhXc3Xyo78jND1bOFLqXvWmlCUWsQD5LZqO8QW
         906A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782851193; x=1783455993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v6wKrWvaDwEMJHkU6XfuSctxTdMgZ4Jkqoo8ewLzos=;
        b=j8OqhN+A72Oyra6Q16tlmgzi7Rvo6FxU+ZN9YbTiyyhApMVQnjMRTDNAHtZsoETsZD
         j75VWc85D2bXGCTkogypTd3Hd1+z2Gnb+jcIakO7EW9Qz7IVCIa44F2nNBiE2eMI+kx3
         DVWDjvS29CKJ8GKyQ5F4XRCCNp5GMXDz+zi+UQ3TP4NUBx2EhUoEoMub8f1pOy7n7FhJ
         /MpH20j6RK/hzzbGNJqIAME8om/03u85MGNaj4MlbP+G37XW2TcFLJJJCAvKyPlbYeY0
         2ACW7hoOgc+TFoCScZfRfwDXaszAgC8KYq2U5ODFuR8s0PxHOPCfeRfHrzKTvfq4z8Uy
         NvHw==
X-Gm-Message-State: AOJu0Yza9jWQoJ81iMb9tWfad0nW4TQDF2/JDZ96ZRzfm0ivMHO65rVh
	LsVQ9eHMgymdRUL6dBJyEJ9RwvYLtBd7xyliNt7deZuB/hBrPWzjXA58
X-Gm-Gg: AfdE7cms62nrdyPFkvAOvwCmur0j0G3dYhu5k4ccpvZ3oZpoVeg4GaRux5aPHBedDBI
	5GoP5OZQGgruJ7eegSCDIGwe6PrvGmCai3rQpDBXtk/DweXkeztrG0YF8+z9R/80mUXDF9Tu1gB
	dSRJg8XAGDvUFvqxNfpBhaFpYmTAriaGMHjn6QRSXcoAVRArr6exjkDLc0etPnz86sKCP6hpbXQ
	rxs6HO9RmU2SI7PHntjdFu4nSTxMCp80AIpJcEagd8Z7b9M4cC8d3sr0oI6TK0jxSVJhuUn/EDd
	gLjHedexFIv3SREmgPw1XNYyD6FJkaBTxNRkWIcYJwxQ5Vbe6RlBAOKwDWUIxQmJBQVRaXTN3HQ
	+0LIrZBie9+4lGqLdzK1EAznR1bRKXaBMX5WrJiYeJuL74xuBpx9/yDQf/HwQpz/knIrqzP5XqW
	W4wUymsVkIwraemZpYp030TEfhW+UXDNNT6yTakpISozOG1OvRrcilLGTvbzCAOZZsPfADu64T8
	jHYl+H0kU9mZnIC1zB8oAuC8ntpU4ziFBli5qTVDnCaVaH0YhvFC0Zwinc3vaZt4g==
X-Received: by 2002:a05:7300:cc1b:b0:30c:7ea6:b515 with SMTP id 5a478bee46e88-30ee1204e5fmr3240199eec.12.1782851192850;
        Tue, 30 Jun 2026 13:26:32 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm11157638eec.9.2026.06.30.13.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:26:32 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/7] docs: pt_BR: Translate core development process documents
Date: Tue, 30 Jun 2026 17:25:34 -0300
Message-ID: <20260630202549.278894-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94244-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:danielmaraboo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AA966E7CD1


This patch series updates the Brazilian Portuguese (pt_BR) translation
for the core Linux kernel development process documentation.

The goal is to expand accessibility for Portuguese-speaking developers,
bringing over crucial guides ranging from subsystem-specific rules to
organizational maturity frameworks.

All documents have been strictly formatted to adhere to the 80-column
line length limit to ensure proper Sphinx HTML rendering and consistency
with the existing pt_BR infrastructure.

Summary of translations included in this series:
- process/adding-syscalls.rst (Adding System Calls guide)
- process/contribution-maturity-model.rst (TAB Upstream Maturity framework)
- process/botching-up-ioctls.rst (Driver-private API and ioctl design)
- process/backporting.rst (Stable tree backporting and conflict resolution)
- process/applying-patches.rst (Patch application workflows)
- process/development-process.rst (Advanced Topics and Conclusion sections)
- process/6.Followthrough.rst (Patch life-cycle followthrough guide)

Thanks!

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

Daniel Pereira (7):
      docs: pt_BR: process: Translate the patch followthrough guide
      docs: pt_BR: process: translate 7.AdvancedTopics and 8.Conclusion
      docs: pt_BR: Add translation for applying-patches and update index
      docs: pt_BR:  translate backporting.rst documentation
      docs: pt_BR: process: translate botching-up-ioctls guide
      docs: pt_BR: process: translate contribution maturity model
      docs: pt_BR: translate process/adding-syscalls.rst

 Documentation/translations/pt_BR/index.rst       |   4 +
 .../pt_BR/process/6.Followthrough.rst            | 220 ++++++
 .../pt_BR/process/7.AdvancedTopics.rst           | 201 +++++
 .../pt_BR/process/8.Conclusion.rst               |  73 ++
 .../pt_BR/process/adding-syscalls.rst            | 700 ++++++++++++++++++
 .../pt_BR/process/applying-patches.rst           | 447 +++++++++++
 .../pt_BR/process/backporting.rst                | 598 +++++++++++++++
 .../pt_BR/process/botching-up-ioctls.rst         | 256 +++++++
 .../process/contribution-maturity-model.rst      | 111 +++
 .../pt_BR/process/development-process.rst        |   3 +
 10 files changed, 2613 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/6.Followthrough.rst
 create mode 100644 Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
 create mode 100644 Documentation/translations/pt_BR/process/8.Conclusion.rst
 create mode 100644 Documentation/translations/pt_BR/process/adding-syscalls.rst
 create mode 100644 Documentation/translations/pt_BR/process/applying-patches.rst
 create mode 100644 Documentation/translations/pt_BR/process/backporting.rst
 create mode 100644 Documentation/translations/pt_BR/process/botching-up-ioctls.rst
 create mode 100644 Documentation/translations/pt_BR/process/contribution-maturity-model.rst

-- 
2.47.3

