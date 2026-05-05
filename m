Return-Path: <linux-doc+bounces-85845-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ0/Cfe5+WmNBAMAu9opvQ
	(envelope-from <linux-doc+bounces-85845-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 11:35:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4814C9DBE
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 11:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33132309030A
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 09:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E694433067C;
	Tue,  5 May 2026 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="jNfpZ6Hc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209A1A5B90;
	Tue,  5 May 2026 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973208; cv=none; b=Ogi9csMooaFe+50YPVRGzBdIKUH69ANGVezVzH2YXbLirhMLVa9NAecWbVDL25IoFQsmhNxHFnIsGouCG91Dz9A1iuNwSzltENHYryBhUViXP+ZEJNo5jlevh9W242CstItkj8NbYUKvtQ4r4adVRpI9I5wOGDrkyN5fzSiV0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973208; c=relaxed/simple;
	bh=hGOf3RdeFW/xICBXzOqukBR6wqQ4Lh/uVDIalXsOgIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGscF/xlSEwQUX/hIgaEjK+/ULDLh0cHfPzXo8oy0q9oPWOUe6R5oJY+ZgN3Dch7FOZYVmXI3zOeB0dL6u0b98F/dILJMFuPHiezhKQe0ICbv02+tefjXiPhACjzNonAPvdUPYoR8WYHFJ7IBfYBieTx8idq6B5ZweMDNiM6WWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=jNfpZ6Hc; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1777973200; bh=hGOf3RdeFW/xICBXzOqukBR6wqQ4Lh/uVDIalXsOgIA=;
	h=From:To:Cc:Subject:Date:From;
	b=jNfpZ6HcZJVGjOPHhBK4glaurjxQMzxb+XwEnY44BfHlNsOn+N8RwhQVl7yk/XaEF
	 jHmHy+eFBpeyBTePXk6se1/SACZzAJe2KIBz1ztcLvFC48jBSLnkNOvx1XCQE/87/t
	 ampC0ATwjIT7LfmHNBFrKXEfzdKsW8B18qdQQEhs=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 69f9b7d0-88c8-7f0000032729-7f0000019242-1
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
Subject: [PATCH v3 0/5] Cleanup Linux Watchdog documentation
Date: Tue,  5 May 2026 11:26:11 +0200
Message-ID: <cover.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1777973200-54616582-A274341B/0/0
X-purgate-type: clean
X-purgate-size: 1840
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: 2A4814C9DBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-85845-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[avm.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,avm.de:email,avm.de:dkim,avm.de:mid]

From: Philipp Hahn <phahn-oss@avm.de>

Hello,

while reading the documentation on the Linux kernel watchdog
subsystem[1] I noticed some strange looking formatting: `struct`s are
detected automatically by Sphinx and the word **after** it is considered
the name of the structure, but the watchdog documentation puts the name
**before** the word `struct`; this leads to the wrong word being
emphasized.

Also reorganize the index page to better separate the documentation on
generic infrastructure from specific drivers – which are mostly obsolete
and relevant for historic documentation only.

Please apply; thank you for all your work.

Philipp

[1]: https://docs.kernel.org/watchdog/convert_drivers_to_kernel_api.html
---
Philipp Hahn (5):
  watchdog: Change suffix .txt to .rst in references
  watchdog: Move `struct` before name
  watchdog: Replace intermixed tab/space indent
  watchdog: Separate kind of documentation
  watchdog: Prefix WDT with ICS for clarity

v2 -> v1
  - Rename wdt.rst to ics-wdt.rst
  - Expand abbreviation "ICS" in more places
  - Fix wrong reference to samples/watchdog/watchdog-simple.c
v1 -> v2
  - Drop invalid SPDX change to Documentation/watchdog/index.rst
  - Add SPDX to Documentation/watchdog/wdt.rst

 .../convert_drivers_to_kernel_api.rst         | 28 +++++++++----------
 .../watchdog/{wdt.rst => ics-wdt.rst}         |  8 ++++--
 Documentation/watchdog/index.rst              | 20 +++++++++----
 Documentation/watchdog/watchdog-api.rst       |  4 +--
 .../watchdog/watchdog-kernel-api.rst          |  2 +-
 drivers/watchdog/Kconfig                      | 10 ++++---
 drivers/watchdog/smsc37b787_wdt.c             |  2 +-
 7 files changed, 44 insertions(+), 30 deletions(-)
 rename Documentation/watchdog/{wdt.rst => ics-wdt.rst} (91%)

-- 
2.43.0


