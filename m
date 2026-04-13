Return-Path: <linux-doc+bounces-83269-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBsHAQQ/3WkubQkAu9opvQ
	(envelope-from <linux-doc+bounces-83269-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 21:07:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 636913F2741
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 21:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6B88303A0B3
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 19:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7866938E5DF;
	Mon, 13 Apr 2026 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Nenmv7dP"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6CA35BDDC;
	Mon, 13 Apr 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107011; cv=none; b=hDTuCOV157vx+H3oIZzp6YKc/bUYLfKp4RI2qwVn9WQF5K96rtsqKqi+jwUv+EMsPMd8qJYTaVczIyAfFqarLFgGE01Phgn8J4ah8y6xL13bOdZzzVgK12V06r85U8wcnoxH15JeqKBnBV3VrqmfcHRxwShKK8E1DhO9qYfF08Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107011; c=relaxed/simple;
	bh=PYUq7g8rdm958akGZ3XUgNx9skG3NIVGchkQTTk33os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=szYGiTfIy5AyYevbytbgjfGIydCmv17pujw9v4r0JWnVYO1/jTYi9tOohYIfJlikAYO0XIIDZvqmrVM4Vk5l0m9Z2cVQORgiPOaOQmGuXXJWEZwZv174c5PV32hmV3keRLBy9XFJrYSp4zl1ntXBljZUg7q9cGkcrZElKKEJXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Nenmv7dP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 55D8E41084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776107009; bh=uIjiAYkHIVqj3YY4+31pUtOWCeJOQ6EWGMupRVVLLlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nenmv7dPFdS/TSHR7vWui6V+Y8gc5A4ReaJx99zedEn9M4LgT8bdXMQLSYpE4gU3B
	 GK0yz3vKvgEVtl+7n6+27FIvOoFGA7Vp4WpzXeoPM0fE+BIOrcnTb38WlH+OpfZ9m/
	 nPvMNBk4t0YmTq5WccTncJSo6FtxVolTUt94qVRTrjxELeXZwf5x/MetC8T9V5ngha
	 WwxyxEKTcKzjhflq9/8OvEdYv5qA460ionijyHxapBMeRoL079SdfJn8JAUL42H+fo
	 CvyMGN8jTIC3l232hACycvBiI+TdxYDJGjIkeCN/dtF43YpG4Q1AOP66dSo15TUMRj
	 nJazYzj911/MQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 55D8E41084;
	Mon, 13 Apr 2026 19:03:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Cc: Linux Kernel Workflows <workflows@vger.kernel.org>
Subject: Re: maintainer profiles
In-Reply-To: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
Date: Mon, 13 Apr 2026 13:03:28 -0600
Message-ID: <87wlyawum7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83269-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 636913F2741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> Is there supposed to be a difference (or distinction) in the contents of
>
> Documentation/process/maintainer-handbooks.rst
> and
> Documentation/maintainer/maintainer-entry-profile.rst
> ?
>
> Can they be combined into one location?

Late to the party, sorry ... the original idea, I believe, was that
maintainer-handbooks.rst would be for developers looking for a guidebook
for a specific subsystem, while maintainer-entry-profile.rst was about
how maintainers themselves should write their subsystem guide.
Doubtless things have drifted since then...  But the intended audiences
were different, so it might be good to think about bringing them back
into focus.

jon

