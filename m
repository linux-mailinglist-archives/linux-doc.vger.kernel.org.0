Return-Path: <linux-doc+bounces-95923-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j4cWC5l3T2oOhQIAu9opvQ
	(envelope-from <linux-doc+bounces-95923-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 12:27:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F3E72F946
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 12:27:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DTci9JOW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95923-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95923-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB56B305DBD7
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 10:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BD33F23D0;
	Thu,  9 Jul 2026 10:26:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E0A401A13;
	Thu,  9 Jul 2026 10:26:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592776; cv=none; b=DQQh47EACezCzAwWUxDECoyC8Y/YP1G4gQm4TPnjgnuVh3UzUMO3cOKwY21QEu8OU+MHbQzemZg1sv+4aYaZcJPPOdBFZaB0l5v5MDu8l2Sx1tTGVEU6IH1T/cDeQj3lxiFdn2XHoPm9d83Gx9JpQyxnVtjmM9O+p0MFVKqEIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592776; c=relaxed/simple;
	bh=5HjcXSURjY/ODwJG9TdR5EZq9MDPqVY6MvHd7UOAfrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP98fGMbRLXpyGNSj3BwjmYF7PZ7xAyT3ucvrGUxHekqZqXLJsiu0wOQTDsYEInYKy5VQonn1DG6CD/lFgosk27ZyOt9L/WQa5Fcrly7fUSI29S3Lmbt59CmVuvfKyXSjeJkWYru4M3/hffC+vsSvqnuPcbYS/m8Y3TNxIawCQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTci9JOW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ADD1F00A3A;
	Thu,  9 Jul 2026 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783592775;
	bh=TPdVHdBqE78Tyd4PBWnjxJl0mWtpdEwQn28B3/SGb/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DTci9JOWIGHKfBoQb3CBfSV1SkaFony1B9cQxR/582XmSaBE0WcAVXehCunpqUihN
	 FcSL9fchO9EriU8hNo2GAlseP1MoOnrrdV/AyxTRDEq1Ol5ptedub8IwkszrzuqoEY
	 swWIWr9i1t5L/RQDig18MQO15ZxE+C2JBWaEWTU4bG25OzyCJ51zbowDDHd3UFF5XE
	 f3PMBjDE+iF6kT+TtVb99M0QRkFKJaZDrOEDpLo7xKZuZMAIMY60GLDzL1TodfoyH4
	 Wv9HTOujAGR4LZKtOqXySgP/XHA8H65aLq/KqyUT0ASQ0/EqW7VhIL1rPzLeQcwxQS
	 uTq86OLThc6Rg==
Date: Thu, 9 Jul 2026 11:26:08 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
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
	Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <20260709-educational-nimble-seagull-5fc031@sudeepholla>
References: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
 <ak4fu1qINGyAQUEl@arm.com>
 <ak7tTVs6tWZPOln0@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak7tTVs6tWZPOln0@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shyamsaini@linux.microsoft.com,m:catalin.marinas@arm.com,m:sudeep.holla@kernel.org,m:rppt@kernel.org,m:ardb@kernel.org,m:david@kernel.org,m:will@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:akpm@linux-foundation.org,m:bboscaccy@linux.microsoft.com,m:bp@alien8.de,m:dapeng1.mi@linux.intel.com,m:ebiggers@kernel.org,m:elver@google.com,m:enelsonmoore@gmail.com,m:feng.tang@linux.alibaba.com,m:gpiccoli@igalia.com,m:kees@kernel.org,m:kuba@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lirongqing@baidu.com,m:peterz@infradead.org,m:rdunlap@infradead.org,m:tgopinath@linux.microsoft.com,m:tony.luck@intel.com,m:lpieralisi@kernel.org,m:guohanjun@huawei.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95923-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,lists.infradead.org,linux-foundation.org,linux.microsoft.com,alien8.de,linux.intel.com,google.com,gmail.com,linux.alibaba.com,igalia.com,vger.kernel.org,kvack.org,baidu.com,infradead.org,intel.com,huawei.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sudeepholla:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3F3E72F946

On Wed, Jul 08, 2026 at 05:37:33PM -0700, Shyam Saini wrote:
> Hi Catalin,
> 
> On 08 Jul 2026 11:00, Catalin Marinas wrote:
> > Hi Shyam,
> > 
> > Adding Lorenzo, Hanjun, Sudeep.
> > 
> > On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> > > Following up on this, As Mike pointed that reserve_mem is best effort
> > > reservation mechanism, so what is the recommended reliable Linux
> > > mechanism, if any, to reserve a predetermined memory range during
> > > early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> > > one option, but I'm specifically looking for a solution that preserves
> > > the region across warm reboots.
> > 
> > If you need ramoops-like support, I think ACPI ERST is a better fit and
> > we don't need any memory reservation tricks. I'll let the arm ACPI
> > maintainers comment further.
> > 
> 
> while this patch mentions use case of ramoops, there are other uses cases that
> requires predetermined memory reservation at boot time, one of them is PMEM.
> Like Mike pointed out in this [1] thread, we don't seem to have an
> equivalent mechanism for reserving predetermined memory on ARM/ACPI
> platforms, as is available on ARM/DTS based platforms.
> 

Indeed, it was been discussed in several forums in the past but AFAIK there
is no conclusion or a direction towards solving this yet.

-- 
Regards,
Sudeep

