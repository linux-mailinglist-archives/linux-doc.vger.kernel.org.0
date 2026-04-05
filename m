Return-Path: <linux-doc+bounces-82479-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKVzHIr40Wm9RwcAu9opvQ
	(envelope-from <linux-doc+bounces-82479-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Apr 2026 07:52:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24A39D716
	for <lists+linux-doc@lfdr.de>; Sun, 05 Apr 2026 07:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03360300372F
	for <lists+linux-doc@lfdr.de>; Sun,  5 Apr 2026 05:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAF436921D;
	Sun,  5 Apr 2026 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pFOLqWKg"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DB368277;
	Sun,  5 Apr 2026 05:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775368324; cv=none; b=UPM1e7JKGL+8ZOSUegFH8vGOZHnblQ94CFyHgBwxo8lkYNTVxsT7LJFSXAUP+THbRMBWiT7lOLkZt9IILUUqlIgOvXx1OGN3KAmS4C/ovGfSiFH5YVRb0X2cppBFWVKSCcuQD0+UOuRWRGr3FfUWa4fHjJn4LdLewZ86SAT294w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775368324; c=relaxed/simple;
	bh=HqY5FvWjlSiwoJ1mh/w+iMLDfqlJOa5YALaMtYDrS9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkDsZsMT/oA9/jWPAxqpfsvAfOQ30c7JLB2WQTxJlB5fSdnmOH20BYmrM+ITlDpIVbbeM+rD9aVJBUOxniXb5zKrr4QyScHxuhRLol5TUecAV7m6rW8aywrKElSOir5BkbXTC851j0qJQsgs6YZaa2KqneKgiI5OqHbX1GHDztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pFOLqWKg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7PO4drtlyBc+WatlGqALX5qXvA5ai55SvBK+aFXYEyc=; b=pFOLqWKgMf2Q8rUHpkPaKuI0gE
	LxhjE5XUTvo7wVNNbaVo0Q9Vf/2z70UHmjq7PIOAZkmqWkJt1OWIy1p7PmFr2tl7pgaPJYjLR184D
	+FxHV483CB5fxVBXNqdRn6O1wRJAtJKq2Nqj4YCZVBBVm0Ki0ZrMHm872sb5Hn/7qGEK0PdntXzsG
	/wl5OPGMEONF73keg7xm9oo//8tsZFq7Tf8sABlQvd5wyXNShn5jvarW+UQ3s3o0bZ9QcvZsw7VZD
	tyvBsmczHeGq5remmilwZTIHgJpkTg77IyPoNyawOHBmt+Mergkt1WOLXJHmE110mEbhOWuvN25Xr
	xEH2lbgw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9GOs-00000003zH8-2wdB;
	Sun, 05 Apr 2026 05:51:58 +0000
Message-ID: <b3c87ef0-5faf-4bda-90e4-e6b24419e0c0@infradead.org>
Date: Sat, 4 Apr 2026 22:51:57 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] docs: advanced search with benchmark harness
To: Rito Rhymes <rito@ritovision.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321181511.11706-1-rito@ritovision.com>
 <DHK7FY79AOJW.AC6LHU703AIR@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DHK7FY79AOJW.AC6LHU703AIR@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82479-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A24A39D716
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/4/26 12:50 AM, Rito Rhymes wrote:
> Randy, I meant to include you on the v3 reroll; this new version is
> intended to address the compatibility issue you hit earlier in our
> initial test and debugging (among other improvements).
> 
> I believe the problem came from version-dependent differences in the
> generated Sphinx search data, so this reroll hardens the compatibility
> handling around those differences and the search logic that consumes the
> data.
> 
> If you have time to try it again with the setup that exposed the
> problem before, I would appreciate confirmation that the updated
> version behaves correctly there.
> 
> I would also appreciate your broader assessment of the feature:
> whether it seems genuinely useful in practice, how large the benefit is
> relative to the current Quick Search interface, how many other users you
> think would benefit from it, and whether you see any remaining issues or
> obvious room for improvement.

I like it. I think it's useful -- the old search could give a bit too much
output. The search result tabs (groups) are helpful.
But it will be up to Jon whether its usefulness exceeds its complications.

Also, I'm not sure that Linux developer mailing lists will reach the right
audience for feedback about this change.

I mostly use 'grep' for searching Documentation/ and I expect lots of other
developers also do that (if they bother to look). So I don't know who will
be the largest user(s) of this feature. I.e., I don't know who uses
docs.kernel.org.

I do notice under the Pages tab that all of the pages listed say
"Summary unavailable." I don't know what should be there instead
of that message.

-- 
~Randy


