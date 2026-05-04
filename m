Return-Path: <linux-doc+bounces-85654-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NoMB7mk+GmxxQIAu9opvQ
	(envelope-from <linux-doc+bounces-85654-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 15:52:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9004BE106
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 15:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC865301F315
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 13:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD1E3DDDDA;
	Mon,  4 May 2026 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="r+USpQTx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565D3DA7D7;
	Mon,  4 May 2026 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777902754; cv=none; b=TWZ49Vh5Ln+8noP14NKBxST3q8cmcyjtaiDGUuOlQ89F3+kgPArFSzVvK81MEanCsklxCRq5fveSaFizV72+wP2DD07Bf4HJxegD9yrr/JPz+i04OeVRW10cmkfoN5hdPIfTupOT+w4l5O+2svcriwmAZHCTEyRm8/hAO4S8R18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777902754; c=relaxed/simple;
	bh=rTHndH9H6DJkfEgxqt7kbM04qUFjUllOUAOS1X12Cb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tz2C55NfBVX38aNuf5qLGi1Cfp5gxB33dp89jKW7PAZgBb6kJn42O1qKeqOdSqdeFLSKs9d6UucSqKApX6EMG4HVo8G7klv+V/vdU381k9lXhvRaQnPanmYsPqC234iUiUOefnQnvKNT09s4bFXsNpBYivNPgZrgeiz93J4MMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=r+USpQTx; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1777902748; bh=rTHndH9H6DJkfEgxqt7kbM04qUFjUllOUAOS1X12Cb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+USpQTxeM+8F1jcCKd7cP+0ENahkrhCh3C56cJtEPgZBIjVKo2K7FjBW/TN1/u6n
	 ij9/RTDLNOpseSMLMmi0RWhuzHpuVV9beiXIPVb017nDDJZYEWY8vBfV1+GyFfiEjw
	 oZRjEARb5bClfMk9xa7YLzfrL8CRXU5B1/t9SoyQ=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 69f8a49b-839b-7f0000032729-7f000001e41a-1
	for <multiple-recipients>; Mon, 04 May 2026 15:52:28 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  4 May 2026 15:52:27 +0200 (CEST)
From: Philipp Hahn <p.hahn@avm.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Cleanup Linux Watchdog documentation
Date: Mon,  4 May 2026 15:49:58 +0200
Message-ID: <cover.1777902230.git.phahn-oss@avm.de>
In-Reply-To: <cover.1777892508.git.phahn-oss@avm.de>
References: <cover.1777892508.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1777902748-CBE95EA9-428232E3/0/0
X-purgate-type: clean
X-purgate-size: 1563
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: 5A9004BE106
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-85654-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[avm.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,avm.de:email,avm.de:dkim,avm.de:mid]

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

v1 -> 2
  - Drop invalid SPDX change to Documentation/watchdog/index.rst
  - Add SPDX to Documentation/watchdog/wdt.rst

 .../convert_drivers_to_kernel_api.rst         | 28 +++++++++----------
 Documentation/watchdog/index.rst              | 20 +++++++++----
 Documentation/watchdog/watchdog-api.rst       |  4 +--
 .../watchdog/watchdog-kernel-api.rst          |  2 +-
 Documentation/watchdog/wdt.rst                |  8 ++++--
 drivers/watchdog/Kconfig                      |  6 ++--
 6 files changed, 40 insertions(+), 28 deletions(-)

-- 
2.43.0


