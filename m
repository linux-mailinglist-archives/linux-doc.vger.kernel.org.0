Return-Path: <linux-doc+bounces-90703-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3oGcFaEBIGqStwAAu9opvQ
	(envelope-from <linux-doc+bounces-90703-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:27:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF763693B
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:27:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=2Kpwc9lx;
	dkim=pass header.d=linutronix.de header.s=2020e header.b="ht05hPE/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90703-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90703-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BB2315FC16
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEAD3D5C0E;
	Wed,  3 Jun 2026 10:20:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A03AD514;
	Wed,  3 Jun 2026 10:20:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482028; cv=none; b=QH3xaG8FZqDJ1Y+l3ReHDT5grXV0HXy3MioNRUJHkWRNQGDyzf8pphVvp5yL36IMA1C5A+223bpTaqVAeoRNTVcF4imhpY54BRYa5lT0wCAyZ7W64raarkkr18T/JpB8YopKFs5gZV9lcWvB63OwxK1VOWwx1noDeTI5Jz3xom4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482028; c=relaxed/simple;
	bh=QeViSA+jcgclwNWpv/VaM6OLK1ZiV3N7rKhMuiNuFt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7AluaJ9NYRxfu2HuHEcNTbR6kTFbWDXcaFBdIJTLgV+/DHgo3aKEPQs7x/bmHOOybJMgpIgbTgdwqS6hqF4GugNb/V+hcxR3VcvpJKMx6e/2o3OtAHE3xZtH3Et4yxpsRSQ2WTbJ3ocT/Cza/A7i/hSWXt1lLjYYpEzdC9XaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Kpwc9lx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ht05hPE/; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 3 Jun 2026 12:20:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780482022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SERTPvwwtElEqMvhTi6cpxoekSnm9GBaMtAJHQpKnow=;
	b=2Kpwc9lxOjPFGH0MVEls5p0wzDVUzXhD5ZcH5BOmudg5ZzmJBenO83CaApa31GeCXiuE1V
	cHbE2Sd3iNMMo5PsL0ahDBa09bn7ZzBQbVjqisGWn7ZxZvdI5izt1A+HF1XWbbSyZfbplg
	M12ao6FLSaFSGjjAzUw4dsJFnND7bFdz1XPz+0AkG+rycluMbxXAGsXXOUJpztpCGohSuj
	3S2voHD7H3JvAdZZjXvgeKcRDR5ib5RibDo5t/SIGTjECq9SMN1i5fN1khTNZdNBsTtx1t
	+xobRKYnKE4duxX6FOq1JWH4bNa1o/bFElk6WWH3bQ4suyhGbxgXIFcMA9tUJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780482022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SERTPvwwtElEqMvhTi6cpxoekSnm9GBaMtAJHQpKnow=;
	b=ht05hPE/eLJZJMR7EITeDFCRFZOTxk6zkrUS2AlOd7nYShwO7J6M6pDSfVIuDvO6bsEWvw
	+V6B/CHjjXmIxZDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: index.rst: add entry of other
 sub-directory
Message-ID: <20260603102020.ZsS16TaP@linutronix.de>
References: <20260603080430.344391-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603080430.344391-2-manuelebner@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90703-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:from_mime,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FCF763693B

On 2026-06-03 10:04:31 [+0200], Manuel Ebner wrote:
> add reference to scheduler/sched-rt-group.rst
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/core-api/real-time/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/core-api/real-time/index.rst b/Documentation/core-api/real-time/index.rst
> index f08d2395a22c..661b419e7f8f 100644
> --- a/Documentation/core-api/real-time/index.rst
> +++ b/Documentation/core-api/real-time/index.rst
> @@ -15,3 +15,4 @@ the required changes compared to a non-PREEMPT_RT configuration.
>     differences
>     hardware
>     architecture-porting
> +   Real-Time group scheduling <../../scheduler/sched-rt-group>

Have you been using this and are referencing this because it is useful
or did you just happen to find it?
People have been complaining about this and I *think* it fails to work
in multi-CPU scenarios (it might work if the task is restricted to
single CPU usage). Not entirely certain. But complains, that I am
certain of.
There is replacement underway to utilize SCHED_DL for this as in
"Hierarchical Constant Bandwidth Server (HCBS)"
	https://lore.kernel.org/all/20260430213835.62217-1-yurand2000@gmail.com/

Sebastian

