Return-Path: <linux-doc+bounces-93025-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9AU0IKy+N2rpRQcAu9opvQ
	(envelope-from <linux-doc+bounces-93025-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 12:36:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3896AA983
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 12:36:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bVtQJTae;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93025-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93025-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91C9C300A132
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 10:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAA8157A5A;
	Sun, 21 Jun 2026 10:36:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B974BE1;
	Sun, 21 Jun 2026 10:36:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782038185; cv=none; b=LJ+SI/rJaqyaL1Ngc4YUmJD3+1MPj0c3UI8adNoxtksHpdHquZAyiLqubBUfAnlG76Ag4xsgdeq1EM94x2QWbIcB6tMQ8ghiDfSFxPsOBN2aM2u0p9VZBNpWbONnFHl7eEEVcLYZOhKGV32T0QxwHOXid0EdI3cOBUYBaOe2ZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782038185; c=relaxed/simple;
	bh=ucrVZaFHV9P8rrX121ECboKE36C33WJ/6ZialGNhCW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9SkZJJ7O57Q++NbAj1DGrUW9Jbs+MfM3umqv+aGAhvwtT8KSvf/wW9b3KBT7E4DtLOayUzL1YumpH7r0TyoExiAU/hMcr0HAH5AuEn9ErG9PscpZtCLdvHspuuQvRrztRv7pSC02OqRklpGFDF1ie2QOk0qypUch8AgGcrf4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVtQJTae; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3726C1F000E9;
	Sun, 21 Jun 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782038183;
	bh=u7n88puASKdRn7LSLUIyKwIUjfNUuhlCupcWE32IiKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bVtQJTaeCkbJtYPLyIXvXF62RPr79fPksVMk14M0zYNX96o6mnHvZFPA0hibhxeHo
	 eEysclkiI4gdSzS6seo2lZ1GnN0cHxD0OLsUdJs+8fu5GWUOojKTc7iVwSQNWxCLkz
	 NeJujBZLVSZmSKqPiolja65PdQe2IWZ9KbYqagJW6TagyYy5DsGI/Dfcn4WqhlCDBK
	 NdACIAkSoyfexQTpPgAhSe9jb0ppgaxsnx0VTxOTB9EkT7naGOqv87ArIiEGUexrqE
	 J+MmMWHcvyWBIENEIWGKWU6/aNbV03JUxv6U5v3cXrfQpAfileqR5zL3eFY2k3lm9C
	 Ap825Q6Z+dW5w==
Date: Sun, 21 Jun 2026 13:36:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <aje-nY6QbwZP9XLG@kernel.org>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93025-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shyamsaini@linux.microsoft.com,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:tgopinath@linux.microsoft.com,m:bboscaccy@linux.microsoft.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,linux-foundation.org,linux.microsoft.com,kernel.org,intel.com,igalia.com,alien8.de,infradead.org,linux.alibaba.com,linux.intel.com,google.com,gmail.com,baidu.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB3896AA983

On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> reserve_mem relies on dynamic memory allocation, this limits the
> usecase where memory is required to be preserved across the boots.
> Eg: ramoops memory reservation on ACPI platforms
>
> So add support to pass a pre-determined static address and reserve
> memory at a specified location. This enables use case like ramoops
> on ACPI platforms to reliably access ramoops region with previous
> boot logs.
> 
> Also skip the parsing of <align> when static address is passed.
> 
> Example syntax for static address
>  reserve_mem=4M@0x1E0000000:oops

reserve_mem is best effort by design because such hacks as well as memmap=
cannot guarantee this memory is actually free.

If you want to preserve ramoops reliably, use KHO with reserve_mem.
The first kernel will allocate memory, this memory will be preserved by KHO
and could be picked up by the second kernel.
 
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
> v1: https://lore.kernel.org/lkml/0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org/
> v2: Fix code logic and incorporate Randy's suggestion
> ---
>  .../admin-guide/kernel-parameters.txt         | 15 ++++++
>  mm/memblock.c                                 | 47 +++++++++++++------
>  2 files changed, 47 insertions(+), 15 deletions(-)

-- 
Sincerely yours,
Mike.

