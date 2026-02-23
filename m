Return-Path: <linux-doc+bounces-76643-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mf6G2bGnGnJKAQAu9opvQ
	(envelope-from <linux-doc+bounces-76643-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:28:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9F17D949
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F01F93013C89
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 21:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05BA33C52A;
	Mon, 23 Feb 2026 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eZjCcRce"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383D36BCD6
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882081; cv=none; b=qqOkPGP/n3FhSXaJJi6o1K3To0HOVSIsxbwmRHZagoNFKw29vsH0d48sGofri4maItG9OdqXelUtM7CLufvJe9ufMd31CFE58bKwRT1cTwJ3xVRJPbm5Zq4jkiCm7bIOvxH7iFNH3HsL9g80XpLeFN9HR00lVZPuqcv7QtiyeXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882081; c=relaxed/simple;
	bh=pEcbpemlzyrcXVDHNDxFz6DAL1qPNZggXAXRxYNW6O8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YoLyeZp1Z5uMQY8ohwbmjUSDGTj0QworKTWT9s554YG8DhuVIYySDONSZxYk7LEOKXp20TDUbL8uKJVNA+fB8oIiAb11kgeWuKa0x2IX4TzaeXYEk8ffHxQEU/CBYxVFAJ23xlomYjG/DAWXTQkaduvxL3822bx2P4EzV9+U898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eZjCcRce; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C4E8E40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771882080; bh=bgfwjqft95CCXN7HXkATYWH+RyEA+LJuZ/cQ3zaTlVA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eZjCcRceR8g1q2b/i9Md5IrerBzvQbGARTcWdqG1H2AW29XyiGulMY1Iy5T9kbhfT
	 +R1PKr6YMjm1752g1gQCf5FrRLULc3KBMisBAESVmr+cbyl5/LBTMZpndp/lqQycHI
	 IcfXLVvuWTltnc0r/cZpJM9RjmfN5Dv7NpNlEVpe0NztTJwfVZ3WpMoY0+IpvGkBtU
	 i0Mi3b2Ycm8KoNkkRCFaOamrHH/5y0B1tVa8vDwvDJKNC1nQstGRxEyiOOU8d+eqyx
	 ggTOQpL1YObLbDkmhWsp/X+xKYhKydpFH4/fFZbSMGUN78Eudp3YVgli8xDaO0CxA7
	 CntqvK8lPhW4A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C4E8E40423;
	Mon, 23 Feb 2026 21:27:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: translate process/changes.rst
In-Reply-To: <20260209184343.15191-1-danielmaraboo@gmail.com>
References: <20260209184343.15191-1-danielmaraboo@gmail.com>
Date: Mon, 23 Feb 2026 14:27:58 -0700
Message-ID: <87zf4z40bl.fsf@trenco.lwn.net>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76643-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91C9F17D949
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the Documentation/process/changes.rst file into Portuguese.
> This document provides the list of minimum software requirements
> necessary to compile and run the Linux kernel.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

OK, this one needs a couple of fixes before I can apply it.  One is that
the lines are way long.  Remember that we want the plain-text
documentation to be readable, so please keep to the 80-column limit
there.

The other one is here:

> +Por favor, consulte :ref:`sphinx_install` em :ref:`Documentation/doc-guide/sphinx.rst` <sphinxdoc> para detalhes
> +sobre os requisitos do Sphinx.

That creates a build warning:

> Documentation/translations/pt_BR/process/changes.rst:366: WARNING: undefined label: 'documentation/doc-guide/sphinx.rst' [ref.ref]

Don't use :ref: here, just say "Documentation/doc-guide/sphinx.rst' and
the right thing will happen.

Yes, it looks like the original is wrong here too; I'll take care of
that.

Thanks,

jon

