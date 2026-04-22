Return-Path: <linux-doc+bounces-84144-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HMmCS2a6GlNNQIAu9opvQ
	(envelope-from <linux-doc+bounces-84144-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 11:51:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA817444471
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 11:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8A03303D2F8
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3E23CC9F2;
	Wed, 22 Apr 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="DgMUIV9B"
X-Original-To: linux-doc@vger.kernel.org
Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6373BF689;
	Wed, 22 Apr 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851369; cv=none; b=KFmnlGUx3iKLyIPiCYYZKrpw97KJYTlN5Bk6aHYZugA4r3m0JSviM854SjgVRbtbFdP8/ylqBtDlC1UZcKRIsAeUPobJ8m2xpo0/r+gujl8A1+5I9FGmWW79108kV3rH3E479ClfBMRup9lL5ePw07QLlf5jDCNm7/oVxK4yPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851369; c=relaxed/simple;
	bh=15chuYpccSlT6UpH8TNwNGnGHfksA7xi4fPhMzJSTtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1SQvVqzfcgX5J76iIPnX2+MTFSTANDuKL0OSutYLY/Olj4K9xTiyCtnznUlYSmri33uVLf1XVkqEFhy+M1Qo+xDhh1jTHbxn20ntB4VUNbDh29ixfjlugBkxwjN8+PTIaQXDOALb/hWvA00jsvQPI1sJApdLb1rGLoI1ZFABoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=DgMUIV9B; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851368; x=1808387368;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oCL1gEFUP1wdiZ4mPtneZFBWlCiHxBCt8+1MrSojH7w=;
  b=DgMUIV9BHTGiqw/rwcBi3frMa/ERShyUqL2eFvb6QtgC4SF2vvCIBBtc
   DjJKU2RsAy38weI5fvy2to2+5ZHVhW/IVZ6Tav3GC7aZ37Wxtz78HRtLa
   QbhhFYeLBW1TZSId3E+087rZtRGP7/WjwO6HOtLTMmzAKxp+au2FFlxlF
   7e7xTdoUXfsRN2SVAO97+7fySNfSoeo5idu0xSwqDxOkSb1/cFzEtdv/3
   X9rB/DoF1e9QcCUUxRyX5cBFaIyoGSeahDMla0rNX5XWfYmKAQHd0TDkU
   TRjD4SOFbBmosxaodC6Te2FqEpsfP4CaBywES6Grwcp5sP9L4vOL/1zQ6
   g==;
X-CSE-ConnectionGUID: l7LAwCMhRimrHXZdQZKJcA==
X-CSE-MsgGUID: BC4Up8KvSqe2F/ELC/B7xg==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:20 +0900
X-CSE-ConnectionGUID: SgthmcMQRTCdknWd7vVZsw==
X-CSE-MsgGUID: Ta60PQwYQQmW9I62Z0fNyw==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446140"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:18 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:06 +0900
Subject: [PATCH v3 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=15chuYpccSlT6UpH8TNwNGnGHfksA7xi4fPhMzJSTtA=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM2cEchoeX80oYratR2Gj5Zx04SJxhcVGOZ+TJkb7O
 L9antrWUcrCIMbFICumyFKqVP1r74qgJT1nXivCzGFlAhnCwMUpABMJY2Nk+HNF00Fs57JPb8Uy
 XdVs19vsf8i6w+K/728jkSYh54ItnowMx7R93hRNCX8S8Stqo8+qT9IKK45LeT3mv7H9mHSG+KL
 NLAA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	R_DKIM_ALLOW(-0.20)[sony.com:s=s1jp];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84144-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,linux.intel.com,gmail.com,foss.st.com,linuxfoundation.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shashank.mahadasyam@sony.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[sony.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sony.com:email,sony.com:dkim,sony.com:mid]
X-Rspamd-Queue-Id: DA817444471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 Documentation/driver-api/driver-model/platform.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index cf5ff48d3115..9673470bded2 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
 provides helpers to register and unregister an array of drivers::
 
 	int __platform_register_drivers(struct platform_driver * const *drivers,
-				      unsigned int count, struct module *owner);
+				      unsigned int count, struct module *owner,
+				      const char *mod_name);
 	void platform_unregister_drivers(struct platform_driver * const *drivers,
 					 unsigned int count);
 

-- 
2.43.0


