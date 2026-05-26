Return-Path: <linux-doc+bounces-89458-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOa1BdRkFWqCUwcAu9opvQ
	(envelope-from <linux-doc+bounces-89458-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 11:16:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33DD5D31C4
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 11:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 621513058147
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 09:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE8E35E1A4;
	Tue, 26 May 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNomKvyN"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB7165F16;
	Tue, 26 May 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786126; cv=none; b=nSHFiuO0jJDZskRKbRXZsMuMY1PsmAFhcP8o7asHlHs3vODXpsRJWvQOotUz7CpW+gx+Rzu0TMuGTXmNsEu6F4h4uQoNMrriwiPWguFDhm8WI7AXVpxiNsZb/INnoYKIlnruUp/p7CcL1sGe0fiuLhpICDnwcnZylM018E9l0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786126; c=relaxed/simple;
	bh=DFi/cRyCBqJ8Lu+MIcszq98L1mt6KhWwWqdGNno/Ut4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJidkve3juf5dvT6boihlS8usNPoXynwqDP/NB3C6JbQ1zNnBLYbEih16bxXTwpoK+OO5gIC8MJQca/+9LMIpLpeTeTFgevRjJsZkRXD04ACXUvo/unUK/+HZlpB2E828W9zPvdXCtagpqErATmmqflrshr/YJsvDzJ5mFHKGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNomKvyN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588C21F000E9;
	Tue, 26 May 2026 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786125;
	bh=wKXIQCwGOxQ2OgGY1VhstzsSDD6YrQoCwtJahftxT68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UNomKvyN6nChEG1NxIcLP+N+6IoiopMw+34CALCJS1jVueNSAZJcikxgGk727zWH7
	 /O9hdPRmLXWLr8Ed/g5NPz49bC9TmUl+HlK7pC9ysMn99RGkLEGAFNNN4AGIutRkgj
	 1gFbsnqhWoN5v+gZVG5laclAgI8gyuX64MD6KUdEhjrxGfmdFXM/MeaEYKLst8PS/x
	 aV/64NGkYCAuFFlGutO5jVD5sYTlaFjP/x5AaTy/pBUWXzdo/58xMd6TC7lxShVQK3
	 PqokTXpjbgijnmPHKlhp3IPbYH0iluKzjd38rqcGXg96LlAvdlj8mG/6OqhU1+bJBV
	 1wmaetbFt8CRg==
Date: Tue, 26 May 2026 12:01:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] tools/lib/mm: move hugepage_settings out of
 selftests
Message-ID: <ahVhgW4MdQLrtNa0@kernel.org>
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-3-sarthak.sharma@arm.com>
 <177964236208.4000040.6637433432678119173.b4-review@b4>
 <8992b3c0-a2af-436e-a50f-3729cf589d09@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8992b3c0-a2af-436e-a50f-3729cf589d09@arm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89458-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[27];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E33DD5D31C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 11:43:37AM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 5/24/26 10:36 PM, Mike Rapoport wrote:
> > On Thu, 21 May 2026 16:47:59 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> > 
> > Hi Sarthak,
> > 
> >>
> >> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/lib/mm/hugepage_settings.c
> >> similarity index 98%
> >> rename from tools/testing/selftests/mm/hugepage_settings.c
> >> rename to tools/lib/mm/hugepage_settings.c
> >> index 5e947abb7425..b08b27776fc5 100644
> >> --- a/tools/testing/selftests/mm/hugepage_settings.c
> >> +++ b/tools/lib/mm/hugepage_settings.c
> >> @@ -383,8 +387,6 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
> >>  		if (sscanf(entry->d_name, "hugepages-%zukB", &kb) != 1)
> >>  			continue;
> >>  		sizes[count++] = kb * 1024;
> >> -		ksft_print_msg("[INFO] detected hugetlb page size: %zu KiB\n",
> >> -			       kb);
> > 
> > I believe this message is useful for debugging.
> 
> I removed this because hugepage_settings.c is now moving out of
> selftests, and converting the ksft_print_msg() calls to plain printf()
> would break TAP output for selftests.
> 
> I can add these diagnostic lines back, but since this is now a shared
> helper, in order to preserve TAP compatibility, I'll have to do a
> fprintf(stderr, "# ..."). I feel this would look a bit odd from a
> non-selftest invocation though.

I think "# ... " is not that bad to begin with :)
 
> Another option is to add a logging hook so selftests can wire this to
> ksft_print_msg() while non-selftest users can use normal stderr, but
> that feels too much for 2 print statements and would extend the scope of
> this series.
> 
> Please let me know if you have a preference here.

-- 
Sincerely yours,
Mike.

