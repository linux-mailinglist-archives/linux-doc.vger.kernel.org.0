Return-Path: <linux-doc+bounces-3763-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A10800DCF
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 16:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767CE1C208F1
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 15:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474EC3E470;
	Fri,  1 Dec 2023 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INnYnJKm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B03103;
	Fri,  1 Dec 2023 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701442842; x=1732978842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=neT4Hf+obtBf9p4YDRJKGw0EfyhXIRhgDs2UETBnJqQ=;
  b=INnYnJKm+BeQAPAH7r9tp2z+Zqf4AhauGp0G4hIHrUUkzLLHEEP+Rcjz
   l7e641NACodlCHACgg8hPK/3ZSlpFTP9UHAvmjj/pVI/OkDWM9R3FBQH4
   nJd1PVqkjCkfBnlH9xu3saPu+3xqX6Yx4jvRbl1mQI9nDaBNl8KTghWrn
   awF+lqYq4p+HnkgmZK2LpTWcZQCaEMfbEqWpKrRcMydVoJVQEdPUrscWT
   zM/+kYmrD16LMcNC5nGBhXDrCbSY+UQKflrtCudr6oLohWtNMzIZjA8vr
   8qGK0tNmpb8jYWQq6Nd7x18zi+uCPqGRypImcsNgSDFyjsi0icpiVDEan
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="383903036"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="383903036"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="763166038"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="763166038"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga007.jf.intel.com with SMTP; 01 Dec 2023 07:00:33 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 01 Dec 2023 17:00:32 +0200
Date: Fri, 1 Dec 2023 17:00:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
	Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Pekka Paalanen <ppaalanen@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, kernel-dev@igalia.com,
	alexander.deucher@amd.com, christian.koenig@amd.com
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <ZWn1EC04wBSN9hu2@intel.com>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231130200740.53454-1-andrealmeid@igalia.com>
X-Patchwork-Hint: comment

On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr� Almeida wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
> 
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Andr� Almeida <andrealmeid@igalia.com>
> ---
> 
> This is a standalone patch from the following serie, the other patches are
> already merged:
> https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igalia.com/
> 
>  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 370d820be248..d0693f902a5c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -570,3 +570,50 @@ dma-buf interoperability
>  
>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>  information on how dma-buf is integrated and exposed within DRM.
> +
> +KMS atomic state
> +================
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion,
> +without ever applying intermediate or partial state changes.  Either the whole
> +commit succeeds or fails, and it will never be applied partially. This is the
> +fundamental improvement of the atomic API over the older non-atomic API which is
> +referred to as the "legacy API".  Applying intermediate state could unexpectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which means the
> +complete state change is validated but not applied.  Userspace should use this
> +flag to validate any state change before asking to apply it. If validation fails
> +for any reason, userspace should attempt to fall back to another, perhaps
> +simpler, final state.  This allows userspace to probe for various configurations
> +without causing visible glitches on screen and without the need to undo a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS state in
> +the kernel. Hence, the complete new KMS state is the complete old KMS state with
> +the committed property settings done on top. The kernel will try to avoid
> +no-operation changes,

Not how things work. The driver may try to avoid some really
expensive operations, but generally it will just blindly blast
the full state to the hardware.

IIRC this was discussed long ago when atomic was being designed
and the general concensus was that the kernel shouldn't generally
do this kind of stuff, and instead we just leave it to userspace
to generate optimal commits.

> so it is safe for userspace to send redundant property
> +settings.

Safe but not optimal. Any object included in the state will cause said
object to be part of the commit, and side effects will also need to be
observed.

So if you add an extra crtc (either directly or indirectly) it will
have a new commit inserted into the queue and thus and any subsequent
commit will either block or be rejected with -EBUSY. Also for directly
added crtcs an event will be emitted once the commit is done.

Any plane added will also need to observe side effects even if the FB
doesn't change, such as invalidating any internal compressed version
of the old FB contents, PSR/DSI command mode/etc. will need to upload
the frame to the display, etc. I suppose we could specify that if no
FB is specified at all then these kind of side effects could be ignored,
but that is certainly not how things are implemented right now.

So for optimal behaviour userspace should be minimizing the commits.

-- 
Ville Syrj�l�
Intel

