Return-Path: <linux-doc+bounces-82899-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEw+HRG312lURwgAu9opvQ
	(envelope-from <linux-doc+bounces-82899-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:26:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC853CBFFC
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AE21300824C
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 14:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95ECA3CBE99;
	Thu,  9 Apr 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gAzURvvc"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F203A9DA5;
	Thu,  9 Apr 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744680; cv=none; b=NqAUhTWQEZW1TdTeGuwuoWIjyoGAEN3+1oU+qZPnD2n9IleG/F4HpDI/rQrtcM0Z3Ygyl5JI7/4sj366hFQ6+x5dVmlw8QbWQ9IlZffQ2O61txphahSk49FupEICgq2G4d4d3ves8waoIPE03Sa5u+fSH053SFhw4ZSLtwmlFso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744680; c=relaxed/simple;
	bh=oSVaBGQFOwUJHWFcJSPRlvw3axFPX2a7KKThb4g3xfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lZJeYC/lwUGNNWilspyR1EA5qEVCcOTPCNkowxXUX5ccAo2d07ZBvCX2oUR3sMnme9VyB7dVxbLvrE8JS6uegKpJ9iu0vr0g2QClZGW8YhqvSHBgilWzuu05diiV7DRrRUo7pgU7STGPW+54AahX75stVlZZVxGYM41DxSEUOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gAzURvvc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20C5640B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775744675; bh=QeS1aPHYSidRL3WhDx7dePwakay0nQrlXyf8wc4nHb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gAzURvvcLhZqe0DwrkiFXcg6a7zQ5WF3azttw1l9eMbD0w/H6drQrU528JhDXo67W
	 XUeUwbU7Qijp+JGxdFTsImSokbYbImTgcdz6M0zRDX3XJgS+jlDJv+8b0u6rJot/x1
	 DiIxsaWXIjKTWkjQGZp8/utualWKWQV55Aymh0CI+jtwJELSMS33R21jolTZ3Gidso
	 GqEolJENHEvnlBL4quMMFDnwDroyBamAEch//at0RqQ0ZyTEgKtXL/+DIdDBzsZsdG
	 U8YSi3Ggt10VGgpNLt3fXwz8BepHRz9GEzjskua7UYwXmY7kRmPy1JYXqPeX0wztmf
	 prFhGoG/KojTQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 20C5640B2D;
	Thu,  9 Apr 2026 14:24:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Steven Rostedt
 <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] Documentation/rtla: Convert links to RST format
In-Reply-To: <20260405163847.3337981-1-costa.shul@redhat.com>
References: <20260405163847.3337981-1-costa.shul@redhat.com>
Date: Thu, 09 Apr 2026 08:24:34 -0600
Message-ID: <877bqgciu5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-82899-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 1EC853CBFFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Costa Shulyupin <costa.shul@redhat.com> writes:

> Web links in the documentation are not properly displayed.
>
> In the man pages web links look like:
>   Osnoise tracer  documentation:  <  <https://www.kernel.org/doc/html/lat=
=E2=80=90
>   est/trace/osnoise-tracer.html> >
>
> On web pages the URL caption is the URL itself.
>
> Convert tracer documentation links to RST anonymous hyperlink format
> for better rendering. Use newer docs.kernel.org instead of
> www.kernel.org/doc/html/latest for brevity.
>
> After the change, the links in the man pages look like:
>   Osnoise tracer <https://docs.kernel.org/trace/osnoise-tracer.html>
>
> On web pages the captions are the titles of the links.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/tools/rtla/rtla-hwnoise.rst       | 2 +-
>  Documentation/tools/rtla/rtla-osnoise-hist.rst  | 2 +-
>  Documentation/tools/rtla/rtla-osnoise-top.rst   | 2 +-
>  Documentation/tools/rtla/rtla-osnoise.rst       | 2 +-
>  Documentation/tools/rtla/rtla-timerlat-hist.rst | 2 +-
>  Documentation/tools/rtla/rtla-timerlat-top.rst  | 2 +-
>  Documentation/tools/rtla/rtla-timerlat.rst      | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

jon

