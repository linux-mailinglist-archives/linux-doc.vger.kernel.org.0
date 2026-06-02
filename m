Return-Path: <linux-doc+bounces-90423-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH0OIkcmHmo9hgkAu9opvQ
	(envelope-from <linux-doc+bounces-90423-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 02:39:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EA626A34
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 02:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B88423019128
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 00:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911BF308F2A;
	Tue,  2 Jun 2026 00:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JPxKSqcS"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86684306778;
	Tue,  2 Jun 2026 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360772; cv=none; b=DO8jExh+ruavjue4+l4Acsvy7WI7i/6BNl8mXTzcpDIPqaBfAhwVmM6wOCSht/KTNro7P9yVxWc55vOagkAyY3Xw9vyA/nsphn+Y+SO7gsP9rplMT79+GctZWzmV7spQpkhhu9R44OmJaOh3crIMHjj5tcBfbNmWLclqJav/ZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360772; c=relaxed/simple;
	bh=ZI/7bM/8vZxnYP2aCgikn3UECnABcjInnFZj4n7oWqk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XQGC16TxOwGMiq+0B/bXeWg8J99WYl74E2v63tEzOGyS8l2xY3ixgaVMkGxK3H5eFHZ2V7Cxr1EML62zXJ41PYMn+1Pf8kZqNk7P1sD4FxNyFnIDyF1SzweHHqZWE0Ovl9dPWJ2nM2bHloGRXF8TfVGLEx8/DhoyFje3km7fOSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JPxKSqcS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2511F00893;
	Tue,  2 Jun 2026 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780360771;
	bh=ZLruH0m3W08KnNTLHRjnVrTL7t6nQJJg42epmFol5Qg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JPxKSqcSscNTfuwfvLBv8utgcJoa6sDT/q374gqHLlMLkLxdJ00mrPdM7AXzLUwwQ
	 OFcFSqi5SQEf82OeNoWtIYGXA7zDnW5rPAbSiyf+DRdVhwpoemoHzCc0QsFdA2gyER
	 h9zcquT27k/N11bEOs3cAWFnbBlFrhexYz/xP8kM=
Date: Mon, 1 Jun 2026 17:39:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] tools/lib/mm: add shared file helpers
Message-Id: <20260601173929.aa5141c274c351ccbcabc767@linux-foundation.org>
In-Reply-To: <2fb753d0-a9cd-48f3-a24d-ea0b54330279@arm.com>
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
	<20260527142432.230127-3-sarthak.sharma@arm.com>
	<2fb753d0-a9cd-48f3-a24d-ea0b54330279@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90423-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:mid,linux-foundation.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Queue-Id: ED6EA626A34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 11:40:52 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> On 5/27/26 7:54 PM, Sarthak Sharma wrote:
> > Move read_file(), write_file(), read_num(), and write_num() out of
> > tools/testing/selftests/mm/vm_util.c into a new shared helper under
> > tools/lib/mm/.
> > 
> > These helpers are used by mm selftests today and will also be needed by
> > shared hugepage helpers in subsequent patches. Move them to a generic
> > location so they can be reused outside selftests as well.
> > 
> > Keep the helpers exposed to mm selftests through vm_util.h by including
> > the new shared header there, and link the new helper into the
> > selftests/mm build.
> > 
> > Add tools/lib/mm/ to the MEMORY MANAGEMENT - MISC entry in MAINTAINERS.
> > 
> > Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> > ---
> 
> Hi Andrew!
> 
> Can you please fold the below fixlet into patch 2, as suggested by
> Sashiko.

Thanks.  Please incorporate this (and the bisection fixlet and anything
else) into a v5 series, after 7.2-rc1?

Because it's late in 7.1-rcX and there is still much reviewing and
testing to be done (please).


