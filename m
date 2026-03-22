Return-Path: <linux-doc+bounces-80576-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lXGpBGtVwGlSGgQAu9opvQ
	(envelope-from <linux-doc+bounces-80576-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:47:39 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E402EAC2D
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3E82300AB2D
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B32BA45;
	Sun, 22 Mar 2026 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LIv5VvNx"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9A79CD
	for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212455; cv=none; b=Bhll55Tmvwr1T8LSjhENEjAr5AsKZkzBNhKrGVGGi6DCJVquqOQ2vHtMQ1YZ4CQZEKNqFZNEuXFN2ur1xl0STzu3Ofdbv7DukzeWzbobhJTAhbAAoN9y+y3tAzf+3m1KNeY1mh8MYsuT5cZMnXGKvTw5nyxdf2LlFX1VYl9WcSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212455; c=relaxed/simple;
	bh=E7P+d49hDB0FEXOt7Cn3UYR2bLrG+otFVJR4ZfLAPDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XnBIWrhMfTPCEtKCdK6+4JmAyLmAgLNPKDj4vDmsSBLC1kORagT7Iakq5kKIsWidf9tEVLxp4R9S0KiA5U0C/WB2LO6tMIoucC0qtHodUaITzdFQ/yT1241hpG26hIQxD3OeOStgwuDP0VOoSGJEHF1l+Mf5yLHDrIxLOS1+iwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LIv5VvNx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2DE78411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212454; bh=E7P+d49hDB0FEXOt7Cn3UYR2bLrG+otFVJR4ZfLAPDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LIv5VvNxKX8SVdmdnuEfOlIKuZnW1UNbVErRUclLmhM/6frcBLeWpEJBQqV2dEJoh
	 +UVAQXRu/Jz1BiPyvCeMYL0g2kxYKKd4j21nHOUJ0TS1YdG4qtaC0c7khNFha3WN05
	 QcIAqFA2sfYBb2pMPp7waR6S3/+Qeo1OZ+hXu1lvD+t7uU79LROdKhBCVJdi1j1q04
	 IVZRdxkDLKZq4uIO6ZP+QnnCnRGLqwwye2fhFACTFErEle8yNXWVD24a358urPuN+2
	 bppdPwzL/nOZmPWPuIRzyWrC3lV7NyyLGkilx1zSFP9edixiAf1trElVbv8lBmslCc
	 bYYEpCUwdO9IA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2DE78411E2;
	Sun, 22 Mar 2026 20:47:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Daniel Castro <arantescastro@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: pt_BR: translate process/1.Intro.rst
In-Reply-To: <CAMAsx6eaXHDquZqCjp7P0e7hwK7UHi0mr=QTusCxPixzBPGFdQ@mail.gmail.com>
References: <20260316212435.19303-1-arantescastro@gmail.com>
 <20260317140136.29256-1-arantescastro@gmail.com>
 <CAMAsx6c_oq5-cuf-N-+RTo-Hym-K+PF-=BOBZySWMN4E7O1s4A@mail.gmail.com>
 <875x6ubdci.fsf@trenco.lwn.net>
 <CAMAsx6eaXHDquZqCjp7P0e7hwK7UHi0mr=QTusCxPixzBPGFdQ@mail.gmail.com>
Date: Sun, 22 Mar 2026 14:47:33 -0600
Message-ID: <87qzpbd21m.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80576-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 56E402EAC2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Hello Jon,
>
> Initially, no, there are no further blocking issues for application.
>
> The purpose of my comments was solely related to the initial
> organization of the collaboration and ensuring adherence to community
> submission practices.
>
> As for the content itself, the Portuguese documentation is
> grammatically perfect.

The normal way of saying that is Reviewed-by or Acked-by :)

I've applied the patch, thanks.

jon

