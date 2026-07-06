Return-Path: <linux-doc+bounces-95160-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hQGqI3/JS2oEaQEAu9opvQ
	(envelope-from <linux-doc+bounces-95160-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 17:27:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 050BF712942
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 17:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d1RqDXgx;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95160-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95160-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C1D53041883
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D109636C9C2;
	Mon,  6 Jul 2026 14:48:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174E43A544C
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:48:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349317; cv=none; b=Q0Rw20bjTXxo4lfxP0Maw86C9ziiaqS+btMH3dHjtIaOximfZuFFmE8v2OmVe6hte2trIy5h+IbclmEpnsOGqun2+l0dnrXuMUHY43gwZr58v0vt1/HQR+wuKr11nA6UahSeY2dC3GIQKzfYdJJeTFuNRw7wGwWIhLdgAMDWdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349317; c=relaxed/simple;
	bh=GWx5FgcRD+mDpPY24qaILY9TnVMQBFze1SRetKPUeC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CcXdOHEYai1kX92qFKDJwjQT3Rzvw+QW5V3LXl21p7HNPCSAq+0Ua9PuWpyRLPPoqWKZKtCXT7s/4hZ8cj4m/il+M2l3jhoaK3KAkYtaG9Q95+gEFd7yiCsTDUfE18NLboWlmhfup+fxTQ4pd5Y0IO/2YngKZyOrbaVVq63/RQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1RqDXgx; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b7612475so29265115e9.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349314; x=1783954114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
        b=d1RqDXgxNaLMXNaaq+KXe+Ofnj7OQCaapnaUV66M2hByZv6jtuUJ4zQ5BwKJUROfVh
         J1rCSaZJYEyGv8tR22y6JYIRD4YdyqQ/oe9Rsf3lxd/qeXudqMufPaYcmjVv76JXIK/f
         +4SwPtg4dEaLcXjNFEcKYUbIAkLEmeFJNRZELQpgQm77uY4YS2tqh4qDhm8GoWzAT5f2
         12+JhzrGwVoZJdpzPvIxThLAS721yfgy7kNRx6FNrS1rnP/1F0lXK62SaKa88bN4ygFe
         SIMuI8rrLNwfL/T2dOzCv2XIqh5Fnwi/tPgvCE3vHMRErNmoEJ3SO1A5ZD/+C70iWiK0
         QFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349314; x=1783954114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
        b=TLcPHtddiJIMQunHuWZHlZN5CPC/yhsHstkzvjhLVsOWetQW90nMFoaKdwddj+gT/O
         +YNirizI0OJcMY2yKQ15WZGWWKtxP9ZTfrYanwOuHyUsdb9XOCIm6BLulsuRyM/w49Yw
         4NxuvQvKmQ/dBS5LNPoGvxR+jrkJfYfMj9FgwqL2jWsGVtGOwARTjdhQNcn1/WBemIY/
         oYdyh4/5YWEC4xSSwYpiY9J5smNCJJadQmJEU+IjMpdxpg07ihmDYZvcn6z3DrWry6o+
         pDC9BD3q5KQII5EV9M8UHm7Z1vlye8cf1rZYRjQxjSB5wQCQlUwudYL8eggeiDX91kWq
         dMSw==
X-Forwarded-Encrypted: i=1; AHgh+RrtDpqQVXpEOElTKKjTMA/GW0FRLcIW/1XoqkP3+H1t9yzcYFsIrVZ9Cj6tctqH3HtvOnDCQDJWhYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmfEBV4tf6OikQe908neprUH8b3qZuolW2jCRDhcdpBSCxlEZ
	RrY6eeSISj9H6fpGxCEIfrCBAsIC2ve+5fdjg7c0HCKZXTSc7HMinPax
X-Gm-Gg: AfdE7ckQfletI63QJy75Q+xx+zfFLb8+RRVn17NM2W/nTP+g7J5o2sf0kc8WW2FJkEb
	Le3PhxnnIBztAaAxCq9WwxrK9bRjUOiQQgkg+52Frn9Xxd7LIaHkLSaVuEmZqB7n5DLE+G0YKMu
	srdwXpn09Zn5R7mUM9IGUUK5jHyS4rEtUDRU8k+4z5c7r7DvbwQqCNn1UDeY3tVdWgkcb502HWA
	PydUap6W3FyEAT7GtjkJgbFnVMaj3LEjJDe9+CA+OC0p9gPLK4je9bB3ja3i1TtlG8a3acEf10t
	JnFxABjaF3trrIQfloswKmZA9mHflHwmfwArGbi3ATLYjnk6dQJbRgw2KSrY7RTfdJ5dkdDijW5
	FU+mThT3KQ1u13/5KaKxMH+6H5Fc+B7Kj57alAffnEglKmBA+AGZ7i6DduxHH3XZyXLVyAgztv9
	HFeA8CZinI4Ab1U4qtLkjnB/k=
X-Received: by 2002:a05:600c:c16d:b0:493:bd67:316 with SMTP id 5b1f17b1804b1-493df074319mr9805435e9.16.1783349314326;
        Mon, 06 Jul 2026 07:48:34 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:33 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 0/3] watchdog: npcm: Add reset status detection support
Date: Mon,  6 Jul 2026 17:48:25 +0300
Message-Id: <20260706144828.3517631-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,jms.id.au];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95160-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joel@jms.id.au,m:krzk@kernel.org,m:conor@kernel.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 050BF712942

This series documents and implements reset indication reporting for the=0D
NPCM watchdog driver on NPCM7xx and NPCM8xx systems, and documents the=0D
optional GCR syscon property used by that support.=0D
=0D
Patch 1 updates the watchdog binding to allow the optional=0D
``nuvoton,sysgcr`` property used for reset-cause reporting.=0D
Patch 2 adds watchdog documentation that describes the bootstatus=0D
mapping.=0D
Patch 3 reads the SoC reset indication bits and maps them into the=0D
existing watchdog bootstatus flags for NPCM750 and NPCM845, while=0D
leaving WPCM450 unchanged.=0D
=0D
Addressed comments from:=0D
- Conor Dooley: https://patchwork.ozlabs.org/project/openbmc/patch/20260705=
140100.1543486-2-tmaimon77@gmail.com/=0D
=0D
Changes since version 3:=0D
- make GCR syscon-property conditional.=0D
=0D
Changes since version 2:=0D
- reword patch 1 to explain the hardware reason for the GCR phandle and=0D
  why it is needed for the reset-status support, per Krzysztof's review=0D
- cache NPCM750 reset status in SCRPAD2 so later watchdog probes can=0D
  report the same boot-time state=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |  14 ++
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  71 ++++++
 drivers/watchdog/npcm_wdt.c                   | 217 +++++++++++++++++-
 4 files changed, 301 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1


