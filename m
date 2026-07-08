Return-Path: <linux-doc+bounces-95674-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TKm6I8YfTmq1DgIAu9opvQ
	(envelope-from <linux-doc+bounces-95674-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 12:00:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAF723F71
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 12:00:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=K2QzZNWS;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95674-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95674-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EB1C300AB28
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 10:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674C638757B;
	Wed,  8 Jul 2026 10:00:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55DD384CC2;
	Wed,  8 Jul 2026 10:00:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504835; cv=none; b=AW0kt4LF6uw3EYQWJUhhOXe1WaEjVfSoCyuOZccD0Inrx14IP8kuROfo1kSOCgtt9pSTwtGlhO97KI6yZPQYSawhOJbEU4TNJ1nFyo4x3Mxn9L8oSsenp8I5nyEE2EzrjQCSO/4GKRiw6yzDAXCt0jwxkDHaLTQWQi6p6XioV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504835; c=relaxed/simple;
	bh=8oFU73UDNb1/JzzX/59Hz8/SUvhrGo6jInm1l2EOvkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SC5yzpSvK+qioOC/ZeUDXoB2yw9xxs6s9n7xuNKHvxQZbu1v9OHI8sJKa8fT88LErKD0Wv7SqF8UGnPqpPfMPvEmoukrMeUcc70wKyQucY2LtyHypMQa/u2IpIeSOZ5LNTHmeFtnZtmZIyP6FJ9MkTk5Oq4SEjUYmxIT3zmAEqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K2QzZNWS; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75871E5E;
	Wed,  8 Jul 2026 03:00:28 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31A4B3F85F;
	Wed,  8 Jul 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783504833; bh=8oFU73UDNb1/JzzX/59Hz8/SUvhrGo6jInm1l2EOvkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K2QzZNWS5qvtc90qr2P/bmEBxGozBIkajd4g2BYgXL6Gp07XfQg2fDAaRimBjytR3
	 AnMyVUC1k+1MwDKxSrlcekXCA+Xo6jxwuhPGUKvb9LNjSYAl8jWKoOD6L8rj1fhHUR
	 MBLQpicTg0GtL6aQ3jsYy8mAbKKMKwErUf1HScIM=
Date: Wed, 8 Jul 2026 11:00:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, bboscaccy@linux.microsoft.com,
	bp@alien8.de, dapeng1.mi@linux.intel.com, ebiggers@kernel.org,
	elver@google.com, enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com, gpiccoli@igalia.com, kees@kernel.org,
	kuba@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lirongqing@baidu.com, peterz@infradead.org, rdunlap@infradead.org,
	tgopinath@linux.microsoft.com, tony.luck@intel.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ak4fu1qINGyAQUEl@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95674-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,linux-foundation.org,linux.microsoft.com,alien8.de,linux.intel.com,google.com,gmail.com,linux.alibaba.com,igalia.com,vger.kernel.org,kvack.org,baidu.com,infradead.org,intel.com,huawei.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:shyamsaini@linux.microsoft.com,m:rppt@kernel.org,m:ardb@kernel.org,m:david@kernel.org,m:will@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:akpm@linux-foundation.org,m:bboscaccy@linux.microsoft.com,m:bp@alien8.de,m:dapeng1.mi@linux.intel.com,m:ebiggers@kernel.org,m:elver@google.com,m:enelsonmoore@gmail.com,m:feng.tang@linux.alibaba.com,m:gpiccoli@igalia.com,m:kees@kernel.org,m:kuba@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lirongqing@baidu.com,m:peterz@infradead.org,m:rdunlap@infradead.org,m:tgopinath@linux.microsoft.com,m:tony.luck@intel.com,m:lpieralisi@kernel.org,m:guohanjun@huawei.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:dkim,arm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5FAF723F71

Hi Shyam,

Adding Lorenzo, Hanjun, Sudeep.

On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> Following up on this, As Mike pointed that reserve_mem is best effort
> reservation mechanism, so what is the recommended reliable Linux
> mechanism, if any, to reserve a predetermined memory range during
> early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> one option, but I'm specifically looking for a solution that preserves
> the region across warm reboots.

If you need ramoops-like support, I think ACPI ERST is a better fit and
we don't need any memory reservation tricks. I'll let the arm ACPI
maintainers comment further.

-- 
Catalin

