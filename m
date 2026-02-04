Return-Path: <linux-doc+bounces-75192-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDbzHzHSgmk+cQMAu9opvQ
	(envelope-from <linux-doc+bounces-75192-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 05:59:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83543E1A1A
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 05:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 068573021E9B
	for <lists+linux-doc@lfdr.de>; Wed,  4 Feb 2026 04:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76A7350290;
	Wed,  4 Feb 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJnhLH17"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4602D5937;
	Wed,  4 Feb 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770181165; cv=none; b=O7t1F2WFo3yAaQCxVash4MANBpdWLoyl72CZJuNqO9jAtZbndWHN3sBW+LuohSp3X4og3GJMAfXrrJriTdfQh875uQQ2CkbdgJY3IbvIK03Fe6I6O4eMljVVhba5NSEYGM1++IGTICdEIBn8ox6nmoFELCpBQmCaZJzGD/t8LEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770181165; c=relaxed/simple;
	bh=ZcHcE6kB/+b7McqHMDB9jyD4/5PBEa4jHK0yq+pe4dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXWoKr9CdwyAMn76bBkkvMKwqleODp2n9kTj9hlN+wzfA7w2IfJbRbwHxSy5JlOQ9DBeqmkSh5hgHYly584SJ2WLMbIAE6wfLQQ5C8kF408k4AFsranKk7vgMdcJzyuZLLCN0U2e9ipjCgv7e/3XK2wRFBrcymPTk3thn4iOATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJnhLH17; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770181165; x=1801717165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZcHcE6kB/+b7McqHMDB9jyD4/5PBEa4jHK0yq+pe4dw=;
  b=LJnhLH17vGWBaDuBqNaCsH7ixOJalXOOoJc1Mw897381D/LjnX4kI1yt
   WI6cvixLE30vy+owGqBtaP0amNI+5d8Ile2g+Il2pCsBUDIcpCWVNOfyp
   17JBJkvmh4k9T12w9m18IU62aHYyUu9ih6e5Kmd+TlPsTuBz55BGXYxmK
   HgPc7cUYlCgVl2g3T/qLYWCFNIQdpKZmAtX012eoUzCDcxlP55xPuVU59
   PgCP8i/OM2R8ThDPQJ6XtXNqbrMv/iZATE8hmFavOhYnfWeAtkbS8n7YH
   u7D6lUagWkIZpy1h5SqDxJdzdznWXEXYwUP/+5wDWwnSrRi/Q2Al47Hcq
   w==;
X-CSE-ConnectionGUID: f8mcvgqfSpyZ1277WD84UQ==
X-CSE-MsgGUID: FdpejouUSxqgW1O6Tkarhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71398179"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71398179"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 20:59:25 -0800
X-CSE-ConnectionGUID: MP8aOlHyS36mxUhxUTjNKg==
X-CSE-MsgGUID: 9ceOWaPnRNid8VhJvnBQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247656131"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 20:59:24 -0800
Date: Tue, 3 Feb 2026 21:05:29 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	nh-open-source@amazon.com,
	Nicolas Saenz Julienne <nsaenz@amazon.es>,
	Hendrik Borghorst <hborghor@amazon.de>,
	Filippo Sironi <sironi@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Jan =?iso-8859-1?Q?Sch=F6nherr?= <jschoenh@amazon.de>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
Message-ID: <20260204050529.GB31059@ranerica-svr.sc.intel.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com>
 <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com>
 <878qd94zjo.ffs@tglx>
 <20260203194429.GA30254@ranerica-svr.sc.intel.com>
 <87cy2l363t.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy2l363t.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-75192-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardo.neri-calderon@linux.intel.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ranerica-svr.sc.intel.com:mid]
X-Rspamd-Queue-Id: 83543E1A1A
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:49:26PM +0100, Thomas Gleixner wrote:
> On Tue, Feb 03 2026 at 11:44, Ricardo Neri wrote:
> > On Tue, Feb 03, 2026 at 04:28:11PM +0100, Thomas Gleixner wrote:
> >> I don't remember. That thing clearly fell through the cracks.
> >
> > My impression at the time was that the buddy hardlockup detector met the
> > goal of freeing the PMU counter and there was little interest on using the
> > HPET.
> >
> >> Let me find it again and reply to that.
> >
> > Does this mean that there is renewed interest for this?
> 
> It seems Alex is interrested and the code minus the rejects and my
> todays suggestion looks palatable.

Great! I will update the series and post a new version.
> 
> 

