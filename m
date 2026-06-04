Return-Path: <linux-doc+bounces-90902-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fe5tN2ZCIWp5CAEAu9opvQ
	(envelope-from <linux-doc+bounces-90902-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 11:16:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E663E6D4
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 11:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l7qL07e3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90902-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90902-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2C593091A85
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 09:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070CA3FE64E;
	Thu,  4 Jun 2026 09:08:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C33FE371;
	Thu,  4 Jun 2026 09:08:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564120; cv=none; b=fY7Cj0JJ6LUEWDS6cbhB5RYlxyrhIriTCOcph72Cs0IduaA/YpLEA0xv9MulqAA1XRsvj5mVbqO0Zqx4hzpAJyuyNoDl+IxD09lE7veuu52AcJ5aCK2ZfjkMAKi06tlbRF5TP1ACdPoFwnENr9Hr5pZmxyeKKM1cqHXi8f+9Ho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564120; c=relaxed/simple;
	bh=FCXKfyK3R7amxWftCypNVPwpWp03jMbMSnB/igxBliw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnMIEslcOeR4J/zuyJz1roHmNzQy7lKyjEHeZIUtfJttDyrN1d82zGjhitlPCMq1HESrcv6jWA9iqFFZeqcV1JPKxYfHAHh2v26HrgjoGLSHxu03E3gDLxdPUxkYecSDMB9+hRj3j+s72ex62Jg+M/+FNmrCbDycCmtCwUYatjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7qL07e3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7723B1F00899;
	Thu,  4 Jun 2026 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564119;
	bh=LpfiuMeakI0p1/O+txo784HcmLdX0vSFzINtraQdAVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l7qL07e3iQ1+gfuH+MVn0bVSjMRq3fXIcrWZISnHpPiAzl0WN5CVKdaj1vtKoTI9H
	 /kMc23h2MR/LIROwCqSS3QL5BmYQ7BGWE0aGxNLaGhlPfNrjlYpdKqBuvHrYls/f3t
	 uV0aan1arHJtw6fsgOxnltASh8rJj2gFJAWOhxToAMfOSGalgYmV7ANaQXKfj2nbj1
	 cMzkSXqle657c0lizK9W3VMN9XKsCiSMztje2WPlBp4GRknZdqIskVZJan6eTISQj/
	 1QfwwnBrleyCDH8pFF/2S9MSbEbJbX5/tlwIIsnmnVBBSu33AaEYoP/zOWiWO3RvfA
	 +ugcqCI/AasxQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	tzungbi@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	tfiga@chromium.org,
	senozhatsky@chromium.org
Subject: [PATCH v2 1/3] PM: core: Rename module parameters prefix to "power"
Date: Thu,  4 Jun 2026 09:07:49 +0000
Message-ID: <20260604090756.2884671-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
In-Reply-To: <20260604090756.2884671-1-tzungbi@kernel.org>
References: <20260604090756.2884671-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90902-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:rafael@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:tzungbi@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 744E663E6D4

Currently, the module parameters defined in drivers/base/power/main.c
use the default prefix "main" (derived from the filename).  The prefix
"main" is too generic and non-descriptive for power management
parameters.

Redefine MODULE_PARAM_PREFIX to "power." at the beginning of the file
to group the module parameters under the "power" namespace instead.
This makes the parameters more descriptive.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- New to the series.

v1: Doesn't exist.

 drivers/base/power/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index ed48c292f575..cd864f3a2799 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -40,6 +40,9 @@
 #include "../base.h"
 #include "power.h"
 
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "power."
+
 typedef int (*pm_callback_t)(struct device *);
 
 /*
-- 
2.54.0.1032.g2f8565e1d1-goog


