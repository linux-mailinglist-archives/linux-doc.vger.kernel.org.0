Return-Path: <linux-doc+bounces-38997-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E980BA400C5
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 21:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D415D7B016D
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 20:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2458B253B47;
	Fri, 21 Feb 2025 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3qBOCb2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C23625333A;
	Fri, 21 Feb 2025 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169569; cv=none; b=frk39f2KqtB+/0/Pe5UU1cOFn0tyryUafU7HT8cOeE47nuan6ujD1fpkybp83hhSZ8qQWg1T0/VRI9Jt4S24Fq5ItAXeEwNVcbjW2sEKITK/GHx5ezqdNT7RrgTUTulxfVdDNHtbWYdY4yCLMpwzCQcXtzxrQLIWNl/oBQ7FBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169569; c=relaxed/simple;
	bh=7HlkPlv9RaA45j5wq1XrEU1jlnPDHZG/VbqOejfstqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNNDDAluuK2T4BFM9XwLQDnCIJW0N8uVO5k8fOlZ0RoPTmAaW2rATdXgE+pRg7zpI+ikzU/r8e7/m9qK4Gx2Vk4WItqqhbxb8KJUSXzWU8P3kWIkN6VvTeGISrejUIwsYK1JAiGcs8WTxqTU+zkmJ2TqH5wAnKC/53bFCioWymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3qBOCb2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740169567; x=1771705567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7HlkPlv9RaA45j5wq1XrEU1jlnPDHZG/VbqOejfstqk=;
  b=W3qBOCb2MIy9zECofuDzM+S7PsI42wzeU6BO0Q+jyvrYXct2GxcRg02d
   0bZZuHhnlaeISr2eDqDyts6sNWzmZAilsa7TzsmsUzVSIk4VSiA4pOWSp
   4kJUMx56cM5BmDnI/NP1iPvxMyc7byGu2h8kCsyJU4Omg93Hjb1jr8xyq
   RqJFQQksHtyIFC57OSVI07Q/1LPOs9Qc7kszF9Lqy7L8zwna0kxWAWq/H
   H5TaJ4OMFw8TCoqooYmukS2XTSTEyw3u3YI34e4IJYHbac18mOVNwl2QL
   VwFT097CNYA3xekshIQrBtt/XVYgA8bEohrFBmRU9EZg+xaHTTWaTWa4K
   w==;
X-CSE-ConnectionGUID: O7OC7iedTH2yzDWhv1Gjpg==
X-CSE-MsgGUID: 7yM2n2l2SJWfMLqlM+DVIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41264384"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41264384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:26:06 -0800
X-CSE-ConnectionGUID: 8DTLyFp1Tb6qPxlmd/pqwA==
X-CSE-MsgGUID: Kj59BScTSAaTFhqhmO42zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="146309571"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:25:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlZar-0000000DjzO-2hnW;
	Fri, 21 Feb 2025 22:25:53 +0200
Date: Fri, 21 Feb 2025 22:25:53 +0200
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
Subject: Re: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z7jhUb0J0yaM_ROI@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
 <6623056D-2107-48FB-B18D-2DB90D8F78A2@live.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6623056D-2107-48FB-B18D-2DB90D8F78A2@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 05:21:08PM +0000, Aditya Garg wrote:
> > On 21 Feb 2025, at 9:21 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Fri, Feb 21, 2025 at 11:36:00AM +0000, Aditya Garg wrote:

...

> >> + for (x = 0; x < pixels; x++) {
> >> + pix = le32_to_cpu(sbuf32[x]);
> >> + /* write red-green-blue to output in little endianness */
> >> + *dbuf8++ = (pix & 0x00ff0000) >> 16;
> >> + *dbuf8++ = (pix & 0x0000ff00) >> 8;
> >> + *dbuf8++ = (pix & 0x000000ff) >> 0;
> > 
> > put_unaligned_be24()

(1)

> >> + }

...

> >> + static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> >> + 3,
> >> + };
> > 
> > One line?
> > 
> > static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = { 3 };
> 
> Wrt all the above respective changes, the formatting has been done exactly like what other emulation helps do in the upstream patch.
> 
> I doubt Thomas would want these changes to be done, or would want these changes to be done for the upstream emulation helpers as well.
> 
> For reference: https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_format_helper.c

I'm not sure how this is applicable to (1) above. Otherwise it's fine if there
is a documented style or due to consistency with the existing style.

-- 
With Best Regards,
Andy Shevchenko



