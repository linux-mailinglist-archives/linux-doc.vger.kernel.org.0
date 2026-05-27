Return-Path: <linux-doc+bounces-89796-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLSVKQR5F2ruFggAu9opvQ
	(envelope-from <linux-doc+bounces-89796-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 01:06:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BA5EADB5
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 01:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C65843070CB8
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 23:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFE21940B0;
	Wed, 27 May 2026 23:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="L0QusdHv"
X-Original-To: linux-doc@vger.kernel.org
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B304219E8;
	Wed, 27 May 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779923180; cv=none; b=Qiynd/bhg2+0UV/2JRAlYiNIWav6ARDi+XQ4158x/YAcMfJvd73O5e1H36uOPVI2eYVpSQgHlS+zhw4qNrfNcVFPgmkwbu9H9yfLSo7mHW6amcTyA0vStl+rMLJmeeipVMbr/TojA2P4q0fSpGfAdQv1rkbsUXsNmbeAJ2MeD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779923180; c=relaxed/simple;
	bh=8chj61ssxpOwjXyr1dKZNkjg55TZBjnN92wYvqo2wVM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NhZpuBYgpCMOcFJ7rEgqZoJNrrOYRGh15a1OcH3O/FQoD63qoxn6rMYUtGXEg2qjg3CuuSYQBBJs56zsM2Xxi71Bduq159o5FKIoxMrvNrENyX+OjwA3FNG6E1R1Soqmp5pjA86WMlc9RL5qw7Zdsag4KGFlH0JJ07cCSoaDjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=L0QusdHv; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1779923178;
	bh=8chj61ssxpOwjXyr1dKZNkjg55TZBjnN92wYvqo2wVM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L0QusdHvliQE5w7xFb+WEfWBVlVf0LPO5GTu8/PbUoq0Re71KzkNHjrkQdTGRGI8M
	 PZuacxwJjg6CLPhRMhXIvRD7kSN6wc+nzhrSprAYUFJzSq4BTTGO9rHRr2HsD1lR6b
	 e1M8e7eVq86j3cmQ0SbPeKyKslPyriou7JqPGGYg=
Received: by gentwo.org (Postfix, from userid 1003)
	id 88A4D402E4; Wed, 27 May 2026 16:06:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 875814014B;
	Wed, 27 May 2026 16:06:18 -0700 (PDT)
Date: Wed, 27 May 2026 16:06:18 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Matthew Wilcox <willy@infradead.org>
cc: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
    David Rientjes <rientjes@google.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug
 enablement
In-Reply-To: <ahdsgyYYDn6juR_R@casper.infradead.org>
Message-ID: <7f4ec43c-0d9c-190a-0ce5-bc3276b45cb0@gentwo.org>
References: <20260527104634.2434-1-lirongqing@baidu.com> <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org> <ahdsgyYYDn6juR_R@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gentwo.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gentwo.org:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-89796-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gentwo.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cl@gentwo.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gentwo.org:mid,gentwo.org:dkim]
X-Rspamd-Queue-Id: 294BA5EADB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026, Matthew Wilcox wrote:

> > Please clean this mess up.
>
> Isn't that what this patch does?

Its not marked as fixing something nor as addressing the weirdness of
using CONFIG_SLUB_DEBUG_ON here, A kernel build with CONFIG_SLUB_DEBUG_ON
can still boot without debugging if a certain kernel command line option
is given.




