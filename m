Return-Path: <linux-doc+bounces-86709-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG70N8a4AGqmLwEAu9opvQ
	(envelope-from <linux-doc+bounces-86709-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 18:56:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262A5053CC
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 18:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8136D300B45C
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 16:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B63388E72;
	Sun, 10 May 2026 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WtRsM16r";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hBNRyXFw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93506370D7D;
	Sun, 10 May 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432194; cv=none; b=GCeWNCcsBvK8UDd6kkzQchkYTGMj683cdJrDc8/sLar5ExHfASTyTsOq5ruCvcrzl6sVcjoVKm6pYNQk5yr3tN72GYdEnLDySTbcwDUTHgEnVWFbVG2+TdQ+y9WoEMd7uxxmkL2wlhYkPC4yEva1fe5GG7W+Q56qTrPhBpRRbDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432194; c=relaxed/simple;
	bh=WLGJjL4gtWz4aeh599TmzMCBnQUHPosUXr1zLmflyWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpsxpCussAkzFREJGwQbWt4CEkAurWSe4Q+yiJOnAot1qS3OZ8BWgoPwQvg4kamuRROUC0DAqaO03pD7SauS6j+wiPX6AAYNI3epeGX7AH6yZRQdDco0VKeJxCUb8vVMAkSafjV/jVEAwcNWAFQkTxqsMa3SOvrp8nrEMQNqjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WtRsM16r; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hBNRyXFw; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gD8C13dCFz9v4J;
	Sun, 10 May 2026 18:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778432189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6U9H9It6s5PNBOTSM0ITXI4EJxod7/On7zf8/Flx0c=;
	b=WtRsM16rPKMh2Hu5P2a2WmAzLBwyJ7kbee38wDzuLyfd0SOY4/2nZatKqefVvQbg9wB5zX
	5uAo5SKf79CvYP5jPJMNl9kiYSKKHMfZiaHz3NA1MKftk3q7+y8qaoIjDYVgHbi5Dc8T4y
	/CQzfCtXrO5XcnEGOMIsHuVmq1rgmSSkLUmZbK45Qcy3qqRwU+6ZLU60BeCBy/u5pbNUT4
	Mn1LgNGbAgheic4JO8JRlQKlPH4N4A68Ds8ISa0U/KKdRLukuUh7VhHS/X5pdVBHNsluEH
	7v+1eEbznRXaVkEUK1rfdXba9kxL9tS2XuYAUgV/MsUCb75WkF8q89h8JSArPw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778432187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6U9H9It6s5PNBOTSM0ITXI4EJxod7/On7zf8/Flx0c=;
	b=hBNRyXFwUDPKz6a/oIvgwuoGqkAocUPw/3y4EqkXem+9QUOEoGkZTNdsMwJOwg7JboT/q6
	8oHn83Hn85uRBpe56+uJ23qM0UKCfHlmcAX3yDXh0KyxIfyaAG8hhk1begTZZXfglH1h5W
	9TyTHl4Jyd4A0SqWEzyJrjcXN0/yGrMOuWxNnpMTs3LvTbX1F3TTuoiSwQwTSvdcUL3MU3
	Gb69DJVuCKBlEjWLh2a918csEaAtgE4YsoUv1W7vAvC7vYJh44/DFkOdozDvvaT42f3Rsy
	XsgaNMkIRni0orHgi8BUAtS6t4A28quTCmliNPFajtXdNozulZ5mueLzj64TmQ==
To: manuelebner@mailbox.org
Cc: andy.shevchenko@gmail.com,
	apw@canonical.com,
	corbet@lwn.net,
	dwaipayanray1@gmail.com,
	joe@perches.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas.bulwahn@gmail.com,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Date: Sun, 10 May 2026 18:54:52 +0200
Message-ID: <20260510165451.57674-2-manuelebner@mailbox.org>
In-Reply-To: <20260510164907.57176-2-manuelebner@mailbox.org>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yzudd5mbf75sfruuu9od7rgh474xcx4c
X-MBO-RS-ID: 4c36ed6b1f9555b04d2
X-Rspamd-Queue-Id: 4262A5053CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,perches.com,kernel.org,vger.kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86709-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

add strlcat and alternatives

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..b8a65c19796c 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
 though care must be given to any cases where the return value of strlcpy()
 is used, since strscpy() will return negative errno values when it truncates.
 
+strlcat()
+---------
+strlcat() must re-scan the destination string from the beginning on each
+call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
+snprintf() and scnprintf()
+
 %p format specifier
 -------------------
 Traditionally, using "%p" in format strings would lead to regular address
-- 
2.54.0


