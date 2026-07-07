Return-Path: <linux-doc+bounces-95351-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4fDJGfDaTGroqwEAu9opvQ
	(envelope-from <linux-doc+bounces-95351-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:54:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A371AACC
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:54:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=u0QPMqTI;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=wf+DLOqv;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95351-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95351-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D30263012CCE
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 10:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A0E3ED138;
	Tue,  7 Jul 2026 10:34:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B13ECBEB;
	Tue,  7 Jul 2026 10:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420496; cv=none; b=SLKUjIsI7Bcgt299vf3EfzWuDQBOfLRvcoZomorWJF1eTn0XPD3dbsi3kDjfFfuf5+fi3CbIstphrgzytrYUNKMghoEuA6xoTJA1omFrxjkqi75vjcazZNgzAxyK3ZgkKtCrXZqEJjhgJeXM/5frWOVU9FICBkCPScdZ1lh9IDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420496; c=relaxed/simple;
	bh=r9jfDIF3Bnh4rzkGkAQSY6dOGr2QTgKJ9iYzA2jv1+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPqnz4oNgaYn/22SlnL1KM/21hc9b7D90pGtfP+8HMTJzWDy8pnWk0nPdY8SIyBHPT+jP3z6Y04EVQjCTXQej3DOrKGYAY4OIm++vb0qZjYDiqsgzRgVpr8DYV8A2lYGVhpPqCmYZMR5PMW5MkftKrMSoXBlQr4PKjCUWJXhdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u0QPMqTI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wf+DLOqv; arc=none smtp.client-ip=193.142.43.55
Date: Tue, 7 Jul 2026 12:34:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783420492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUepwqSpsd3X623j785SSmasvMme6Isgo0g/WBHQGdk=;
	b=u0QPMqTIoolQHK+MWeg6Hrk1qDbvuyTiSAJV5QqXb9fIFpAwLV+/A6i3RY7y2Q5NOrNHPg
	WMCb4I48soFQQDP1uC+yYLwIE+q6bfqzEyUxvroJmO5zf5EQeuqY44UmPCqz0ktwJ5x8zb
	K/jR54x6T1+TkAKDPcpynJf63/x56iUcMSPQlxX+uoylxzMakYIx18Tel0PWacmjiFszd3
	bhaBj9f8SzF+PJycqTSCOsBYjfMxnJyZNkFusGcF5w9YjUvYsdt4XhmcejQFSoeHf6r9nC
	7kPpVdM9Rd1PD0EhWzc32TK/9x8m2VkZ1NTD+A6BTAL2llxbwwOtoTJ0lCv50w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783420492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUepwqSpsd3X623j785SSmasvMme6Isgo0g/WBHQGdk=;
	b=wf+DLOqvEShc+UIpmPOFJHVZ1Hw8VyjhbipbDf8rX2KOzDJyaUndpQx2IJ8vRgUgaF+UCS
	kWzffhYNe0UiW6Aw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <20260707122827-2d6c18d3-8e02-4d9a-bb29-2ec46e759645@linutronix.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
 <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95351-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:leon.hwang@linux.dev,m:linux-mm@kvack.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:jannh@google.com,m:pfalcato@suse.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:nathan@kernel.org,m:peterz@infradead.org,m:ojeda@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:aliceryhl@google.com,m:dianders@chromium.org,m:gary@garyguo.net,m:linux.amoon@gmail.com,m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,lwn.net,linuxfoundation.org,linux-foundation.org,infradead.org,kernel.org,google.com,suse.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,chromium.org,garyguo.net,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 640A371AACC

On Fri, Jul 03, 2026 at 11:09:55PM +0800, Leon Hwang wrote:
> On 2026/7/3 17:44, Thomas Weißschuh wrote:
> > On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
> > (...)
> > 
> >>    The following architectures currently support this feature: x86-64, arm64,
> >> -  loongarch and s390.
> >> +  loongarch, riscv, and s390.
> > 
> > For per-architecture feature documentation we also have
> > Documentation/features/. Maybe move it there.
> 
> Better to replace with a reference to the feature doc?
> 
> +  Refer to :doc:`features/core/mseal_sys_mappings/arch-support` for the
> +  support status of each architecture.

It should automatically show up here:
https://www.kernel.org/doc/html/latest/admin-guide/features.html

See also Documentation/sphinx/kernel_feat.py

So I don't think an explicit link is necessary.
But the maintainers might disagree.
In my opinion the link should then go to the rendered table entry.


Thomas

