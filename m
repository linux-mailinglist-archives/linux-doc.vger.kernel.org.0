Return-Path: <linux-doc+bounces-84226-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFw3MrD/6GlPSwIAu9opvQ
	(envelope-from <linux-doc+bounces-84226-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 19:04:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F3449246
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 19:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12A5F3060D93
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 16:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FB2347C7;
	Wed, 22 Apr 2026 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sLjrwuRY"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054183803D7
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776877088; cv=none; b=JlhAOKu3jnXU38GgFM6e/xZ6l+FaavOXwJKVgGuSTDjHF3kRshXZ+1HlEOAF2a+ZSc1LBhLIQMXpsl08VPOCBZfPnwADK9yzrwz7HUcCLr89ocJ80MRq8s2Q2Junbf9q2dpvQUE5qfAzaB9beEuHErezWaMXh1qatcwm3+3uCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776877088; c=relaxed/simple;
	bh=/A4nX0A+l8sOuG116fKpTo9ngJstZ6QdGb/oOGOWiNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FznJhwC/wb5Iybf/XgsBFSR0r/V7MN3Zgmm4J05lRjA/K4MYcHWdOETTm26oNezCPShqPTArz68AcYX4wL8p77G7SEUKScNrK208zB5FKmQp441+8wbMAPOTmPUr4MUE79+KXfmt1prct5eacvhQhYjv9kYeUmZTnkYsTfAW+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sLjrwuRY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sR85nwy3EOg+TAggxv5JPs2F0l0/vULYj7a/wiOe72A=; b=sLjrwuRYKiaOKGKTt1ha68ej78
	tOsTblmVwd0YmpastpYftkB06q13EAC2P4tkPU+tmAo7VQYxEiu9HjlvnutU/RGfsD4feZPp2LMnQ
	1nC8C3nVQtG+mVqKwDk0QjHoNIwi+EphGjGe2vnnZt2dMYEuw7zlVjL7z4YR8jBkwCLdOBWBQ7jmm
	LoQmIcKH0xTSFbr47r0/oszeqgqQn/P57iW1kNdAsuTUXf6cQsC5VmlcAL+psZHvLnoipXcmef0Gh
	pRocR8IvCLJdJZHvzGQGxHrfRobhAjwppjurNpYY2BzXyHThUx5xyPDlSLu6nreb43/EKb3aEyR/H
	Pdqt1ZYw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFatl-0000000AXgx-04QO;
	Wed, 22 Apr 2026 16:58:01 +0000
Message-ID: <b845c448-1655-4860-9b6d-93d6f8426740@infradead.org>
Date: Wed, 22 Apr 2026 09:58:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: Stale website link in trace/rv/monitor_sched.rst
To: Matteo Martelli <matteo.martelli@codethink.co.uk>,
 Jonathan Corbet <corbet@lwn.net>, Gabriele Monaco <gmonaco@redhat.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <403330813c60b650873c54c68042e066@codethink.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <403330813c60b650873c54c68042e066@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84226-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[archive.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B25F3449246
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 3:35 AM, Matteo Martelli wrote:
> 
> Hi all,
> 
> I came across the Documentation/trace/rv/monitor_sched.rst document and found
> out that the link under references is stale as it points to what looks like a
> scam website.
> 
> The link was added in [1] together with the first version of the document.
> 
> I'm just reporting without a patch as I don't know what the new link should be.
> 
> [1]: https://lore.kernel.org/all/20250305140406.350227-9-gmonaco@redhat.com/
> 
> Best regards,
> Matteo Martelli
> 

archive.org's latest archive of it is at:
https://web.archive.org/web/20250820090002/https://bristot.me/linux-task-model/

but what to do with that?

-- 
~Randy


