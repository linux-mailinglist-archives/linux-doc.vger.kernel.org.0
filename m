Return-Path: <linux-doc+bounces-77263-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAeyMtrLoGmlmgQAu9opvQ
	(envelope-from <linux-doc+bounces-77263-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 23:40:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640A1B078F
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 23:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A193F302E933
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 22:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81CB3A0E8C;
	Thu, 26 Feb 2026 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IKFv1Lw9"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1183921FF
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145623; cv=none; b=WJ+8wgT7lrROMVGfzbY51YctNyEw1rd0h+xoJALb4R2NipERtNM2WoT7n5EftS6W5hlcQUo+PO7xU4LBR0GxbuXl/pUhJ0eyWOI4FF83qOFhZ6O11up8y3difWLhhhFWMQZrcgO+w3zTH7GPquPRuOD/RUYAku1emDzVzv/tnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145623; c=relaxed/simple;
	bh=Ld+BTpHIXCMjhMvwaNRy4x3ey9fZ6cA0I1NRJtSSXWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=crkZhFr5LNlWATXHckzhDuG7wadZ+uOWfihcNFFnwz5UX3R9E3S0RWV93zrZ1tldfAu7zxZ180SipQrfWnmyhG5NJoEPhAk5B5EWzuf/W96mvDQdYriq1P8TmT6v43Sfc+FSv4+fJfPYFFYVMid4+Ya++rya70M+ONJsTFl6nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IKFv1Lw9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D7B4440C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772145622; bh=4wyaZXTM015ZUksuS8viNMy22alUz67T63h8jkp1I6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IKFv1Lw9yz4ybDlHWK0hRPmKvOqBUh0zHvRevUIwB0Htrmle9/22agk+DyDmWOPJh
	 FgrpyuAE0dNLAzirQ6/QYzNcnU3BUQ8JMa7BEs+M6Hauzj63L4JWRRFN9CvWR+CrgP
	 eCUETidkLfOKA97KE0SaXZBBBfZhwaETkNABa4H3r043L/mfOKqeOLCIs+q+OdQLm4
	 wtXqgB59aCY5FRl6fRV48M97zBsJjRez0FL5F+CWEY1HDOeONst6h1i3RDgBONW8IQ
	 brmoeA6hZg7Z/fgngGNvY6RuDlPJlgZRGJod6bqRCCh7Eau8PeUvMwCWLWyRNW28oP
	 t7TGf/GvR35hw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D7B4440C9C;
	Thu, 26 Feb 2026 22:40:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH docs-next] docs: pt_BR: Add translation for
 maintainer-handbooks
In-Reply-To: <CAMAsx6e0HUCw98bTqt9xJ+CaOC+rSA1h54T0WasR_mvKfaS7Mw@mail.gmail.com>
References: <20260226212716.260546-1-danielmaraboo@gmail.com>
 <87o6lb5fbo.fsf@trenco.lwn.net>
 <CAMAsx6e0HUCw98bTqt9xJ+CaOC+rSA1h54T0WasR_mvKfaS7Mw@mail.gmail.com>
Date: Thu, 26 Feb 2026 15:40:20 -0700
Message-ID: <87jyvz5dt7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77263-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: 3640A1B078F
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I kept the label
>
> .. _pt_maintainer_handbooks_main:
>
> to follow the pattern of all the other documents I'm translating, only
> changing the initial to
>
> _pt_
>
> .
>
> Would you prefer that I remove this label, or should I keep it for consistency?

Just remove it, please; I'm going to do the same with the English
version.  In general, labels should not be added when nothing uses them,
and the top-of-file habit in particular is something I'd like to
discourage.

Thanks,

jon

