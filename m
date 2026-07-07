Return-Path: <linux-doc+bounces-95370-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QiUlJUgCTWq1tQEAu9opvQ
	(envelope-from <linux-doc+bounces-95370-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 15:42:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A6271C0B5
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 15:42:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=digikod.net header.s=20191114 header.b=0ZcLvGv7;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95370-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95370-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11DE930803B1
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 13:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623B841D4FC;
	Tue,  7 Jul 2026 13:33:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045741D4C1
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 13:33:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431228; cv=none; b=polqTDRmhkqvMXtqlbb2FYafPGs6Owbbo1/JrFo+1rHqUtmXAnkUgkzVHws+gXQ94J2oxtPVnIzFYP4EZlGH+xqfKnamFRT1k+ikFGZ60ej4hPVQCLoa+fl8iGa47/qKYALCMqqDseJLjYo7ZwY66Ql5PRTWRBVE9NVhDGCndSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431228; c=relaxed/simple;
	bh=JKtzA7TalV7KpwJrSJ7/1o+/5DMUmjzth8LFEplhCuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qk4Ub/EAdJlv9pfmpXgdwl/WVND+0f5YB8uiZh5JlUWXtCcjIWn+wenwj/bOKnMin8LjoR6lwwpXLORU5aGEwhZIeq9t1CwLudFWbzi3okSR+1HaHo4+zNSXD2umvidh6xSoyHj8dyWBYA2tnrsROrISQA4+f2ZmMiC6WEDbXP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=0ZcLvGv7; arc=none smtp.client-ip=84.16.66.172
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gvhy80pf6zqD6;
	Tue,  7 Jul 2026 15:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1783431215;
	bh=1yDnmyxuj24MmdyOIrVy1yMDkssTMDCJebqy56PKwNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0ZcLvGv7AeqMYXLKA3ETIu1A8HfoCRwfukKiIvFA5kDDgIN0XA2po+5WxTKlNozXG
	 6Rd25xf4z1cS+uKAq+uogG1X2Kphp9xGy5C5NCvkWUnSD7Ai/6z18woo3KcfKXGYMc
	 UKbGYvoXTkntTKoRJSHQ0griMYbFJDnc/jH0QHU8=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gvhy71L1JzH48;
	Tue,  7 Jul 2026 15:33:35 +0200 (CEST)
Date: Tue, 7 Jul 2026 15:33:33 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Subject: Re: [PATCH] Documentation: landlock: Document fs.resolve_unix audit
 blocker
Message-ID: <20260707.Ahbee1Fah6Ah@digikod.net>
References: <20260625092819.1870049-1-doehyunbaek@gmail.com>
 <aj0fldJZ2dl0gas1@google.com>
 <CAN-j9UrCAkNgzj+xG8bRaOnducE16_O909Msi3EFVZjEJf9oAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN-j9UrCAkNgzj+xG8bRaOnducE16_O909Msi3EFVZjEJf9oAw@mail.gmail.com>
X-Infomaniak-Routing: alpha
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.75 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.91)[subject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[digikod.net:s=20191114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bigeasy@linutronix.de,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gnoack@google.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95370-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[digikod.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[digikod.net:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mic@digikod.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mic@digikod.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,digikod.net:from_mime,digikod.net:dkim,digikod.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35A6271C0B5

It's applied, thanks!

On Tue, Jul 07, 2026 at 11:40:51AM +0200, Doehyun Baek wrote:
> Hi Mickaël,
> 
> Gentle ping on this documentation fix.
> 
> Günther reviewed it:
> 
> Reviewed-by: Günther Noack <gnoack@google.com>
> 
> The patch still applies cleanly. Could this be picked up via the
> Landlock tree?
> 
> Thanks,
> Doehyun

