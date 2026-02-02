Return-Path: <linux-doc+bounces-74908-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIBnG5DegGleCAMAu9opvQ
	(envelope-from <linux-doc+bounces-74908-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 18:27:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A726DCF978
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 18:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147483014C05
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 17:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB5E3859F3;
	Mon,  2 Feb 2026 17:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FlosedQe"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC73859C6
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 17:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770053240; cv=none; b=cp2Ck/1iLkMzRR7s+qxZw9FIvnznaD07d2ZDtl7Avd+rCL5bkHkRv9qFJMNKENu/lUu4GnZAzWTKxJEzNAuWaNAMDilEY/4dnTAYZLPzulGJUaL/5Gh/gqFTh2pxhRCuyo4N22vaVJ5FZdl1FqB6PLhz6lueYPi9Lc1jp8vHA2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770053240; c=relaxed/simple;
	bh=3X+n+1vxDxeZjZ+7xDqRA3rVDcMXljC8v0ez6cWEktU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bfl4Duh642baQEeqPwFECM8EiaiPffD8pH3Oqc6vsy1otc2DoEln2wU+/hiGn5QvBDSVELcZgW89hB81j6rlPeIUNgn1kaisv14mj4Qmail381OIJmXfIocjtt6KiD/gGA2UyXZfSFyW17x1mTkyjOeLlWBVHqtDIMOjf4a1D4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FlosedQe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 94FB740422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770053238; bh=3X+n+1vxDxeZjZ+7xDqRA3rVDcMXljC8v0ez6cWEktU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FlosedQelW1ebjiS/lASXBi4OPyNzHr6wAxX6nTru7KXR4lPgvruUUxWKtEafSmzd
	 NUGK6PMX3V5sM6UU+Q+QwIOP/HwbBnwcoHRuX71N1IKaxXFsYauh6Du59s6S3jzc9h
	 5AAs87zqkIqnRoqYXJ37fMMseqyRSQSbxqIF1xYDwzHVkHhyoKYGP0TDaCbZPMTmaX
	 PB3sohiOmLjIOCYkj6H93e8xenrMmHS8ZFz1uHZ7iusSXJeyYWz52Ms6X2kYgaDoqe
	 mh7hc2EFhVsljbir6TD5suWgXZsmqNJOV3RnlpyHnX5zx2K071FJbnUic6VK5gf6AQ
	 DDVeu/d6uREYQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 94FB740422;
	Mon,  2 Feb 2026 17:27:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [QUERY] Guidelines for starting pt_BR documentation translations
In-Reply-To: <CAMAsx6ehJD2b+2TFgqJ4VjE2=hfi4uW5j41A-MXg5YuBrbZ1AQ@mail.gmail.com>
References: <CAMAsx6dzNMHYA630UWtD5EJX5QqyT9BqJX03c5QzHN9EizjQtQ@mail.gmail.com>
 <87a4xrta7s.fsf@trenco.lwn.net>
 <CAMAsx6ehJD2b+2TFgqJ4VjE2=hfi4uW5j41A-MXg5YuBrbZ1AQ@mail.gmail.com>
Date: Mon, 02 Feb 2026 10:27:17 -0700
Message-ID: <87343jrr7u.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74908-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: A726DCF978
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Hello Jonathan,
>
> Thank you very much for your detailed response and the guidance. It's
> great to know we can move forward!

Next bit of guidance: avoid top-posting on kernel mailing lists; that
will irritate people quickly.

> I'd like to inform you that while I was waiting, I also translated the
> submitting-patches.rst file. I held off on sending it because I was
> waiting for your reply to ensure the initial procedure was correct.
>
> I am also pleased to share that I have a community of about 200
> students (I am a Linux instructor and systems engineer) who are
> willing to collaborate and maintain the pt_BR translation tree. This
> reinforces our commitment to ensuring the documentation remains
> up-to-date.
>
> My current question is regarding your observation about the merge
> window: Since I have already sent the first file (howto.rst), and with
> submitting-patches.rst ready, should I send the patch with the
> submitting-patches.rst translation now, or should I wait until the
> merge window is over, as you mentioned?

It's up to you; if you do send it, I'll end up stashing it aside for the
next few weeks.

Thanks,

jon

