Return-Path: <linux-doc+bounces-89554-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAUINMS2FWrKYQcAu9opvQ
	(envelope-from <linux-doc+bounces-89554-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:05:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44F5D848A
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D76E4302DE36
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 15:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0471C4266BF;
	Tue, 26 May 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HyaC+hiL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC942668E
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807420; cv=none; b=W8MhviQBXWbINBx7AP0RjcSJrK3fP0lWXcb7Jr2iola0O6YBFf+a/NOOIVkyqSDfZPvJVIkfytaWe/QwbvNXQlEO3Ck8HK3GwQgiWDmQ2ADtfZkuKoRfd79BFKMlk7WEHz8OnueR/IUZEhHC4yuCmPhxvZzd3aw1vt0YTCNCbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807420; c=relaxed/simple;
	bh=9MefzCIV+tnB/FnzOtLFwFa7sENOrT3OAIQ9rTsmCUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNb/XhO4uD6LOXg/MpdpLwOrDzgzdAr/rZPrBXdS/DdRH0aPG0q8R/ZBVD1NbgBPVu4rPBPrOlAEmIXdKIHkChixi8UXGONJ5eKoX/BBQO7QRVkYGEq8YPNyyAXPLNG4VCrd6SVnvpFEisr36gVYgXLgy5QCqKGtZQFcxRGeUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HyaC+hiL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5AEC61A36C7;
	Tue, 26 May 2026 14:56:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3001E60733;
	Tue, 26 May 2026 14:56:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6877B108888CF;
	Tue, 26 May 2026 16:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UWpfRE4WtdnRITw0PIgGXyjweTZSRtj+l56eZxMc4k0=;
	b=HyaC+hiLqWkOFUDFVjX64SAYeCE1UZh1wcq0hdU5xghKFXJD1PHFcquZWQeDHomzN1IXvt
	kqEQ7BFgS/73b9tYbMNChDlge9Eg+DPW2T/6V9lAoOxiqKkhih4l4RiwggvLdKWuGg4HRn
	kxS+wepUIiSKRpEEK5znYAeCtyIxbg1FWxEpznd0nUjM89WxXKVE7aWvIJlBM+MMyorAKl
	tMA3GGBoCMisAK/UaJ21k0w20JRiU0dDxaMFusoj2EYtUmEUQkbqRkWUs30eO1Mg6UUAEV
	ohs5pPooeoj/qc73pFbB+NQwG8sgrtlV/rzhPjvdh6wN5kgx6YJwfQOFXR/kdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:30 +0200
Subject: [PATCH v6 06/28] mtd: spi-nor: debugfs: Align variable access with
 the rest of the file
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-6-4092f1419f8f@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-89554-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 4B44F5D848A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "params" variable is used everywhere else, align this particular
line of the file to use "params" directly rather than the "nor" pointer.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index d700e0b27182..69830ad43990 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -139,7 +139,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
+		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");

-- 
2.53.0


