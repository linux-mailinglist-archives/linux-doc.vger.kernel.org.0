Return-Path: <linux-doc+bounces-89549-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ2BFeu1FWrKYQcAu9opvQ
	(envelope-from <linux-doc+bounces-89549-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:02:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96095D8364
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F5D030157EA
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 15:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637FB40B6C8;
	Tue, 26 May 2026 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jp4e+2OQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07F400E10
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807410; cv=none; b=gw22Q66kdva9gtKddI5ow5MnRr7tmmMfvgsRmSAcY9ld1iXleVh/r8z1gARBpe5+t7Gq6Fw6FKQNkegliVZj60ssTSqEp0bOE4oU+LAOqx+zYJ42odh7KFnYZUbI3SkQ4HNW1wUIlXcIsE5sy+QrxV3lQpJxwk8/zXP2Fw2kO0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807410; c=relaxed/simple;
	bh=FUqMuwPe/VeYULAiVeahm1trZi1oXESB2z3mCxIRzWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5Wd+p3FEOA1swFskd9qOUf8r+Y28r6yWiQ2OliZdTR1Kdse/0nzcichwH+SGaUxaWmKyrwQ7gDGZ2KKiTs9Zzkcu3Eqx3IyKCuhVoUO5we+2DBP6GatEV835BszH2i85PRlJpkeNTqeRtLVfoZwxqLa8zO54biWvJhMLPer1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jp4e+2OQ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3F900C79ABD;
	Tue, 26 May 2026 14:56:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C47006011D;
	Tue, 26 May 2026 14:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5091510888865;
	Tue, 26 May 2026 16:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/VrR2zWyEuP7FnbthxkSprPO27GGH7TRyCzje2SKqM=;
	b=Jp4e+2OQChIs2rE6csabbhiKQ7D2VRTZeFUWRMldt751sYEgFWaJKq/dC0MgWuvfqELxZt
	T19LRXzdLaRysaZtiCrSP0LR5KgvonWj8+DvqOpK32vhinx10NvOtEmSsaLugyxjjF5Qj4
	xTjqpv9/3azbovdYVCMbxtFGLneqBYiAezHojA4+V1prUYvmQsVvXfRf9Q2uwTJoiyyni1
	i2SoqJkxnQVOJW+V88Gm4rXCBmv0bYw/psj1GiG9hiieqvlWE3lHSSnR5q233R2Tvdcaoc
	A6udLujIwMhjCar+HUUt9zVUID8dEPnltIPRx7UqTVsynzc0Mv6VXNxr4q9B/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:25 +0200
Subject: [PATCH v6 01/28] mtd: spi-nor: debugfs: Fix the flags list
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-1-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89549-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C96095D8364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As mentioned above the spi_nor_option_flags enumeration in core.h, this
list should be kept in sync with the one in the core.

Add the missing flag.

Fixes: 6a42bc97ccda ("mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode")
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..d700e0b27182 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(SWAP16),
 };
 #undef SNOR_F_NAME
 

-- 
2.53.0


