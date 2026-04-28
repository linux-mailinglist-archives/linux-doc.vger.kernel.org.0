Return-Path: <linux-doc+bounces-84977-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOLRHCjW8GkSZQEAu9opvQ
	(envelope-from <linux-doc+bounces-84977-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:45:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2E488260
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC4843067E18
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C1E410D02;
	Tue, 28 Apr 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9H9FwcE"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881B043E9FF;
	Tue, 28 Apr 2026 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386103; cv=none; b=CewWriA+VOVONhSv2zyb2ROFdb3rd0MkKgby3bhWZKJjsxRTA0BpSYZyLEzOnNIAX/X+IDRWhY2iRDAerq7HB7jKGbFuPok4ctsKTpDdP83r8QKcl/2QhWF9Ni0D45NbB/9HuaSScamliyjGP4elbJc2cwIUTOXOsKlGgavJDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386103; c=relaxed/simple;
	bh=zYVr8VjRbDUPgxlcymb8HZk4CGyioa94jSwOemrqBLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2o73p/7qqSrwN83uNsRqHRzdfwmdnromolgB2OHPpFihIuzXVXKzcFj6B9H/jFI2HXWTu97AheX2Pbk2jGeqrBWMWAN148LmyV0l+CInhLaEI34XSfsYE+tBRlExnjwCgsMEFspNSCb3fjqoT0szOEjZEkYLL6mE/VdjAjx1HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9H9FwcE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B87C2BCB5;
	Tue, 28 Apr 2026 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777386102;
	bh=zYVr8VjRbDUPgxlcymb8HZk4CGyioa94jSwOemrqBLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9H9FwcEdAxOnQCSMarBmTDc8SNRisq4zOckB6tC4rJsL32rMdeoCFb/DZnNAKLs3
	 GBOCYFnN9wmzc98CPsH2+6m8W8qWk9PpdOwSTk3D6s1vhKAOo/R6xh2XvaqNZinC4h
	 CKJG+XOcIifLl20IEDbA31eNEkA3Tboj8sr8+1BwClljDiBm/+4/tP16ClJvQJ2rIM
	 2IJYOrAJqVP8VGP4tJl1f70OJs/m3dAYSb/xtuzDSr1prt9xtcVOdh3Y7TU/NEmZpc
	 66geo97S8vgKEhMo3mRA1cQyZnt3lBlM0+s4D7VqfRYmQ5npGc87zORxeEF/oA5s+H
	 KpmKolqt3iZ/w==
From: SeongJae Park <sj@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Cheng-Han Wu <hank20010209@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/4] Docs/admin-guide/mm/damon: fix 'parametrs' typo
Date: Tue, 28 Apr 2026 07:21:31 -0700
Message-ID: <20260428142132.125055-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <4b36424f-218d-46eb-88d2-a25f146fb792@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 65F2E488260
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gmail.com,infradead.org,lwn.net,suse.com,linuxfoundation.org,google.com,lists.linux.dev,vger.kernel.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-84977-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, 28 Apr 2026 09:38:02 +0200 "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:

> On 4/28/26 01:39, SeongJae Park wrote:
> > On Sun, 26 Apr 2026 16:16:15 -0700 SeongJae Park <sj@kernel.org> wrote:
> > 
> >> From: Cheng-Han Wu <hank20010209@gmail.com>
> >> 
> >> Fix the misspelling of "parametrs" as "parameters" in
> >> reclaim.rst and lru_sort.rst.
> >> 
> >> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
> > 
> > Oops, I forgot adding my Reviewed-by: tag.
> > 
> > Reviewed-by: SeongJae Park <sj@kernel.org>
> > 
> > Andrew, could you please add the above my Reviewed-by: tag?
> 
> Since you were sending that patch along in you series, there was (as it
> must) already your S-o-b tag and that's stronger responsibility than a
> Reviewed-by, so it's redundant to add it :)

You are right.  But, not having R-b tags that I provided on the review stage of
patches gone makes me feel odd and bit confusing.  Also I made a weird tool for
checking DAMON patch review status that doesn't understand this situation
well...  Maybe I should fix my brain and tool, but if it doesn't bother Andrew,
I'd still hope to have the R-b tags on the patches.


Thanks,
SJ

[...]

