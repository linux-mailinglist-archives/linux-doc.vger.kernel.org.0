Return-Path: <linux-doc+bounces-84707-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHYXNWw072kw+AAAu9opvQ
	(envelope-from <linux-doc+bounces-84707-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:03:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05F470695
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EBA13007884
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 10:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA003AE706;
	Mon, 27 Apr 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XjiFec+S"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0B39A058;
	Mon, 27 Apr 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284200; cv=none; b=Jx/C00ASb/3rJxH0eH4G3JYJrkNVaIv/zizk+vxHl4GkN/tqvgVOXSFU24NOFp5dCt+mOsvMVS7fYCQ2J/+UeWWD3hLIY/XQklfrI86R9VGPxFoZs2mBH+/D1phLigKKFJ5nQJbI1nTwu2zLN/BJA0JLtk7OWPU0YrzNH/Ye1xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284200; c=relaxed/simple;
	bh=XyNYRoYdwgKbFVrPXjvyBroC5GmpKh3iMSvPNId0JNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UO4InfUMoPiycGfkpj7lUJmuRETeRiF1ejdXcJ0futMYCGVF5Tbd2SNQe5MAjIDxzyTYQZha5NNAYqrG4X4I81gsEoJMpl18qjCv3UpykiuYyl6ybV1PurR7NgADDEmVCvNtlf3uuFj2QHeJYfe5BDS5X569r8vRcmVZpB21tJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XjiFec+S; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 76C9241098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777284199; bh=DEsgJQZ/FcIxBV5HynNEKW8D+865vS9BlRDMv2OrAZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XjiFec+SFeHMtnM0vOe4Gxbx5aS9aXGXB97wbwBvAr9dWRpDZu7FzA6IcTqIBlLv0
	 7nncPkkjms2Tx8YiGHyGxeRxbp9FtZtfyH87c04EkCfBvobKLQ1hkqN6SXo2Z53tf4
	 GDsVQrthe4nciG2jFkrk0NT8SZqmdrQHH1XuyqsPZfPy4CYkiSfKfYbDonZzegYf2Y
	 /GvE1AdmOEPIVX8H3jMcfWX3StEZ8zY5dtmfVRT+TgKoBhVOH2Ox7K4hXuG2g6i+E6
	 WitzJJWruE/7EfGg/H/d6uf18hoC3udMQECaH+P41iMbGdQsbh415Epd7jfwOcOLSM
	 A8iWZtTR+Mt5g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 76C9241098;
	Mon, 27 Apr 2026 10:03:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Myro <mirademche@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Myro <myro@myromyro.com>
Subject: Re: [PATCH] docs: proc: fix minor grammar and formatting issues
In-Reply-To: <20260415175230.46721-1-myro@myromyro.com>
References: <20260415175230.46721-1-myro@myromyro.com>
Date: Mon, 27 Apr 2026 04:03:15 -0600
Message-ID: <87fr4gpvoc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4C05F470695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84707-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid]

Myro <mirademche@gmail.com> writes:

> Fix missing "from" in "prevent <pid> --from-- being reused" and
> add spacing in vm_area_struct range notation for readability.
>
> No functional changes. :)
> ---
>  Documentation/filesystems/proc.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The patch seems OK, but it needs a proper Signed-off-by line.

Thanks,

jon

