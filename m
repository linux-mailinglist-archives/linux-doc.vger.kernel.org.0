Return-Path: <linux-doc+bounces-94432-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hDzfAYVoRWrr/QoAu9opvQ
	(envelope-from <linux-doc+bounces-94432-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:20:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4AA6F0CD1
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gUs0Jeq7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94432-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94432-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6050530E781A
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA1F3DA5B1;
	Wed,  1 Jul 2026 19:17:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCB83E0C41;
	Wed,  1 Jul 2026 19:17:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933470; cv=none; b=FhgXKiiHJHNBde9fsW6OBfa6EZj2m/PbqgVEcQ5nYGSyFNkQL51DCCXAyaPN6zToBBZ7CLF4oC+n2mP5Soo2oWAvzsjFq+COuLj7i/pL4O/kVAXmOvOmfLEVRSlHdeEEm6q92d18YGi1yJfUbOGq3J0iin7kFoBT4jscgQ0kNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933470; c=relaxed/simple;
	bh=eX50BX/r+6llFUlAe8GrtLxOQ8GSwiCC6D3ObIBf+gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iWohS/yNfaRI3OV/uhCFBjpyjhZaSNjhTyiACiqBl7Lz14w2EjXlQ8hR4gePWfTWn6oBI7Y2K+AWUQCg5e+hUR646gC7yQxzpPu3VFQHsUrJjugHeKmtm4gfTmzWa185KjSgNsyrpHysou2ZSOYReJLtmP3S0+xnN53yTJAz8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUs0Jeq7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B501F00A3A;
	Wed,  1 Jul 2026 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782933468;
	bh=eX50BX/r+6llFUlAe8GrtLxOQ8GSwiCC6D3ObIBf+gw=;
	h=From:To:Cc:Subject:Date;
	b=gUs0Jeq7Me+uDtTvtmtoAdeOK3mLlnS71XS+n+ABb3q7C6TIJDvWV57VkHSbVEJ8W
	 eG8thqJ8J455oOtIITwP0Q7Rj/RqKXi4oAZRn/4ezaNr+K+6kHtS32W0vdCR5E76gW
	 wSjxXeZvxWTIgtXMclgF+OrDz/Nu1PXA67sQGbB7n7UU/06UNnqLBq47yr6unhvl+5
	 lXg7JEPfD3EhKPcQ3d5Io1Jx1yTEXAnOtNG8RHX+MhUye0htpONurxpFeOJILhCqP6
	 LJjFjuBHQTAzQ4QmLkrEmL8RiFpmiiQ2mA13QcayVaR7JCuGFe0kmJY2ciHrJ0vPWj
	 gEUw/ZIuxyMWA==
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 driver-core@lists.linux.dev
Subject: [PATCH v1 0/2] ACPI: bus: Remove struct acpi_driver from the kernel
Date: Wed, 01 Jul 2026 21:15:27 +0200
Message-ID: <6027395.DvuYhMxLoT@rafael.j.wysocki>
Organization: Linux Kernel Development
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94432-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-acpi@vger.kernel.org,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,rafael.j.wysocki:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE4AA6F0CD1

Hi All,

After converting all of the drivers using the struct acpi_driver interface to
proper platform drivers, that interface can be dropped now, which is done in
this series (patch [1/2]).

Additionally, the no_pm flag is set for all struct acpi_device object since
they are not going to be directly involved in any kind of power management
now (that is, they will not have PM-aware drivers and they will not be
included in PM domains).

Thanks!




