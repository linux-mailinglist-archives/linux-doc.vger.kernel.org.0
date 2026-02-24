Return-Path: <linux-doc+bounces-76806-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG7uD528nWklRgQAu9opvQ
	(envelope-from <linux-doc+bounces-76806-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:58:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB5188C08
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C7A33124CE0
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 14:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8430039E6FB;
	Tue, 24 Feb 2026 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTls2qVM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8553A0B1C;
	Tue, 24 Feb 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944950; cv=none; b=qcPUQoDD2bKyuS5/ZV7E3sZtQl0Sqtn7v+9d2xXaAqTGvUjZ90hbFR4Ywmt09GyV2WEGLekhsMFl0n6PUqMbJQIFzTLf2DZFA/P4214gOfvyQ6+xRz+kurffO/ZkoNQ7XdfGhfAqiSNMJyxZzmyJwSzEjIZPfRgCoVznbq2jiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944950; c=relaxed/simple;
	bh=lJxKAL5qDs58zhihPwhQBrlGFIUHljD85OEAlW0Ihd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtxV0a2ux6c+1uAMoeLrolUQEbl/+4wVZdYZDCz6LADpclo6gnfyPvru/ketmXFc7OJQhmHxyxobyRm+u5iz3B5mxhKg3YNv4c4t4ifIYVIodWYfb+AbA12e9PpRNIfwW/DVJsjInwN5YOGPiXGwPIZolLgFFlb1Tvq5az8KJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTls2qVM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771944949; x=1803480949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lJxKAL5qDs58zhihPwhQBrlGFIUHljD85OEAlW0Ihd8=;
  b=cTls2qVMyvn88oi0t3lFa0cwwff6QfFa4zFlnzJa7J19MJg5mmGRKrNN
   hKNWLwaUs1hjDx/NR/WkyRBcgOhpi6YGTShEgMhGcrO/nQajFtrq4YeY9
   +XWyHNMkv/oF/EvRmWWougTPPJWfiiyX5e8gN0VWdFrvVA4zgD2snzEUp
   qw0SvWEqj7H5TjcBAE33Z6JgAeEaJRV7lEJS7m7ayvR0Jl8uwHCFUZA2X
   /jczYkbdLxw7Degct8BHS0WG7RtBeDhNl6KodE2LlFv2zitmZg0k3cwYw
   wIioaGaZG3cVabcaRmE3XccphnAnirmMz38nIqYyCq7ygTHZFRwVW7lrO
   w==;
X-CSE-ConnectionGUID: mgG4PBSLSpGA88zT70p3LA==
X-CSE-MsgGUID: 11S/OXu/TZ6n2oIUIm34Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="75567203"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="75567203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:55:48 -0800
X-CSE-ConnectionGUID: 7xxagAQfTXu9npeUBF3g+Q==
X-CSE-MsgGUID: UgcPexU/S3elkvHICdPJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215797251"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:55:45 -0800
Date: Tue, 24 Feb 2026 16:55:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Taha Ed-Dafili <0rayn.dev@gmail.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	rdunlap@infradead.org, skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com, andy@kernel.org, corbet@lwn.net,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] iio: accel: adxl345: Expose IIO_EV_INFO_VALUE for
 double tap
Message-ID: <aZ277iG58m-KGbI3@smile.fi.intel.com>
References: <20260224140351.27288-1-0rayn.dev@gmail.com>
 <20260224140351.27288-4-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224140351.27288-4-0rayn.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76806-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: B4EB5188C08
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:03:46PM +0000, Taha Ed-Dafili wrote:
> The ADXL345 uses a single hardware register (ADXL345_REG_THRESH_TAP) to
> store the threshold for both single tap and double tap events.
> 
> Currently, the driver only exposes the IIO_EV_INFO_VALUE attribute for
> the single tap event.
> 
> However, the IIO ABI dictates that if an event is supported, its
> associated configuration attributes should be exposed to userspace. This
> applies even if writing to one channel property alters the value of
> another due to shared underlying hardware state.
> 
> Add IIO_EV_INFO_VALUE to the double tap event specification to ensure
> full ABI compliance.

...

> -			BIT(IIO_EV_INFO_RESET_TIMEOUT) |

> +			BIT(IIO_EV_INFO_RESET_TIMEOUT)	|

I do not see a reason why the amount of spaces should be increased.
The original one space is a gold standard in such cases as it makes
independent on the line length. With the formatted | it becomes a
burden for maintenance: each time one adds longer line, all lines
need to be adjusted for no good reason.


-- 
With Best Regards,
Andy Shevchenko



