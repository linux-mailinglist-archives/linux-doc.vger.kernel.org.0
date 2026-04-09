Return-Path: <linux-doc+bounces-82898-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE4MOpi212lURwgAu9opvQ
	(envelope-from <linux-doc+bounces-82898-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:24:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C33CBF82
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47F9A3035623
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 14:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CF73BD651;
	Thu,  9 Apr 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="c+mc7b2N"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C793DA7F5
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744528; cv=none; b=FvjE5mCEwiytMRbmfV4nj6j44L67RJiUpJ37w4hTA+RQxHft/gi63QuaWVCzek1Nw1CpVu2JRUX/+Z1Y3ITHrWuKhnD9lyEkeKJzW4wrwLGjU0spuyUtoLmSgVcVG4EfvNHbfxb8ecf8gRvAIIEqIlPh1OVSw4bV+8LE46WtWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744528; c=relaxed/simple;
	bh=dbIUownDyL5BzLHFO7ogf9bLDbdEjbldEdGg1KcYEZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bYsAKxdNxS3yng2T0OUW3cZ2YiKXDinRmgm3++8affbmX6PMBLp1ruKXZBPQld2zIarv0adsdjMWyACmBtxk+w+pUlKCZnNM+y8PJ5r3vFrQbinQqcsCZAWbrtw0xhV1cR1ngGxKcBM2K676EwcgQkPm8MaYnrAXhiRSyPc+zd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=c+mc7b2N; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3185E40B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775744526; bh=8wZjS/w5kPNd7o91F+plJzLpSLZMtpUHijcoakhWtyE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c+mc7b2NuvuRO1WL7zWM2MKAnbfWKMuyOg9mj3mBfqyy7FxMpZU+KiwwcmO/a8omg
	 9YJtiwItSs9mUNY0RH0F5TQriFyJgNfRgtY5OxWqrlIFXVuU5A9jOmnZcuXxwfdtR/
	 FRPUZ2eSJxpX+GoP327u8wJVpV+94HrzFwa2Pssv0VuwEaOm7OwuqGnMIBAH6Yz1m+
	 B9zxMLssHC/ILN9iYMU/1iw6hl04c7eGzfvcTwzKXyBYkq9PmD3yFsb6Xoi05sziA1
	 aYqE/LEAfMy5V15r7dPoXGIsAsmlM4vyZIAbfnC2QZ9NQ0RwVnUCAM2+GjhJNMEcuO
	 7o+OJuhXK00FA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3185E40B2D;
	Thu,  9 Apr 2026 14:22:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Cortez <mdjesuscv@gmail.com>, linux-doc@vger.kernel.org
Cc: rdunlap@infradead.org, Manuel Cortez <mdjesuscv@gmail.com>
Subject: Re: [PATCH v2] docs: fix typos and duplicated words across
 documentation
In-Reply-To: <20260406030323.1196-1-mdjesuscv@gmail.com>
References: <20260405030359.7392-1-mdjesuscv@gmail.com>
 <20260406030323.1196-1-mdjesuscv@gmail.com>
Date: Thu, 09 Apr 2026 08:22:05 -0600
Message-ID: <87bjfsciya.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82898-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: B15C33CBF82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Cortez <mdjesuscv@gmail.com> writes:

> Fix the following typos and duplicated words:
>
> - admin-guide/pm/intel-speed-select.rst: "weather" -> "whether"
> - core-api/real-time/differences.rst: "the the" -> "the"
> - admin-guide/bcache.rst: "to to" -> "to"
>
> Signed-off-by: Manuel Cortez <mdjesuscv@gmail.com>
> ---
> Changes in v2:
> - Dropped the networking/switchdev.rst change as "is in in" is correct
>   per Randy Dunlap's review.
>
>  Documentation/admin-guide/bcache.rst                | 2 +-
>  Documentation/admin-guide/pm/intel-speed-select.rst | 2 +-
>  Documentation/core-api/real-time/differences.rst    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon

