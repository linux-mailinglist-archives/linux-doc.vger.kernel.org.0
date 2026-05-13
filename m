Return-Path: <linux-doc+bounces-87350-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B2qD315BGoPKgIAu9opvQ
	(envelope-from <linux-doc+bounces-87350-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 15:15:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90A533D3C
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 15:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB0A032E1697
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 12:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6F2466B5E;
	Wed, 13 May 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="V9z1C3Hs"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305D425CEC;
	Wed, 13 May 2026 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676793; cv=none; b=Hgmgbe03UuO30l30ta9pDsapoyM4X2ERNJnPlxC00b76q2maFq+BqOWTx7WInCcF6JPAXE89gU2B/MhWvgH3RKsDqhD6OKc0PcUEyoNguXloPeCn9I1lCyNgPu0Crh0SLG6IU8YQVH5Ibzeh8YMq2nPmqQ42kFceXY8SflC+n10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676793; c=relaxed/simple;
	bh=ufIn9sWSmL0BMlnKCGiSKZq6HkqpQ8debrmk5Krr4f4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wg3L1CTAbCcZaagLSOM+h+A+cRVxjfE6cQDGHVk9KXKRyEvhdofgvZME0MUQAMOeI/Nda6Va1AkJMrlkwIBmpTYUM2KPrYmosixlZvDPeCgfvmG2RT1wEcrdqyqq4Kax3JeyA+/hGuMqtFAzsmHKlTtpkbx/cP4RAYF290GI4H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=V9z1C3Hs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 220D240C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778676792; bh=bCzIyRAmcQvCz58AmB6sxaj5LdsrGBCGI5bmL3zzMjs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V9z1C3Hs8L4j/bRE8ualsRAngo8/7m88oaCNz1VGBcr20KS94T8Holmq9ty+NQcn6
	 PjJMsrU/SCTD61NJKWKiffnLY1NqmQfp3kLs7at29oOhKYO7HhIvj488JBgDNOjxJg
	 gi5I9VKo70Z6oCchMUYLv2ubGlG8NMHAihwCNfcg+CQc5VoL+0lwU7y1/w6NkGalnk
	 ra7TrqHq2wacbuKtkOjxZfLswXfUKex2TBruRGgyLpbdHxrDBsAOgX0GQ0lRAwqvQu
	 STVW80sctVWKMmzPIZq1tcqnKBjUQIuCsufAaVaY0gNPZ42KE7xnBmiN5v58b1LfR2
	 nXF1XqEQ0F9Bw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 220D240C7C;
	Wed, 13 May 2026 12:53:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
In-Reply-To: <agRfXQvN7ZDTNGQG@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu> <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh> <agRfXQvN7ZDTNGQG@1wt.eu>
Date: Wed, 13 May 2026 06:53:11 -0600
Message-ID: <87a4u3mpxk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: AD90A533D3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87350-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1wt.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Willy Tarreau <w@1wt.eu> writes:

> On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
>> > One nit:
>> > 
>> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
>> > > +    the kernel's threat model and go to great lengths inventing theoretical
>> > > +    consequences.
>> > 
>> > If only we had a shiny new document describing that threat model that we
>> > could reference here... :)
>> 
>> Ah yes, a link to that would make things better, but don't we have that
>> elsewhere in this series?
>
> It's in the same patch, I think Jon was sarcastic here. I thought I had
> addressed that one but apparently I was wrong :-/

I'm just saying that this particular text should link to that document,
don't make readers go searching for it.  I can certainly add a patch
doing that if you like.

Thanks,

jon

