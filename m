Return-Path: <linux-doc+bounces-94791-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NauABTCdR2olcQAAu9opvQ
	(envelope-from <linux-doc+bounces-94791-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:29:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB71701D94
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:29:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=btkxHrkz;
	dmarc=pass (policy=none) header.from=debian.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94791-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94791-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 331C83043FBE
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0887D3BFADE;
	Fri,  3 Jul 2026 11:24:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097743C4B9A;
	Fri,  3 Jul 2026 11:24:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077881; cv=none; b=rnOLDNMA5zlDb9kynR+Y6WuEfaOhpvk8kfpRZPZB/uK1Y4usmz63djW/e0FFJzWzbAa8DoKnuUgov9Twdq04bota9ODkZWr15vPJWYtK0ylmMLkFqb3pizNqOAtt/0vmIM1SyyFGFTeJngUlGB79LZ5iEMXgKSGUOIDiQ9KDEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077881; c=relaxed/simple;
	bh=4oxmWufTRFAQuiOe0V0OOrsBSYMDsdXdFlzpM5/7AQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs8vzI9h9jUF2JdX7pz/o7w0DlaXvyYRUgZJRoWZjHnu21dowZWbaVf+Qx3e9Brhtf5hSzgLMsQ0Y2TR9Sk74sf/UsEzqnNDXQxtm0wlDxNumwtgF5ndUoRAwzpD/w0rZKBOHISitgSZ16BTJ0lPeWh8GjL5+HzZthqQkGxkEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=btkxHrkz; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n17w8bkbdYcKF+4kwASzBBp0Rz/4YcqSgLJnMesWzKg=; b=btkxHrkzCM4wV6isED0eBgRsyL
	wwGgzJ6GKqoqppe6E8Q4D9rTHXf2Hph6UVag5NZvod4BsLIxt3cg3PcoclVxTWVafHPVaQahr89Np
	4lMCW/r/KGYOGO+vU8LA2jtXK9HkXrztzoQv9OquY52DCx98NFS43gnp0W1hO7tNzJyJnP3lf/LE7
	baPDHMoSz46F6TsffR+YQt4pcHYPhQbIE/xcM682GDzhTomftlk8Y/eN8LGeRxI8RX3MN303TPN/Y
	SFcPFDDAoGL0OPlmfg+Bk9jYQ3qg1MfzozX157BNyy/8pe9f0ab7AvXojHCXCDbBe/y7w70KGCn2j
	DWQoluyA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfc0F-009Miy-36;
	Fri, 03 Jul 2026 11:24:16 +0000
Date: Fri, 3 Jul 2026 04:24:09 -0700
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
Message-ID: <akeX8mFiizd65pDw@gmail.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>
 <akYkKgWOsYnw6ETE@arm.com>
 <akZ4tzQw70x3RR2D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZ4tzQw70x3RR2D@gmail.com>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-94791-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FB71701D94

On Thu, Jul 02, 2026 at 07:55:42AM -0700, Breno Leitao wrote:
> On Thu, Jul 02, 2026 at 09:41:14AM +0100, Catalin Marinas wrote:
> > On Fri, Jun 26, 2026 at 08:52:03AM -0700, Breno Leitao wrote:
> > > +pass "min_unref_scans=1 immediate; =2 gated to 2nd scan (counts $first/$s1/$s2); param read-back ok"
> > 
> > Are these off by one?
> 
> They seem to be OK, and I've tested it multiple times.
> 
> > Kmemleak has a mechanism to detect live objects
> > via the checksum. A side effect is that on allocation, the checksum is 0
> > and only after the first scan the checksum is changed.
> 
> I got the impression that checksum continues to be zero for these
> objects during the whole life time? (weird). 

I've investigated this a bit more and I found something interesting, in
our per_pcu checksum. The code in update_checksum() is:

	for_each_possible_cpu(cpu) {
		void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);

		object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
	}

From my naive view, this has two concerns:

1) In the kernel, crc32(0, <64 zero bytes>, 64) is zero, and the samples' test
I am using (kmemleak-test.c) has:

	pr_info("__alloc_percpu(64, 4) = 0x%px\n", __alloc_percpu(64, 4)); 

alloc_percpu returns ZEROed memory, so, we are checkingsuming zero content.
Because we are using 0 as seed, that is returning zero.

object->checksum is a bunch of 0 XOR 0 XOR 0 and so forth.

2) that XOR above seems very weird. Basically we want to detect if some of
those per-cpu areas changed, here, but, if checksum goes to zero if two object content is similar.

Let me give you a simple example. We have SMP=2, and both objects have crc32 =
0x42. At the end of that function, object->checksum will be zero, given 0x42
XOR 0x42 is zero.

If both object changes their content at the same time, object->checksum will
continue to be zero (although the content (and checksum) HAS changed).

I understand we want to detect any change in any of these per cpu field and
catch it independent of the CPU. I am inclined toward that.

	--- a/mm/kmemleak.c
	+++ b/mm/kmemleak.c
	@@ -1409,8 +1409,9 @@ static bool update_checksum(struct kmemleak_object *object)
			object->checksum = 0;
			for_each_possible_cpu(cpu) {
				void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);
	+                       u32 seed = object->checksum + cpu;

	-                       object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
	+                       object->checksum ^= crc32(seed, kasan_reset_tag((void *)ptr), object->size);
			}
		} else {
			object->checksum = crc32(0, kasan_reset_tag((void *)object->pointer), object->size);



Once this is fixed, then I priming would make sense.

Please let me know if my flaky logic is worse than usual this Friday.
 --breno

