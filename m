Return-Path: <linux-doc+bounces-94430-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UnGiNdxnRWrS/QoAu9opvQ
	(envelope-from <linux-doc+bounces-94430-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:17:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3506F0CA2
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:17:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QjOT8onH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94430-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94430-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4220300E685
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154613A1CF8;
	Wed,  1 Jul 2026 19:17:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE80396B73;
	Wed,  1 Jul 2026 19:17:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933463; cv=none; b=MkPDOkLfAsju5GQG67enzjGgmWFweUqMXcpJdFY9qsGlTlk5e+8CslDGEVC/bUXZz2GuNo9LfXf/hzDi83OiM3Zucm6+6dD4ebkrR4vX8x9OTKeKoK5C15yW1/aQ2lPZRSxcDmYYNtxtcBX+mZSKXTpco7Ynp0O4NGKKl/Bf1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933463; c=relaxed/simple;
	bh=8hlsNJwLVmwEfCaaR0JCgSj1BvL63EIf3rbMPpEQvk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EupzXsiej+mo0PJ80ZOL7F1eEiL3wC4vwS5oJTqthXI/OCbq6YQHZ2Znyzag+4XKznaXCACKnuy77EP0Vo5HwMmMw3q+SrkB8gdnUFAt4BaE8QKAIdeao0d0NLHb7DHRLTr+rUx733cVTo4XRlbctGLkh6y2DzdDnpcpan8//OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjOT8onH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E531F000E9;
	Wed,  1 Jul 2026 19:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782933461;
	bh=MjDTQx6jwARKGIYrveomBgrbdeElkKOcbcwnV3sjYEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QjOT8onHsyGo7Tb/vUziYeHLHQFgGRpE82ed8PSz8/QMLKZXxYSdoYnFC7GzpHlKP
	 Ke1TQSLLlHMCLRmLftUrdZcPmd2hvhwVt3wvP+Yn4QViPd0R9siU5VxQFQ7wsc5X0+
	 xFPFofP8d6H8HKczJndj7LainM7MyrMYUHl6ub5e8iGRf0NLOYDIsLi7P+SJCIAqYb
	 Q+Z2j5pizowNlNclW7bljMA4tdFT2TGPW9dDpZUwOb9um2hR0zI/Pv1QO/5RXqwI9X
	 RE3u6ddrXF0UeJxHn537uY78qnw8r3HTdn2asnDN+MIrNrzyzyIMJsrvUtp0tIPo6F
	 Rh65X9+lb8vMg==
From: "Rafael J.  Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 driver-core@lists.linux.dev
Subject:
 [PATCH v1 2/2] ACPI: scan: Set power.no_pm for all struct acpi_device objects
Date: Wed, 01 Jul 2026 21:17:28 +0200
Message-ID: <2436882.ElGaqSPkdT@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <6027395.DvuYhMxLoT@rafael.j.wysocki>
References: <6027395.DvuYhMxLoT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_NAME_EXCESS_SPACE(1.00)[];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94430-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-acpi@vger.kernel.org,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE3506F0CA2

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Now that drivers do not bind to ACPI device objects, there is no reason
for them to be included directly in power management in any way, so set
power.no_pm for all of them.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index ee24c65d43ed..8515e1892643 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1811,6 +1811,7 @@ void acpi_init_device_object(struct acpi_device *device, acpi_handle handle,
 	device->dev.release = release;
 	device->dev.bus = &acpi_bus_type;
 	device->dev.groups = acpi_groups;
+	device_set_pm_not_required(&device->dev);
 	fwnode_init(&device->fwnode, &acpi_device_fwnode_ops);
 	acpi_set_device_status(device, ACPI_STA_DEFAULT);
 	acpi_device_get_busid(device);
-- 
2.51.0





