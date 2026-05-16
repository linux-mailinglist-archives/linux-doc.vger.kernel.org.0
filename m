Return-Path: <linux-doc+bounces-87914-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLmZHjnrCGpD/QMAu9opvQ
	(envelope-from <linux-doc+bounces-87914-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 00:10:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328655E0F6
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 00:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 862DA300349D
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 22:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388E531E841;
	Sat, 16 May 2026 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kNKN0ft4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C937EFFE;
	Sat, 16 May 2026 22:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778969395; cv=none; b=MMm68VUBbx3xdqysZ/1NiEZuxzruy51uQGY8eonh3r5ER/5N9Ei2KoNUDx7zw70to6TwDsrlR+wa0YCRCDGfkIyq1JwcOIadjgGe/pzaZKwwqv04nUphf9LKiEyHhGsvXcmpEHJXBDzD+Dj2QWnB6zXS4CdwvocSObQ9F4g5zio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778969395; c=relaxed/simple;
	bh=TrIyXbX29vaPKVKtbl2ASW4kkG7q6yMiP3qcjGATtus=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5SrrAqxWnGK8wrMnxJWpLx0hIaR9OElLWD1t32o6LIzjMA4yMOWnsjdpu+h60XT4sGjvA1zFREEN1HfNtbH3Tt8UUiPyejrJTFYNJQnirFamVzv/AYJqALW9iW1IdjMs24t5GMgGhJax4WluzR80Q4zAU8vTC+bjmU0/vMhkcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kNKN0ft4; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778969371; x=1779228571;
	bh=TrIyXbX29vaPKVKtbl2ASW4kkG7q6yMiP3qcjGATtus=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kNKN0ft4t1gmAiaW1hhB0ZEamtHj7eGZOEc5Ogpi2JRW0GbdMmpFrh9DlGjHoiV15
	 5Luje3B8QkKBxAoiFjLKRlcqQufzr+adL9z/a3K43GcgW3YMXQG3qRHLGC60nLnBGI
	 uTwD1ooFQ0fhY+0xjIm35E+w93iI4PovOQM9TZeG8k8txTPgcDzZ+DvizF3l/30Dwn
	 sTOcGG7zdpL8OrNFasvQP2qhtwRRok+YWt9nDdnG4ESELI3c2tyzuI8iQ95cbBCY1P
	 UCYK14TOZk/4VoD9DWWYi51VEb3RE5JDpm+Mg6tulnxBJk5z+2vqK9ctaILyrsFV7Z
	 h8DtcXSmdqtIw==
Date: Sat, 16 May 2026 22:09:26 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: Hassan Maazu <maazudev@proton.me>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RESEND 2] Documentation: hwmon: fix typo in heading for max31730
Message-ID: <6-vpIVJnccYzmznZMj4zfXmOKnHhtaXdeyJqyqTm3KJwLIEj3iSiWzBVxHnBhkNZHZ8E3KfHn7pYQSt3xrfQOQeN5RCJNnBVwmgyJcaw_zM=@proton.me>
In-Reply-To: <ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me> <ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net>
Feedback-ID: 83974785:user:proton
X-Pm-Message-ID: 7f0b435b75240a969ab55148e09c7073e178e0c3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7328655E0F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-87914-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maazudev@proton.me,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,proton.me:mid,proton.me:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Generated heading & link to driver doc for max31730 wrongly named
max31790 under hwmon docs. This patch fixes typo so link to max31730
is easily identifiable without confusion with max31790.

Signed-off-by: Hassan Maazu <maazudev@proton.me>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/hwmon/max31730.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max3173=
0.rst
index 1c5a32b64187..0936ba2eac24 100644
--- a/Documentation/hwmon/max31730.rst
+++ b/Documentation/hwmon/max31730.rst
@@ -1,4 +1,4 @@
-Kernel driver max31790
+Kernel driver max31730
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 Supported chips:
--
2.54.0

