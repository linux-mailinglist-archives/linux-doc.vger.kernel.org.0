Return-Path: <linux-doc+bounces-85840-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE6RL8y5+WlICwMAu9opvQ
	(envelope-from <linux-doc+bounces-85840-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 11:35:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 141BD4C9D58
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 11:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B10C43004418
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B489031F993;
	Tue,  5 May 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="hmLypVZ6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742173264F1;
	Tue,  5 May 2026 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973207; cv=none; b=hI41/9fvL6oaxmm1XLY1yY6bNbV8XRCm++OPVjAyqVqDXFyv6EdH+Y7SujahrnYAJm+SoD2K+9lqBRK4SWxSVh/moI30v0/ax+PeHQoAQ79cCwfsGUC7i/OwIrMtdfnctpw2ccpqxVKL0rOJaDs+5wHk+C//fsuPrDCUkwqvXac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973207; c=relaxed/simple;
	bh=jMj3wMk9KiHUQnn60IoB3KkmCvFOVdxij1Ncga2+HQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfYXvojT7kANq9TmnrwF8To6xwYoIYjSBSIw0ogV+7epDhZKILMP8A3rkuwwL5vjnr4rqcy1Q5YpH/RA1kB/C5KJ1PvlcgTxfx2e5Vb0j8KeaKdNsT2aJBg7GZOwD/Wt78yqZV/vXmcVd5aA/gPsYxUrK5J2uCVvETGR1GNsP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=hmLypVZ6; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1777973200; bh=jMj3wMk9KiHUQnn60IoB3KkmCvFOVdxij1Ncga2+HQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmLypVZ6D+mLkdhQvHcxtHjKMdvHBK2M+hm6j1RDKbSPUOQbwaIxsUQm+1kpoI0hK
	 9nZmym3ZCfLwnKyrwVifFBCjMt1OwMLLHaNz5T8d0NPhLHpWi9KrJt34AFDrudehLP
	 Xfmtm9OLTEqsX0CMDOuDyL0tUxe8mbfVoIXJ+9Ic=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 69f9b7d0-23fc-7f0000032729-7f000001b35c-1
	for <multiple-recipients>; Tue, 05 May 2026 11:26:40 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  5 May 2026 11:26:40 +0200 (CEST)
From: Philipp Hahn <p.hahn@avm.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] watchdog: Replace intermixed tab/space indent
Date: Tue,  5 May 2026 11:26:14 +0200
Message-ID: <e1ccbfb0efb9a9f508d1afe10263af1578a1aa46.1777972790.git.phahn-oss@avm.de>
In-Reply-To: <cover.1777972790.git.phahn-oss@avm.de>
References: <cover.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1777973200-5D65EEEC-444AF52B/0/0
X-purgate-type: clean
X-purgate-size: 1017
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: 141BD4C9D58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-85840-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[avm.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,avm.de:email,avm.de:dkim,avm.de:mid]

From: Philipp Hahn <phahn-oss@avm.de>

Consistently indent all lines with tabs instead of having one line using
blanks.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 Documentation/watchdog/watchdog-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 2c138eaa43397..78d0940155b13 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -161,7 +161,7 @@ available to ask what the device can do::
 the fields returned in the struct watchdog_info are:
 
 	================	=============================================
-        identity		a string identifying the watchdog driver
+	identity		a string identifying the watchdog driver
 	firmware_version	the firmware version of the card if available
 	options			a flags describing what the device supports
 	================	=============================================
-- 
2.43.0


