Return-Path: <linux-doc+bounces-91799-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hvuYIkgBKWrnOgMAu9opvQ
	(envelope-from <linux-doc+bounces-91799-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 08:16:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58266623D
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 08:16:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=oBbldOFh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91799-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91799-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0491C316AF14
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 06:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB08370AFB;
	Wed, 10 Jun 2026 06:11:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E842DEA74;
	Wed, 10 Jun 2026 06:11:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071865; cv=none; b=kpqYN5Wfsh9nqn3Zx8qS6G46Rx3PslXfXp1eutc/2O1TDduFAsnEkzPAEkmuS4P1qXdeItQVVcNgN1WE8gJH8cmq/O+8hoDkNH4LhDqsNqWQBzOyIellPpFcBD4ejcUfmyZJa9Af9u5wwtiiZsEB70AambuG2SyeSFSSoToRqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071865; c=relaxed/simple;
	bh=XjQs8t3Uy5W8sj+cp5Uo44445Q+nb1DDRE7s65qYH4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6PNRbVFBhxRmNADi2ZE+Kx+Mmu1JNertpGRVdni1Hvx7SS+oiTmj3Yn9g3qJvL3sAl9Lev8ZMWtKaU9ef1pwC+sN3Y9IJF16DukYA28nh+z2+gLemnLFIKBxp3XootN8lmjaL/HHRACDH7vOFqJpExdBfRZtQMwzCKrraxG4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oBbldOFh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA4C1F00893;
	Wed, 10 Jun 2026 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781071864;
	bh=aYB75DAPml4GJY6HEdNZEK5p4VaXgRYbMYU4m0rmk6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oBbldOFh99oHye83hP0HamJdRvl1cgA5fJE8CR7lZk82ktoka018NTWk9O7dlJ2Kg
	 EKrxSB6h8ACJFVxC6k7DKoEk1TntxPeQZtVJX15hlZaF2O2lOwpbdAdm0xknM3vk4V
	 BMghi2had5BTSPAFo2LyhV45XaPvgZmWbOHnN8rQ=
Date: Wed, 10 Jun 2026 08:10:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: w@1wt.eu, corbet@lwn.net, leon@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, security@kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026061046-wrangle-canary-bf00@gregkh>
References: <20260509094755.2838-3-w@1wt.eu>
 <20260609083305.2382925-1-safinaskar@gmail.com>
 <2026060955-zesty-cucumber-1a49@gregkh>
 <CAPnZJGAKHu4rR8+W67KRQYVwRqi3x2Y+iWwhG7a2bY7oEawhfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnZJGAKHu4rR8+W67KRQYVwRqi3x2Y+iWwhG7a2bY7oEawhfg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:safinaskar@gmail.com,m:w@1wt.eu,m:corbet@lwn.net,m:leon@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:security@kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-91799-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,linuxfoundation.org:from_mime,gregkh:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE58266623D

On Wed, Jun 10, 2026 at 04:03:43AM +0300, Askar Safin wrote:
> Thank you for answer!
> 
> On Tue, Jun 9, 2026 at 11:44 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > - If unprivileged user prevents privileged user from suspending
> > > system, is this security bug?
> >
> > Physical access of suspending a machine feels like an odd threat model
> > to be worried about :)
> 
> I think you didn't understand me here. I meant the following situation:
> unprivileged user without physical access was somehow able
> to prevent privileged user with physical access from suspending
> or hibernating the system.

If you can find a bug like this, sure, we'll be glad to review the fix
for it.  As for it being a "security" issue, that will depend on the
specific case as "can not suspend" doesn't seem to fix the definition of
"vulnerability" to me.

thanks,

greg k-h

