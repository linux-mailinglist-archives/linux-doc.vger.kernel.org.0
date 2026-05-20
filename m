Return-Path: <linux-doc+bounces-88568-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKi9KM1EDWqavQUAu9opvQ
	(envelope-from <linux-doc+bounces-88568-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 07:21:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3358587BBC
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 07:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDEF303A503
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 05:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF9B3546E0;
	Wed, 20 May 2026 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUJ4xWWD"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C033DED9;
	Wed, 20 May 2026 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779254464; cv=none; b=ZJCyfQ8dR7P/7KRglS4+RTHe47EAiSICowDYcoy9tcPxKkPZg+awPxn65vbVbrKgktipYZtOaCyyUnshbL+bch5lacmm17N3JUPHmKn31t9RATQqCVQMnhE/0JVnpb9KAXTq1VqSPA2J2G2aDrldnQ2TtXIgwX0UeQYtiVNyRpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779254464; c=relaxed/simple;
	bh=Hs3Y3d8s9CyUiPAu7BFaDDPnSbwBO4g1xfjQhZOhTkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idjtoydndzcWAKsfPo6u5g5fQbMsRgZUpHN8a6Of7kXZVR3Wv76m5L0E8DhFyO0IpWv2AoFHmP6YLLmv4fqCMecQSzhitOEAsVFeh1aL/cYuZYX5+A9iO1P5eKWfiPx29noi1VinDfQP7K00CeaAllisAH1GO6rR2Cf8veKRkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUJ4xWWD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965601F000E9;
	Wed, 20 May 2026 05:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779254462;
	bh=0ClVNQ/qL0BwmVZSTaZ5agutkbazJYSG1buLiSM5poM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JUJ4xWWDZC7ayjgLnNw3Zv1yTxlCTSdlCac/utWchwC+t8s2xegSJt2/2HSa91wKW
	 sOPxrrF+gZ2MjJpayu8Ois3BEWsu20rgV8zlw21fI2hh435yP6R028TsFTBsQUbdYh
	 X27wLIOCZe+h8GXzVyTI6k7eJoJwr6Tmd+tKUoZ/XP5I85HAcHLGDapdmNqhO3M/8v
	 0W1oJ38uMIBR/gNS3k+9/Mr5HeYJSHmoxwwuf3zD0aeQKkHSudhDmWbX60zIDrOFs8
	 eUo7UuZXg7WnsBVBv5ahAgIn6KcCBa9aFfcXSu+0n6woCVpfudv41xLOIC2qOMylSU
	 o3JaL2zIkNw1g==
Date: Wed, 20 May 2026 08:20:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-new] Documentation/admin-guide/mm: Fix typos in
 transhuge.rst
Message-ID: <ag1EtRBvuT9NUTOm@kernel.org>
References: <20260520051751.74396-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520051751.74396-1-leon.hwang@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88568-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F3358587BBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 01:17:51PM +0800, Leon Hwang wrote:
> Fix these two typos:
> 
> 1. approporiately -> appropriately
> 2. presure -> pressure
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  Documentation/admin-guide/mm/transhuge.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Sincerely yours,
Mike.

