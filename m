Return-Path: <linux-doc+bounces-75521-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI/gD+sRhmk1JgQAu9opvQ
	(envelope-from <linux-doc+bounces-75521-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 17:08:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB610009B
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 17:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C528304B229
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 16:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAE02DC32A;
	Fri,  6 Feb 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o8IHcpcK"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644A248886;
	Fri,  6 Feb 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393892; cv=none; b=N9ETmBk9HD+ONoiaVjwbRKthgBKJIVSeRTmdCBlNZS2vMbEYyd1w7jsrI0vY+LmApPQGCKUHQkOEEPCPS3p1d7pClmThShlMf8bIr+eQ1NuyGM7t8PjC5VnS1aK1yj2K69XWN6zq3OCI/iew+n/56lZurdXhV8z9rSlpBwD4D14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393892; c=relaxed/simple;
	bh=rMt+oEPOBNs647Je+2cn/FE8wCyAu05qf9k9pjw2eIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e55jtF489BrALJTyA3skx+sXlV6HTKbXl6QVRx+c8BV30tTsyCerFPrUw6BUJCXqZcuXo3IFRykSOFpbEb/KmWZqf+jeQMWRK9CmAkInl4YJSL6cqIzwPV3G3/ty+/HaRW4pN6DBo5Y8ZbIf0TtXAIfa1hfJdafldMbYQd2Gaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o8IHcpcK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D70E240B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770393885; bh=rMt+oEPOBNs647Je+2cn/FE8wCyAu05qf9k9pjw2eIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o8IHcpcK0cGPosLoij0qn6dL6no4aSo6UVsBH1MwNtyrMVLgiWtX0Hg1ScFzvt7Wr
	 +W0PMhncklXFRPv1gN1f63A3rx4CmzoW1uxTNPlQlr8LM4gKPCNfrJPxiYp8ynuUYg
	 l+zY++5xUOpZtAJpYrYBoCwnpFXagQsegSWesgCcI3qOrxFK7ejsL+v291Y3w+/0z7
	 VDJtgzjSh3mgBZpI9dJfcgOvgz9HK+ni5EZU/KdAipxNaeR2CxeXKnPBgV6Xo5OkeY
	 ZocjinXr//COBrG9qI6r7MrjHnJdPnxvR92oGbp2NA16PzPpy98rqaCfxYZ1MbPalO
	 MlLSHD2hNKyrA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D70E240B4E;
	Fri,  6 Feb 2026 16:04:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>, Amitabh Srivastava
 <amitabh@amidevlab.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
In-Reply-To: <95e18b9f-1426-44cd-a5f1-fca5bd122450@app.fastmail.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <95e18b9f-1426-44cd-a5f1-fca5bd122450@app.fastmail.com>
Date: Fri, 06 Feb 2026 09:04:43 -0700
Message-ID: <87fr7deu3o.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75521-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: A5DB610009B
X-Rspamd-Action: no action

"Konstantin Ryabitsev" <mricon@kernel.org> writes:

> On Thu, Feb 5, 2026, at 06:55, Amitabh Srivastava wrote:
>> Update http link to the documentation about how to add a kernel.org UID to
>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>> checkpatch warning.
>
> No objections from me, but please check with other reviewers if they want another revision.
>
> Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

I think we've probably done enough rounds on this one :)

Thanks,

jon

