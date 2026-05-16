Return-Path: <linux-doc+bounces-87820-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J06HoAICGqVVgMAu9opvQ
	(envelope-from <linux-doc+bounces-87820-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 08:02:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00955A69E
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 08:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 113FE3019921
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 06:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FD1357D1A;
	Sat, 16 May 2026 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Na6P6Bqz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702C2F7EE9
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911215; cv=none; b=iqIsmWhCiXk3lMs19STVzj9cOzRclrUDhkNKGRoFbVbV2VoBfXY7I35PjbSjzr5jj6nMFA8i0x86MvolL8s7ijtfhhNMizQ/SmQMQ/dyw7ejaQGdgwTjzNghWn8nDwm5sSArU3pkIwHFCnwgvjrnUt+c3AQ9KjQwHIEyTULydD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911215; c=relaxed/simple;
	bh=3EfO2EvYow3i6WJ5h4w9E7EX5JGTLiNFTnp055mrlfE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HUpZ8fVbTM8Bfqp+gLRe26GC0Ahs5bXvPhH1ncQi2U5akbdOEwI3MGHkx9XSSYkxywGa4khTo+TL2dYhmnjD2/PCHII3s+PMTQ2EjciaeP/tMNftowuVJ4Vz50u/MqV+B+hbYkVdWeZMuUmResDXfZMlTwINa1i+yGH7AF53lSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Na6P6Bqz; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778911208; x=1779170408;
	bh=3EfO2EvYow3i6WJ5h4w9E7EX5JGTLiNFTnp055mrlfE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Na6P6BqzCmlo11mNn7rnYRFmTWhBIhMTL/xNtDINjQ2z/JWWtjaDwHqtO5TACaVtD
	 M7QIOOmioZc/7Qvs+u9naqFXZJn8fCkcdKGzfJzOIsdFbXrhPWINnNSlRGAvR6eHxs
	 bJt50y4WJr85zf/j5s177AWTLyhbPPqqo0Gy0dV6SS+J0xncstUYxJV4mIqbO+sYWY
	 X12UADhJNC9lnrUctBefESYiu0kbYKMj+EAwMsXlMrr+56Pq8uKxtDBz40nNXRybrd
	 ADUB2JG67ZubokN/8LfLmcGHLlXiB0nYbfqBktHcbNcTe2B7ke5akjGJb5WQ44XSx0
	 ozzdcIYw7tRhQ==
Date: Sat, 16 May 2026 06:00:01 +0000
To: "linux@roeck-us.net" <linux@roeck-us.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>
From: Hassan Maazu <maazudev@proton.me>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] Documentation: fix typo in heading for max31730
Message-ID: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
Feedback-ID: 83974785:user:proton
X-Pm-Message-ID: 600e2220327944c2b2b7f59f193c8c18e2619b65
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CC00955A69E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-87820-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maazudev@proton.me,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email,proton.me:mid,proton.me:dkim]
X-Rspamd-Action: no action

Wrong device name used in heading.

Signed-off-by: Hassan Maazu <maazudev@proton.me>
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

