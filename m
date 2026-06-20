Return-Path: <linux-doc+bounces-92997-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ORLyDxYdN2qfJQcAu9opvQ
	(envelope-from <linux-doc+bounces-92997-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 01:07:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114B6A9DB8
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 01:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=xIkAbuqG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92997-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92997-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF10B301570E
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 23:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BFD238150;
	Sat, 20 Jun 2026 23:06:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86626B2AD
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 23:06:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781996795; cv=none; b=BSRsybLqprziplscsCuka0TXjjz6ClUz48Gme2I6Gi/GC8bftAh2UtBCBGST/YfV6hA4yWLo6QvrNfAje7T9+Oe+9h+Uu7MCoc6JPuf35xCGCk/WXThBAiVQEzoszQx4Qj5WAGRH0UmhU3IvXCDNxrVRj469klqkuMdwyDhWZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781996795; c=relaxed/simple;
	bh=pXpxU+2ApaEvSPI+RP+WZtBXVIyeEMDdVxDny6TSBOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0fWLBQrb9kHBk4rThj8ZUO/k1uZzas2C2vZcT5vRRDyddVKGyZc9OBv595yWFojj6Vwc3pNhTAlPjmK8dp6p6+sWECM8EL6jox5YvHC98ny58rBXyYLpijA2ARIRuQfqg3GQdjg1ur8+XQhj/bIPt8etupGairjwe31BiKT7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xIkAbuqG; arc=none smtp.client-ip=95.215.58.170
Message-ID: <54430fa8-00ac-47b7-a8e1-b2843581ffc5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781996781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffNS15lFq3TC2UA1okQjo+eN+2l6iRu6XRsdlBA3/FE=;
	b=xIkAbuqG322OG7rmC8cRgpBhxqFbaphCw/K21uexGUQod64yVkrSAglEHA5UaSOalVHbaw
	55seWGT4eUo3ZJ8aNIW/I1rU18gWEYVrf4Ql1Schpiks7HlbBBrfUjeS57lhM/aoI2d0KK
	0Gja4XRCTkXEcAcl+eUU3jJlSFkOaYk=
Date: Sun, 21 Jun 2026 07:06:04 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: ipmi: Fix path of the "hotmod" module parameter
To: Randy Dunlap <rdunlap@infradead.org>
Cc: openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corey@minyard.net, corbet@lwn.net,
 skhan@linuxfoundation.org
References: <20260620122747.7902-1-zenghui.yu@linux.dev>
 <626477f6-8bda-4cac-8341-c720fd279ba3@infradead.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <626477f6-8bda-4cac-8341-c720fd279ba3@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92997-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:openipmi-developer@lists.sourceforge.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corey@minyard.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9114B6A9DB8

On 6/21/26 2:40 AM, Randy Dunlap wrote:
> 
> 
> On 6/20/26 5:27 AM, Zenghui Yu wrote:
> > The correct path of the "hotmod" module parameter should be
> > /sys/module/ipmi_si/parameters/hotmod. Fix it.
> >
> > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> > ---
> >  Documentation/driver-api/ipmi.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> There are several other places that use /sys/modules/ instead of
> /sys/module/.

Yup. There are:

Documentation/driver-api/ipmi.rst:This is done using /sys/modules/ipmi_si/parameters/hotmod, which is a
Documentation/process/debugging/kgdb.rst:config string to ``/sys/module/<driver>/parameter/<option>``. The driver
Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst:参数，或者在 ``/sys/modules/damon_lru_sort/parameters/<parameter>`` 写入正确的
Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst:    # cd /sys/modules/damon_lru_sort/parameters
Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst:參數，或者在 ``/sys/modules/damon_lru_sort/parameters/<parameter>`` 寫入正確的
Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst:    # cd /sys/modules/damon_lru_sort/parameters
drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/debug_layer
drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/debug_level
drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_method_name
drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_state
drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_debug_layer
drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_debug_level
drivers/acpi/sysfs.c:/* /sys/modules/acpi/parameters/aml_debug_output */
drivers/base/module.c:          /* Lookup or create built-in module entry in /sys/modules */
drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: *         On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
fs/btrfs/sysfs.c:/* Set perms to 0, disable /sys/module/btrfs/parameter/read_policy interface. */
fs/cachefiles/Kconfig:    enabled by setting bits in /sys/modules/cachefiles/parameter/debug or
kernel/params.c:/* sysfs output in /sys/modules/XYZ/parameters/ */

> 
> Would you care to fix those also?

I plan to fix them by subsystem like:

https://lore.kernel.org/20260611142518.77343-1-zenghui.yu@linux.dev

Thanks,
Zenghui

