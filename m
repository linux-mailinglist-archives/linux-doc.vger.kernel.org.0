Return-Path: <linux-doc+bounces-81254-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMIxF9tRxGljyAQAu9opvQ
	(envelope-from <linux-doc+bounces-81254-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 22:21:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B829432C5D6
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 22:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA97C3035242
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 21:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C147134A3C1;
	Wed, 25 Mar 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CfKYx0Yu"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BA3491DB;
	Wed, 25 Mar 2026 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473289; cv=none; b=P1BrVru9zvCfF+W7/U5TPwzZ3vMjlp37y6NsA6urzyZut8JMI4O2zrvVdk+/jw1CPf7OS5mJpl3d/5SR1koUruVKMOXNQToHz0R3JIpL9/y7uLx4+dZOOw/3j8aFrLYT0RTiDvjxpXFT+AkY4TzmgtjC+4Dh+HsZRs+eb1/pqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473289; c=relaxed/simple;
	bh=yeTzRZfL+dEr6m1S/lDAsZClO2vAqlZlNBvWnyMw/+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xo5widUdA84XMeCYpHC+5e1pTUWeex2W6A6OPyphE1qdxrK2hmFs7zSTnDcxHXnEnSB5hMOmt04zE8kx1uhVH6lB/VDXi5rT4/lloT+jtDaz5a+4KkVlvfb533zcl7pyWXR1TmJsC4EO83JNyxR/CCch1Ypwvi3TysX8AeOGl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CfKYx0Yu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 72A71411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774473286; bh=u1vGk2CYKnV2eJF4XeiSIS1x6jXbf8xmqUdZH6aaZw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CfKYx0YutFswU90qad4RJwdv9SXaSBmNLGN4M+SmyxBx3Hno9VSGF3yG1DxWDPZDU
	 fKr3RGs73IgbE1vCFthNMikpfEzmGecbQ1lhW32UJL7ORW9wm9SO6YyVqujogX5lu/
	 DnQhfCYdUFanTp4JPXFMBSFb5iHvEAHHsxEGP3WQxUKzM45HrO9OIW3EtjYbIUtJHX
	 LVRng2Vg8/Q5GidKwJ/A/HS183v5dsSNFv3BJfZ4vOpDg/MmQFY2gzhcGL5q72pqaM
	 uORSJZbpBvbmR0e3VuZ2T8OfclF36jFEEjwjzsSXtlUTeGIrV81iCDMMk+Mjs7LCOk
	 agqXuva1Zfy3g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 72A71411D3;
	Wed, 25 Mar 2026 21:14:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH v3] docs: contain horizontal overflow in C API descriptions
In-Reply-To: <DHC5RBUT88C0.2OACW6VS3CYF2@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260323153342.33447-1-rito@ritovision.com>
 <87jyuzg2fi.fsf@trenco.lwn.net>
 <DHC5RBUT88C0.2OACW6VS3CYF2@ritovision.com>
Date: Wed, 25 Mar 2026 15:14:45 -0600
Message-ID: <87jyuzehmi.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81254-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,lwn.net:dkim,ritovision.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B829432C5D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Rito Rhymes" <rito@ritovision.com> writes:

> If you could imagine an optimal solution, what would it look like?
> Can you describe the layout and/or behavior?

It should wrap so that the entire prototype is visible, but the way that
happens on small screens is definitely ugly.  The trick would be to have
it wrap the way it would for an overly long line in the source.

jon

