Return-Path: <linux-doc+bounces-77700-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NAeJ1jjpmnpYgAAu9opvQ
	(envelope-from <linux-doc+bounces-77700-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 14:34:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF91F0564
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 14:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 482043039834
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 13:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C167423ABBD;
	Tue,  3 Mar 2026 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAW/33zE"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6552253FC;
	Tue,  3 Mar 2026 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544806; cv=none; b=SPx28FU8w81bkMD8RC0rvdNbUwtrAfFTUS2mi3W1kdF5HlSCW87hxAyiGWohRSfGCOz+uuWurjstrrxKF3bdu8XxiD8ezErmNMXr6ysI6AOEICWBYs0E051NS7ynZr8VOH6b2ZVCPlY0L/I3NhdtureizYw965FsvUu5qfpmuDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544806; c=relaxed/simple;
	bh=XU1yAq8je+l65v1ey65oHCTpxi/VitYbxljWDsN9sqo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bo1Vc8jkwOkY6OnzUu0M9wfQkCpWJEclcLnU1Zq5IlZpcXhfNECi+1OOWb3DnHf2s2D0/O4lVOFpsGLv2EOqLoJB8FMWfrnHils5PNtTtmrmn4oPQyu1XM9pSZ/ucHfavmLB2LKL9BxRz9lTuwYler7h1LfNSUa+epaZWiYHcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAW/33zE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADADEC116C6;
	Tue,  3 Mar 2026 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772544806;
	bh=XU1yAq8je+l65v1ey65oHCTpxi/VitYbxljWDsN9sqo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HAW/33zEuPnwrxIOyVsAKcsMvRiSvW8izk4GgeTI/9w3XVYqEPccJoXFPBj9lkXG2
	 e8zVJ4Nss03qRIVZ4zWyHJym+gK43tP8THmQd+Fj2o80J4aE7W4OP5625m5r1Y7HeE
	 NNYPiXIgIhfNUPJFRbhGALRKQGGa6oY57zFqHUJ92pV7Pct9XRbCwj5jT5LmC/iGy3
	 etFpZD+Jo7h8JLxsWQ2OBgYKIckADVz78A6eQEnBQv9t/MrOZXGtvuL/FsQZCjhfjz
	 RsnmyKHJ73WwIwmKZLSaU0ciN2p1KMtXGHZjndHrpp30PdPd82mJ9t80aKcVNwpwjJ
	 ZkcSb7ffq6yeg==
Message-ID: <500ba707-53c9-4037-86e2-973c71ca3d41@kernel.org>
Date: Tue, 3 Mar 2026 14:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: Re: [PATCH v1] kasan: docs: SLUB is the only remaining slab
 implementation
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260303120416.62580-1-david@kernel.org>
In-Reply-To: <20260303120416.62580-1-david@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E8EF91F0564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77700-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[googlegroups.com,vger.kernel.org,linux-foundation.org,gmail.com,google.com,arm.com,lwn.net,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:email,linux-foundation.org:email]
X-Rspamd-Action: no action

On 3/3/26 13:04, David Hildenbrand (Arm) wrote:
> We have only the SLUB implementation left in the kernel (referred to
> as "slab"). Therefore, there is nothing special regarding KASAN modes
> when it comes to the slab allocator anymore.

Right, thanks.

> Drop the stale comment regarding differing SLUB vs. SLAB support.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  Documentation/dev-tools/kasan.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..4968b2aa60c8 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -75,9 +75,6 @@ Software Tag-Based KASAN supports slab, page_alloc, vmalloc, and stack memory.
>  Hardware Tag-Based KASAN supports slab, page_alloc, and non-executable vmalloc
>  memory.
>  
> -For slab, both software KASAN modes support SLUB and SLAB allocators, while
> -Hardware Tag-Based KASAN only supports SLUB.
> -
>  Usage
>  -----
>  


