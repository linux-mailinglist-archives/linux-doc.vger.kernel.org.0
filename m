Return-Path: <linux-doc+bounces-93016-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c4TpMNldN2rFMwcAu9opvQ
	(envelope-from <linux-doc+bounces-93016-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 05:43:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1563D6AA20E
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 05:43:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=ogQtcN0F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93016-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93016-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C69E300CC3D
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 03:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF414201004;
	Sun, 21 Jun 2026 03:43:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EC1B4223
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 03:43:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782013398; cv=none; b=ZGspT67e22MIQW7rR8SHhLli+IM6U9wHmJGzH9HHn+jWoO3hBgQKscEZNbbfVfwqBkIc8VkrEF7KlQrKsIVEpyBWudvU3/X7t5TK5MGy3oNUtHOigqBV3Hh3UcUat+VcLuuL9s1HPpGZXG3tqFjtmNbAUskZfZtPdMyQUHiDUT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782013398; c=relaxed/simple;
	bh=f0VFYAJoBzqfNUa9Msfiw8ZQU/ag0N3Eljw1xeODBcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwO54T1yOQbr2dccX5FWbnE3PS2wHXPSeFpUm1rvRpMmv1iHBC/5QBrQGqyblIdJRRiKjLtp1Wj3RwDmiW+84cp/ojZcanB2rDvT5i/nPUAC1DEB/OH9gfzYWt/eR4bGEcLDPcKRh6IXizl7E5V4F/aNW5ekx7CYrv0kidUtOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ogQtcN0F; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tTkaFuJS+E2ALy7F5WkM5roLnWZefBa0N4TO3XBWJ/g=; b=ogQtcN0FhSHFNQL68AbPsKX/Zj
	EjnwkltmHLxiRzN5w2tjreD0KxIWGqSlQ3tKtT4uXuI7DZRtYA/ambT0rPuSeET8sP140IxK5aKdS
	ZaCm/Zuqhg2FmJRx/bD8KgN0/PipkhuecuObhqY3suuJrNrqioE0MSAK8p/bJqC6OtcNnUDVWiJQ1
	PHgiiY39gh0NXPAEElzTq+bFjsm+KBAzd0J+qf9W5DnztZE+yPIHaaoPUBqbS4lG+t9I5XtQb3DRT
	YSBsKHh91Y0L7JckGdn9iU/RxK+XJVkwIbJf6MEq9zbWgIw1Q+oPRIoFq6L6FDVl5Mt22HY0bE/bD
	wfAHqt8A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb95Q-00000003irt-3QF0;
	Sun, 21 Jun 2026 03:43:08 +0000
Message-ID: <1ca0f52a-82b0-41ea-847d-85d3903b50d2@infradead.org>
Date: Sat, 20 Jun 2026 20:43:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation: xe_drm: fix chars used for subsection
To: Rafael Passos <rafael@rcpassos.me>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620201732.94141-1-rafael@rcpassos.me>
 <20260620201732.94141-3-rafael@rcpassos.me>
 <4130fd7c-6f7c-4b03-ad64-7a738e2f0bc9@infradead.org>
 <DJEDNH9TR3ZE.QO68KQ89RX4O@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DJEDNH9TR3ZE.QO68KQ89RX4O@rcpassos.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93016-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@rcpassos.me,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1563D6AA20E



On 6/20/26 7:38 PM, Rafael Passos wrote:
> Hi,
> 
> On Sat Jun 20, 2026 at 6:42 PM -03, Randy Dunlap wrote:
>> Hi,
>>
>> It would be helpful to include the warnings here (but maybe not
>> all 10 lines of each warning).
> 
> Ok, I will add them.
> 
>> scripts/get_maintainer.pl should have told you that. (It does for me.)
> 
> It did, but I made the (wrong) choice of sending it only to the docs
> list, beucase I had 3 patches with nothing but doc fixes.
> 
> In cases like this, should I:
> 
> 1. send a patchset, including the maintainers only on the patch related
>    to them ?
> 2. send the patchset including everyone involved ?
> 3. not sent a patchset at all, and send separate patches for each list?

IMO you could do 1. or 3.
For #1, send the cover letter to anyone who is receiving
any one patch.

> In this case, the other two patches will be dropped. So I will send a 
> V2 for this one, and for the correct audience.


-- 
~Randy


