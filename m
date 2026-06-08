Return-Path: <linux-doc+bounces-91470-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sn5wJUAJJ2pXqgIAu9opvQ
	(envelope-from <linux-doc+bounces-91470-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 20:26:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CBE659B3A
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 20:26:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N9+AtIrL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91470-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91470-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58DD330547DA
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24012384CCD;
	Mon,  8 Jun 2026 18:11:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA033374F;
	Mon,  8 Jun 2026 18:11:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942319; cv=none; b=BBF4MTD+ObvRq3QDdWyUxOj+Y7JoAHo2WxezWKK1qoSN2N4zeJLfM6vXZjGKFT9XYpo4e5OEfzgSHOp5Q44Lf0sTEpfrzcVQdxGB0nHjwL1wuBPKdCu0aMiJLzqtNqEi8sF6ZCFRU3Ah2DiBmCHUbb54EqMc5kFagzVzYZshfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942319; c=relaxed/simple;
	bh=NIDWctcnMXHS00X5BSUXBlXTGA2u8Q+RfWHm0b2wvG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx5/lesRiA9W/P/rNv6X1StHp/eVFfQe48D6QvEUY/IFCMwwgJ9//7O5M/coNnSoE1QGlXzYLHeSizXwO2TMYnVxCSU4qsfUBVIKWoyUgfpZBwqLQl3KKeIkDguqorTV5dfblffWMLy+PSErmJn1g9zjM1fyph8uwYkj/fIiikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9+AtIrL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1171F00893;
	Mon,  8 Jun 2026 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780942317;
	bh=nXMkgjQY8cbSjj7UUHQBkhIgTYx0L9j6jxNKCSfRR/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N9+AtIrLVQpdc7MYuoue+QqGfo5pWl788/MHNHc6lOM1bD+gv64RDVH+TxAKvSbxd
	 YoNHx3+wVkZZyLTaOmcRplnw41gXKBAib1vmW94Y2TNA/2Tk+WIe0N4RwfUYliKrgx
	 7MaDHa/wyLC8WjeDldPVh1plY1PRvZgTmKK1b+Hyu9Z99LjNvEwXhldXxtbaDMyLwo
	 KQlOpSqNDbXH2EMqN+/mqB4b3XjF8F469+PJCReqy6MKcmWtMuOnC4u43FzetLriwU
	 4R+NN8OPZHpInZG0LaX0/Kzam7F1FkaEYSxSscKPwloEHf7GWBAlfBF1d1TDnIKYqW
	 pTC14H2pJewFA==
Date: Mon, 8 Jun 2026 21:11:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	jasonmiu@google.com, linux-kernel@vger.kernel.org, corbet@lwn.net,
	ran.xiaokai@zte.com.cn, kexec@lists.infradead.org,
	pratyush@kernel.org, graf@amazon.com, rppt@kernel.org
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
Message-ID: <aicF5Sa11B4ujfSa@kernel.org>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <178083348872.1648214.17778188633648887952.b4-review@b4>
 <aiVp5RlbWRz5VnPB@plex>
 <178091437240.1648214.10761111570005003901.b4-reply@b4>
 <aibYJvzQQnpoN6YW@plex>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aibYJvzQQnpoN6YW@plex>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91470-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jasonmiu@google.com,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:ran.xiaokai@zte.com.cn,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:graf@amazon.com,m:rppt@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6CBE659B3A

On Mon, Jun 08, 2026 at 04:12:56PM +0000, Pasha Tatashin wrote:
> On 06-08 13:26, Mike Rapoport wrote:
> > On 2026-06-07 13:43:09+00:00, Pasha Tatashin wrote:
>
> Keeping all of that in a single KHO file is the wrong approach and goes 
> against how other logically separated subsystems in Linux are organized 
> (e.g., mm/vmap.c, mm/vmalloc.c, etc.). Yes, there are some messier 
> places in the kernel as well, but keeping this in its own dedicated 
> kho_vmalloc.c file makes complete sense to me.

Either I hallucinated or b4 ate a paragraph from my reply ;)

Regarding the code movement
- splitting radix tree makes perfect sense to me, just the documentation
  part needs more care than mechanical move
- I'm fine with abi/vmalloc.h, presuming KHOSER_PTR() is not part of it
- I can live with kho_vmalloc.c although I still consider it unnecessary
  churn
- I'm against moving vmalloc APIs from kexec_handover.h because they are
  very close in nature to folio and pages. I don't see core KHO as
  responsible for preserving physically contiguous ranges but rather as
  preserving allocations. Not sure we'll ever support kmalloc(), but still.

> However, overall enforcing the use of KHOSER is unrelated to this work. 
> I have my own thoughts on this, and perhaps with proper versioning, 
> using KHOSER_PTR everywhere would be appropriate, but let's keep that as 
> a separate work.

This is a separate work, indeed. But regardless of the versioning it's
already better than plain u64 because it provides type safety.

> > Actually FDT "compatible" handles versioning nicer than composite strings
> > You can have
> > 
> > 	compatible="kho-v4", "vmalloc-v1", "radix-v1", "block-v2";
> > 
> > and check fdt_node_check_compatible("vmalloc-v1") for vmalloc and
> > fdt_node_check_compatible("block-v2") for block.
> 
> That is actually very similar to what I am proposing—individual version 
> tokens (which in my current series are concatenated into a composite 
> compatibility string separated by ';').

Yes, you reinvented the wheel :-P

The difference between FDT-compatible and the composite strings is that the
strings are all or nothing while FDT is "any of".
But that's only a side note, we're not going to use fdt-compatible.

> But let's not get too fixated on the composite string formatting. I 
> actually really like what you are proposing: using integers for versions 
> and having each registered component carry its own "NAME" and version 
> number in the KHO FDT.

Yeah, something like that.

> Pasha

-- 
Sincerely yours,
Mike.

