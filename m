Return-Path: <linux-doc+bounces-84504-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPu8G5J862npNAAAu9opvQ
	(envelope-from <linux-doc+bounces-84504-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 16:22:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2B460241
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 16:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBE693011769
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175733DBD7A;
	Fri, 24 Apr 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K0IngNMP"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D223DBD70;
	Fri, 24 Apr 2026 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040373; cv=none; b=Gu7YgH/iwW+p2m0mVvAfHBc6HpFOpycoLexuHIi3PVbhTHVahLlcfESTwX2H48lYnz9ykJJ0xwDjivCcR91ZVkEKu5beDdhEK9RRO0sL5+IihhiwqQjz+t/pLa24F1XZGv+yKR1TSwJ6QhUlEVi9vbyyiH6VdAr/VJd9b6GEJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040373; c=relaxed/simple;
	bh=XuFBaYFsxNxJuAT5m5PmvNcPPDaWLvDhlZjjhyfsrpo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jgBgUC9iHiNMKv4RjWuq5NLOVEHkYSarXCtPtfwRhaDaJaZXPi1NWm02o69ySsiQhbkNo4v7XnMMDi8yqZ0bKxMnHGl5KhHHG2YMi/AlZq87M24JQrpoFf9dNwaPvVo+ul3VwOlG/YGyyWSUN6s9RHaS0JJln+cLDVGEBZm7sWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K0IngNMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9998C19425;
	Fri, 24 Apr 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777040372;
	bh=XuFBaYFsxNxJuAT5m5PmvNcPPDaWLvDhlZjjhyfsrpo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K0IngNMPxAAEI2TDeCeCwYC8Vvs1HT4fE9HmmudRcIoD4y/iMXvym80IhDwFTrdp8
	 tpoHGBsvaugUDeKCl0zBVlNEnGIox0SKjJC6JdaU/xfLm8UNmkH2Nga4F2MYcETzgL
	 KiHKTp/p4Bjyg2u+QwQJqALX+Z+KzikpBS14CJok=
Date: Fri, 24 Apr 2026 07:19:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Nico Pache <npache@redhat.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-trace-kernel@vger.kernel.org>, <aarcange@redhat.com>,
 <anshuman.khandual@arm.com>, <apopple@nvidia.com>, <baohua@kernel.org>,
 <baolin.wang@linux.alibaba.com>, <byungchul@sk.com>,
 <catalin.marinas@arm.com>, <cl@gentwo.org>, <corbet@lwn.net>,
 <dave.hansen@linux.intel.com>, <david@kernel.org>, <dev.jain@arm.com>,
 <gourry@gourry.net>, <hannes@cmpxchg.org>, <hughd@google.com>,
 <jack@suse.cz>, <jackmanb@google.com>, <jannh@google.com>,
 <jglisse@google.com>, <joshua.hahnjy@gmail.com>, <kas@kernel.org>,
 <lance.yang@linux.dev>, <Liam.Howlett@oracle.com>, <ljs@kernel.org>,
 <mathieu.desnoyers@efficios.com>, <mhiramat@kernel.org>, <mhocko@suse.com>,
 <peterx@redhat.com>, <pfalcato@suse.de>, <rakie.kim@sk.com>,
 <raquini@redhat.com>, <rdunlap@infradead.org>, <richard.weiyang@gmail.com>,
 <rientjes@google.com>, <rostedt@goodmis.org>, <rppt@kernel.org>,
 <ryan.roberts@arm.com>, <shivankg@amd.com>, <sunnanyong@huawei.com>,
 <surenb@google.com>, <thomas.hellstrom@linux.intel.com>, <tiwai@suse.de>,
 <usamaarif642@gmail.com>, <vbabka@suse.cz>, <vishal.moola@gmail.com>,
 <wangkefeng.wang@huawei.com>, <will@kernel.org>, <willy@infradead.org>,
 <yang@os.amperecomputing.com>, <ying.huang@linux.alibaba.com>,
 <ziy@nvidia.com>, <zokeefe@google.com>
Subject: Re: [PATCH 7.2 v16 00/13] khugepaged: mTHP support
Message-Id: <20260424071930.62318a9294e07c99ba0ff8a2@linux-foundation.org>
In-Reply-To: <aet4nz/Ljn0kDjDk@gsse-cloud1.jf.intel.com>
References: <20260419185750.260784-1-npache@redhat.com>
	<20260424065828.031775921990de37f83a2468@linux-foundation.org>
	<aet4nz/Ljn0kDjDk@gsse-cloud1.jf.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C8C2B460241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-84504-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,kvack.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,oracle.com,efficios.com,suse.com,suse.de,infradead.org,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linux-foundation.org:dkim,linux-foundation.org:mid,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, 24 Apr 2026 07:05:19 -0700 Matthew Brost <matthew.brost@intel.com> wrote:

> On Fri, Apr 24, 2026 at 06:58:28AM -0700, Andrew Morton wrote:
> > On Sun, 19 Apr 2026 12:57:37 -0600 Nico Pache <npache@redhat.com> wrote:
> > 
> > > The following series provides khugepaged with the capability to collapse
> > > anonymous memory regions to mTHPs.
> > 
> > Lots of stuff here:
> > 	https://sashiko.dev/#/patchset/20260419185750.260784-1-npache@redhat.com
> > 
> > It's going to take some time.  Hopefully worthwhile.
> > 
> > As always, it's useful to hear about the usefulness of the AI review.
> 
> Drive by comment.
> 
> On the DRM side sashiko batting average is about .500 but even on misses
> it is generally is helpful in questioning assumptions made in patches.

Interesting, thanks.

Personally, not adding bugs to Linux is so damn important, I'd be happy
with a lot less than 50%.

> Matt sashiko

"A sashiko mat is a decorative or functional mat, such as a coaster,
table mat, or place mat, made using traditional Japanese, functional,
and meditative embroidery stitching".

So there.

