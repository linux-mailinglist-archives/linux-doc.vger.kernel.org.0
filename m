Return-Path: <linux-doc+bounces-94854-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J6i5OcfOR2pofgAAu9opvQ
	(envelope-from <linux-doc+bounces-94854-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:01:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B591703AD9
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=S9oYgrZ6;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94854-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94854-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A027C300B9AF
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 14:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC913FBEC3;
	Fri,  3 Jul 2026 14:55:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002193F485E;
	Fri,  3 Jul 2026 14:55:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090558; cv=none; b=ZP1Psv5WqEpl76OzpxB6KSyIV8j/JZuK9anJiKpk5TPEAA2ExjJ7W8PFDOHQNEs2WuL+JpW491ymvONr1c4NmXcicZYIS4h+lT579OJYMVrYC3QRubSj7Fv/p9VTY08a6Tj9m+RqAl6A9KVUhNaokpOjpBG8kSmZekqdN5kOQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090558; c=relaxed/simple;
	bh=SK6N+4Kw2vy3x3+hsIpZLgF9nRE23C7o4xhOpyb/k/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrMwMY3q7TS33PK40ovD3CgK1ygr9po41TvZNhxoSOpzgLMW/fRxjKVIPF+g1gfpmI98P7yEgEKEzO3EgN9M8eZMSg8xxYuI/8aEx2MIFbFFGcZfQ97rZZJsindmuo0bgmRUF6ySTy1Ek2mWR6zfwiEkIV3WsCCsCkrYFvembVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S9oYgrZ6; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09F25463D;
	Fri,  3 Jul 2026 07:55:52 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 232E63F905;
	Fri,  3 Jul 2026 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783090556; bh=SK6N+4Kw2vy3x3+hsIpZLgF9nRE23C7o4xhOpyb/k/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9oYgrZ6oZsHOH0UoMqYEbvDMsroTPuwSE+HzZ1xYfswP+KuNpt4B4BU+MPhwQaMI
	 EqEgmcaEU87K9wHDfliJoPeBcjQLouWsiRU70cB2lNN4blfSISh21tM0JSG018OnTH
	 MG/uKQvVHeqECM5D5aO7kSxfdYFOQ07yVWLmxUDw=
Date: Fri, 3 Jul 2026 15:55:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] selftests/mm: test kmemleak's N-consecutive-scan
 leak confirmation
Message-ID: <akfNeK7OOpvoZE9z@arm.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>
 <akYkKgWOsYnw6ETE@arm.com>
 <akZ4tzQw70x3RR2D@gmail.com>
 <akeX8mFiizd65pDw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akeX8mFiizd65pDw@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94854-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B591703AD9

On Fri, Jul 03, 2026 at 04:24:09AM -0700, Breno Leitao wrote:
> On Thu, Jul 02, 2026 at 07:55:42AM -0700, Breno Leitao wrote:
> > On Thu, Jul 02, 2026 at 09:41:14AM +0100, Catalin Marinas wrote:
> > > On Fri, Jun 26, 2026 at 08:52:03AM -0700, Breno Leitao wrote:
> > > > +pass "min_unref_scans=1 immediate; =2 gated to 2nd scan (counts $first/$s1/$s2); param read-back ok"
> > > 
> > > Are these off by one?
> > 
> > They seem to be OK, and I've tested it multiple times.
> > 
> > > Kmemleak has a mechanism to detect live objects
> > > via the checksum. A side effect is that on allocation, the checksum is 0
> > > and only after the first scan the checksum is changed.
> > 
> > I got the impression that checksum continues to be zero for these
> > objects during the whole life time? (weird). 
> 
> I've investigated this a bit more and I found something interesting, in
> our per_pcu checksum. The code in update_checksum() is:
> 
> 	for_each_possible_cpu(cpu) {
> 		void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);
> 
> 		object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
> 	}
> 
> From my naive view, this has two concerns:
> 
> 1) In the kernel, crc32(0, <64 zero bytes>, 64) is zero, and the samples' test
> I am using (kmemleak-test.c) has:
> 
> 	pr_info("__alloc_percpu(64, 4) = 0x%px\n", __alloc_percpu(64, 4)); 
> 
> alloc_percpu returns ZEROed memory, so, we are checkingsuming zero content.
> Because we are using 0 as seed, that is returning zero.
> 
> object->checksum is a bunch of 0 XOR 0 XOR 0 and so forth.

Ah, yes, you are right. Irrespective of the per-cpu xor, I think we
should seed the checksum with something other than 0 (say -1 or some
random clock value).

> 2) that XOR above seems very weird. Basically we want to detect if some of
> those per-cpu areas changed, here, but, if checksum goes to zero if two object content is similar.
> 
> Let me give you a simple example. We have SMP=2, and both objects have crc32 =
> 0x42. At the end of that function, object->checksum will be zero, given 0x42
> XOR 0x42 is zero.
> 
> If both object changes their content at the same time, object->checksum will
> continue to be zero (although the content (and checksum) HAS changed).
> 
> I understand we want to detect any change in any of these per cpu field and
> catch it independent of the CPU. I am inclined toward that.
> 
> 	--- a/mm/kmemleak.c
> 	+++ b/mm/kmemleak.c
> 	@@ -1409,8 +1409,9 @@ static bool update_checksum(struct kmemleak_object *object)
> 			object->checksum = 0;
> 			for_each_possible_cpu(cpu) {
> 				void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);
> 	+                       u32 seed = object->checksum + cpu;
> 
> 	-                       object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
> 	+                       object->checksum ^= crc32(seed, kasan_reset_tag((void *)ptr), object->size);

Yeah, the xor wasn't a great idea. What about initialising the checksum
value on object allocation to ~0 (for the two-scans idea) and for
per-cpu, just build the crc on top of the previous crc, something like:

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 7c7ba17ce7af..e196f53f9b46 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -687,7 +687,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
 	atomic_set(&object->use_count, 1);
 	object->excess_ref = 0;
 	object->count = 0;			/* white color initially */
-	object->checksum = 0;
+	object->checksum = ~0;
 	object->del_state = 0;
 
 	/* task information */
@@ -981,7 +981,7 @@ static void reset_checksum(unsigned long ptr)
 	}
 
 	raw_spin_lock_irqsave(&object->lock, flags);
-	object->checksum = 0;
+	object->checksum = ~0;
 	raw_spin_unlock_irqrestore(&object->lock, flags);
 	put_object(object);
 }
@@ -1410,7 +1410,8 @@ static bool update_checksum(struct kmemleak_object *object)
 		for_each_possible_cpu(cpu) {
 			void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);
 
-			object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
+			object->checksum = crc32(object->checksum,
+						 kasan_reset_tag((void *)ptr), object->size);
 		}
 	} else {
 		object->checksum = crc32(0, kasan_reset_tag((void *)object->pointer), object->size);

-- 
Catalin

