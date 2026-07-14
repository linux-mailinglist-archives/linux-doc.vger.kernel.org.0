Return-Path: <linux-doc+bounces-96732-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U/V3OHEbVmoBzQAAu9opvQ
	(envelope-from <linux-doc+bounces-96732-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 13:20:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A3753D65
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 13:20:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="V/H6ycir";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96732-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96732-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 138C93008D2E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F80373C12;
	Tue, 14 Jul 2026 11:19:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD183630AE
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:19:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027989; cv=none; b=IPfX1d82CJ1nftNueZZr95uD2ahKDE+nDElLFQkViMn5q+dox2Kik8CY3SBFK0ChtVoqxKYRQ8gGyU7D2G8g6rjkYWUOKJvE13vLRIhDUDpwcBRMvtUicj21dHP7dVQ1eIY1K9VhuarydwHYm2O2w1NS+fFSomOqE/exHw5gGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027989; c=relaxed/simple;
	bh=9hIfe0/tKGQr3wplwygaz9vy9nS1WvRxv2rlQTbTWoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gR7rT1bXgpjFnL22OM/rMenuL8aGDVAq0ReB/y9vhtH/eBZbvbqiSRswTo8R+kt4uKDA7RCdesp6imw5rXEwcM/iP/JcAfUsDb+Z6f2F1au2traiJl/7q3nyHPlvBX8JorwSNVGPw/dNoPmTc6mLnC6ywQ9CFwKt6o6khO4POmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V/H6ycir; arc=none smtp.client-ip=95.215.58.182
Date: Tue, 14 Jul 2026 13:19:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784027985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Af73+vG2sOh1qiwJ+CI1BNZVy77wvK6uB50Y1nftWjc=;
	b=V/H6ycir0SiBz9PquxIA0hWRKkKxSSvXXIh6Hhv/ylg7rJvX/86eUu501ubbJv7RpOzLg1
	eR4b5DKszuGZE9+DJbNM9QQsAaJ8vtvaWELPiRZk9SJ0Vax04hicI3beGDjUgBXx1gpx5I
	WZTpptYZ/Gjols4XkrFkunX/0zJZYs0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/3] x86/vdso: Improve vdso=/vdso32= boot
 parameter validation
Message-ID: <alYbRk7kaPGEveWS@linux.dev>
References: <20260713233422.127348-5-thorsten.blum@linux.dev>
 <b03d7122-52a5-4539-817c-15735a774ef7@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b03d7122-52a5-4539-817c-15735a774ef7@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-96732-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 129A3753D65

On Mon, Jul 13, 2026 at 04:40:55PM -0700, Dave Hansen wrote:
> On 7/13/26 16:34, Thorsten Blum wrote:
> > Replace the deprecated simple_strtoul() [1] with kstrtouint() when
> > parsing the vDSO boot parameters. This provides strict input validation,
> > rejects partial input, and warns when disabling vDSO for invalid values.
> 
> Hey Thorsten,
> 
> I'm curious what motivated this change. Were you trying to manipulate
> the VDSO and ran into some difficulties? Or is it a larger effort to
> audit and simple_strtoul() users?

I just stumbled upon it while studying the code, and simple_strto*()
calls are often an opportunity to improve input validation.

