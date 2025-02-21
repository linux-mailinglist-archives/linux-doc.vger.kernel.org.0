Return-Path: <linux-doc+bounces-39006-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01DA40142
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 21:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B863B8B66
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7A8200121;
	Fri, 21 Feb 2025 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONeIxLb+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498411DC985;
	Fri, 21 Feb 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740170569; cv=none; b=HolJ8G2OqIGFFddV/QYjvAPvHJJVx7f3RBlcgj1VX6PnkKevXtKOLncDsP2Q1mRR+jCA65mzkWvKGShQOAcwDAbw33+OgvVtZ3UtoQznIrlk5AZBjSFCHQWm7LoTwdUbB3UwzDfhC16Zx8EzjlDjFiIayM27Acy2aJgmpQD5tyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740170569; c=relaxed/simple;
	bh=WDe+to5rRRq7lsLv9P59RikBY/hODwqoknD2e2l+CDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArvN0S6tsm0mw1p5pfPCYXN1+UHMkgh/Kv6n5tQZnMj3LxNRsVYKjM/rttuwu7qB/PIoRhxONEQVK2qAzizaCdLIl3/sxMCedT3ITsI84RnARign2RmWkpmq0j1otDlFetnKB/VVzZHqdeYEvdj22SaLbloaiv+Tqig+W+GYfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONeIxLb+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740170567; x=1771706567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WDe+to5rRRq7lsLv9P59RikBY/hODwqoknD2e2l+CDo=;
  b=ONeIxLb+QY68H/f+MVNnKKc1+ghZHbxI9aTiv4ql71iT3tacqrX371OI
   c/DYt9B0utm5iF3Xgn4/RH3KPxBNiQKkdO6mkvFpZyIU9894tssztSLqJ
   V0kyXq+T3+JGWIWfKq+eXOQxbBQWwuSqLMfpgG+O54Fmm5zIJ/mzGdEQA
   wmRpztoXqlhLNoqBpOUJcqcDobKR87vf5sowUz3e+avIxfx1SGrItOUPP
   mogNqScPpVEcGkfVNBoMkC1S32agJyfowFJtHVkTJP8B+zR4stWoA3vyB
   rCGK+O+mRgaac9fdnhlGwTNp9+o5f/WATZ1E+EyTG1T+xrmri5D1Qum8J
   g==;
X-CSE-ConnectionGUID: BrKZ3BCATom6HTFo9aIJJA==
X-CSE-MsgGUID: 41NCCJEMTYav/cZS10ks7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40922583"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40922583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:42:47 -0800
X-CSE-ConnectionGUID: zC+uNe1dTIO9JBrdJOTyTw==
X-CSE-MsgGUID: swnSrLXlTzum+CJRrwvp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115308379"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:42:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlZr0-0000000DkDP-0Fwy;
	Fri, 21 Feb 2025 22:42:34 +0200
Date: Fri, 21 Feb 2025 22:42:33 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 07:13:06PM +0000, Aditya Garg wrote:
> > On Fri, Feb 21, 2025 at 11:37:57AM +0000, Aditya Garg wrote:

...

> >> +} __packed;
> > 
> > Why __packed? Please explain and justify for all the data types that are marked
> > with this attribute.
> 
> Just following the original Windows driver here (#pragma pack) :
> 
> https://github.com/imbushuo/DFRDisplayKm/blob/master/src/DFRDisplayKm/include/DFRHostIo.h
> 
> IMO these structures are used for communication with the Touch Bar over USB.
> The hardware expects a very specific layout for the data it receives and
> sends. If the compiler were to insert padding for alignment, it would break
> the communication protocol because the fields would not be in the expected
> positions.

What padding, please? Why TCP UAPI headers do not have these attributes?
Think about it, and think about what actually __packed does and how it affects
(badly) the code generation. Otherwise it looks like a cargo cult.

> I tried removing __packed btw and driver no longer works.

So, you need to find a justification why. But definitely not due to padding in
many of them. They can go without __packed as they are naturally aligned.

...

> >> + if (response->msg == APPLETBDRM_MSG_SIGNAL_READINESS) {
> >> + if (!readiness_signal_received) {
> >> + readiness_signal_received = true;
> >> + goto retry;
> >> + }
> >> +
> >> + drm_err(drm, "Encountered unexpected readiness signal\n");
> >> + return -EIO;
> >> + }
> >> +
> >> + if (actual_size != size) {
> >> + drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> >> + actual_size, size);
> >> + return -EIO;
> >> + }
> >> +
> >> + if (response->msg != expected_response) {
> >> + drm_err(drm, "Unexpected response from device (expected %p4ch found %p4ch)\n",
> >> + &expected_response, &response->msg);
> >> + return -EIO;
> > 
> > For three different cases the same error code, can it be adjusted more to the
> > situation?
> 
> All these are I/O errors, you got any suggestion?

Your email client mangled the code so badly that it's hard to read. But I would
suggest to use -EINTR in the first case, and -EBADMSG. But also you may consider
-EPROTO.

> >> + }

...

> >> + if (ret)
> >> + return ret;
> > 
> >> + else if (!new_plane_state->visible)
> > 
> > Why 'else'? It's redundant.
> 
> I’ve just followed what other drm drivers are doing here:
> 
> https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/tiny/bochs.c#L436
> https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/tiny/cirrus.c#L363
> 
> And plenty more

A bad example is still a bad example. 'else' is simply redundant in this
case and add a noisy to the code.

> I won’t mind removing else. You want that?

Sure.

...

> >> + request_size = ALIGN(sizeof(struct appletbdrm_fb_request) +
> >> +        frames_size +
> >> +        sizeof(struct appletbdrm_fb_request_footer), 16);
> > 
> > Missing header for ALIGN().
> > 
> > But have you checked overflow.h for the possibility of using some helper macros
> > from there? This is what should be usually done for k*alloc() in the kernel.
> 
> I don’t really think we need a macro here.

Hmm... is frames_size known to be in a guaranteed range to make sure no
potential overflow happens?

> >> + appletbdrm_state->request = kzalloc(request_size, GFP_KERNEL);
> >> +
> >> + if (!appletbdrm_state->request)
> >> + return -ENOMEM;

...

> >> + request->msg_id = timestamp & 0xff;
> > 
> > Why ' & 0xff'?
> 
> https://github.com/imbushuo/DFRDisplayKm/blob/master/src/DFRDisplayKm/DfrDisplay.c#L147

This is not an answer.
Why do you need this here? Isn't the type of msg_id enough?

...

> >> + adev->mode = (struct drm_display_mode) {
> > 
> > Why do you need a compound literal here? Perhaps you want to have that to be
> > done directly in DRM_MODE_INIT()?
> 
> I really don’t find this as an issue. You want me to declare another structure, basically this?:

Nope, I'm asking if the DRM_MODE_INIT() is done in a way that it only can be
used for the static data. Seems like the case. Have you tried to convert
DRM_MODE_INIT() to be always a compound literal? Does it break things?

> struct drm_display_mode mode = {
> DRM_MODE_INIT(60, adev->height, adev->width,
> DRM_MODE_RES_MM(adev->height, 218),
> DRM_MODE_RES_MM(adev->width, 218))
> };
> adev->mode = mode;
> 
> >> + DRM_MODE_INIT(60, adev->height, adev->width,
> >> +       DRM_MODE_RES_MM(adev->height, 218),
> >> +       DRM_MODE_RES_MM(adev->width, 218))
> >> + };

-- 
With Best Regards,
Andy Shevchenko



