Return-Path: <linux-doc+bounces-94619-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gGRaOWZ/Rmp6XQsAu9opvQ
	(envelope-from <linux-doc+bounces-94619-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:10:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6B6F93CC
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:10:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=FhWJEmba;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94619-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94619-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68C513033EE4
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98536433E74;
	Thu,  2 Jul 2026 14:56:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA640433E60;
	Thu,  2 Jul 2026 14:56:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004172; cv=none; b=arHXDCbrhHnY3T+2nutrRjVVXbcNtjx/ZxiknqjIoaUoTDD2Z0NfbiT54TqIxQ7AhzwZsMMrXrllUTOZybeZiSsnRJCTkRwT/29NTmIuABmBj8C8j0kgN64S3joYLdeOzoIVIatpjth05LaPODl5RHD/Y94bdE5wODft7xVhJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004172; c=relaxed/simple;
	bh=vDuGQeeUlAtESW9PFQxwTmnDGUc+u5aFK2oEUM8U0jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajK8+XuqBdES9aURZ2gyI/wLf4N4pEkDeYPp6fMBvpmh+tW3L7jyHccW6W3YA+7Z39qMi86/kErzkt0pAW8pdK6oVFT4NP/7VxhREJ+DqwaNfPhXDUTM2UHIcTRfIO1hDB1CSqznhot5EY9xLtcQ/pfKTBnyjX829WScn56GsPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=FhWJEmba; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T5zfo7gwxlXsH8BZgYvGWYJB1jbxdG1g9whcrQZbPWA=; b=FhWJEmbaGn6UtsXhnqmiUSuk42
	oACCjFIyGz/kt/5rJT4X3y6beox60aT2V75XC1G+ptDHmqjKnSAmjOx2x1h6TagiUA5nKXTRYTbTS
	imggaPZaZHVbnLkjVW+RW6xdGKAP34AdwblxmWNJ1gFZvOfOZbtM7aDTqztig/cb/Htcdd90dVBHC
	hSrfA3aVx1FdAl8cYGJkP2igPo1dG67yeNpwKdc4qe7Ajk0A8yC+XZeskDbjuXgh8fVMLgyXaxHyI
	gAPqHLvOCIIEaH3cB4/QD88kOkCcovhVZvjgYFO/S6JpaGDHYSVi9juyoSJbNjtNXrPSXCeY7cGm8
	eRB4QPPQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfIpQ-008heR-1v;
	Thu, 02 Jul 2026 14:55:48 +0000
Date: Thu, 2 Jul 2026 07:55:42 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] selftests/mm: test kmemleak's N-consecutive-scan
 leak confirmation
Message-ID: <akZ4tzQw70x3RR2D@gmail.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>
 <akYkKgWOsYnw6ETE@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akYkKgWOsYnw6ETE@arm.com>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-94619-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDA6B6F93CC

On Thu, Jul 02, 2026 at 09:41:14AM +0100, Catalin Marinas wrote:
> On Fri, Jun 26, 2026 at 08:52:03AM -0700, Breno Leitao wrote:
> > +pass "min_unref_scans=1 immediate; =2 gated to 2nd scan (counts $first/$s1/$s2); param read-back ok"
> 
> Are these off by one?

They seem to be OK, and I've tested it multiple times.

> Kmemleak has a mechanism to detect live objects
> via the checksum. A side effect is that on allocation, the checksum is 0
> and only after the first scan the checksum is changed.

I got the impression that checksum continues to be zero for these
objects during the whole life time? (weird). 

If you think this selftest brings value, let me investigate what the
heck is happening here.

> On checksum mismatch (i.e. the first scan), we mark the object gray
> temporarily and won't increment unref_scans. So we already have an
> implicit two scans required to report an object as unreferenced during
> its early life.
> 
> I think this test needs a priming scan to update the checksums
> followed by the actual check for min_unref_scans (with scan=off,
> otherwise random scanning will skew the results).

I tried a priming scan and it actually breaks the min_unref_scans=2 case

