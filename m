Return-Path: <linux-doc+bounces-87520-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OASkM3f4BWqcdwIAu9opvQ
	(envelope-from <linux-doc+bounces-87520-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 18:29:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BE5544B0B
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 18:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 455D030736F2
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 16:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E22336EE9;
	Thu, 14 May 2026 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XgFv/1SP";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b0w3vFZe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452B3033EC;
	Thu, 14 May 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776045; cv=none; b=a+khIwvZySLp37F+/Y+sf6bU67RdiPgBxlL6evjZetipDX52s28YcBzG8fCi6xz49tnOrLHQ9nwd+/D/qayrAbgGQFXWGQWyimPrHm8KvM2IeAnJX5UrvU0Lxs6U+QOzQC34XlXrb0/nIdGFM3zHvhtC6A5o3CywUXKtchLy6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776045; c=relaxed/simple;
	bh=8ud/dWWNnFaJNyMokCx7aud/a7TX58XT8/HmBCqeWDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiq4WA6K5tO9fTF+Nqu/xhXJAJqDFZptZNtCRU+FC5B+n8SGg/CE2Z5JbEzLL7a3SJkuJIVHS+fvRERfJtCcmyWCz7T6GViL/C4rrEs56LhRdhM4q/od9jEksHn7f0Ya5+6j1++FUyoanVBkejx1Vba4uRgpf1nKu1YoGaNbg4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XgFv/1SP; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b0w3vFZe; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gGbMZ1jpXz9v9K;
	Thu, 14 May 2026 18:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778776042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXo7vXk51/MxewuEblMFL/lSUUQ8x5gJrNXUpDl0w7k=;
	b=XgFv/1SPO2jFHjoA4hTpe+S23n2l2OtyOuvW/vnNX/9K6TDgUNNsyWMKBsg5j+2TfpiDki
	KhVKW1IHtECaJbauFyYjuOaJz2naYHAqq992viQlUiWW5zX9pzK0pUym+lgrflRVbAIqg7
	uzwH7XPVF0U6YJlQWQQY2y0OkO7KhzwRIU76SzuKJiVtJaUiBYjzvZZIurnx0jZwakdhoc
	WELADaqYvQGzAcZsXFxOz6UfaOlW3hxa5zHPMSN69tHiukO+CiExrfUkCwYin0/8fsMJhW
	CEmtWdn6YrbfjA94FTnsixCbZHNwDUAVkm/GADBk4fVsa0hpfMX11M6hIKE9oA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=b0w3vFZe;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778776041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXo7vXk51/MxewuEblMFL/lSUUQ8x5gJrNXUpDl0w7k=;
	b=b0w3vFZeCU6spjtWW6zPavI+cE4ZWR5uOnjL3SCJv9vR0niZ32NhQOLkxg3YFL/QTj3Xfg
	EFn82k9UpxEVTUrpUe+hW3gRqp6c636CHIrHmKTd7CCe1D0G9LJ6biDPiCQ1QvPWdu3dTY
	yXPN+EbfSDoKkxMTfMWgEsR5gtuBeYkmupPppeRFKTFhmv8AJ8ltBbZoX2Hs8bBK2YGtFf
	cZROxvuVUezoMmL9Gp5qt4gO7ypY9Xbg8QCaye4lmME1ep/Ibtgjb8rfl+aqVQTQ9h+pvi
	oVx52vJQqwkV9eAFYfLPw5f2XVtqA0fI9O8E4pp16ixe0My7zN+s9xw1U5wQYw==
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Laight <david.laight.linux@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Date: Thu, 14 May 2026 18:26:53 +0200
Message-ID: <20260514162652.107714-2-manuelebner@mailbox.org>
In-Reply-To: <20260514160719.105084-3-manuelebner@mailbox.org>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1c7ec18dd860b3588e3
X-MBO-RS-META: sqrm6j37hty3bgi75q3fk5c5u4j1x56t
X-Rspamd-Queue-Id: 61BE5544B0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87520-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,canonical.com,perches.com,linux-m68k.org,infradead.org,intel.com,linux.ibm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

add strlcat and alternatives

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..06e802f4bbfd 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
 attribute to avoid future compiler warnings. For cases still needing
 NUL-padding, strtomem_pad() can be used.
 
+strlcat()
+---------
+strlcat() must re-scan the destination string from the beginning on each
+call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
+snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
+of the arguments needs to be taken care off.
+
 strlcpy()
 ---------
 strlcpy() reads the entire source buffer first (since the return value
-- 
2.54.0


