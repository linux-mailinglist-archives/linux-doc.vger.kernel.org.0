Return-Path: <linux-doc+bounces-83885-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FFZFFtY5mmbvAEAu9opvQ
	(envelope-from <linux-doc+bounces-83885-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 18:46:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605942FF93
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 18:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29C113250431
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 15:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70937284883;
	Mon, 20 Apr 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y8RUxH+d"
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68753280CD2;
	Mon, 20 Apr 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776696433; cv=none; b=s0AXp4YWxtWlfOZeRfd1+BE76B2pq0OLs+bEsRPWuwDLt3YazZWtRGAfWx/6UtjMOJ/gpM4TAk6g3rTF17PymF3dhQBoy6ocuK/RKq+XFusrQzsrSB7HU44rBO2A0EAe0J/FVwwR0/6flOvJhPAhqVXwqGJJaI5upu0GU7v8088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776696433; c=relaxed/simple;
	bh=iYCRdH0ykmFr+A+ryrfohY97+3q6i5vstZiBO4OfpXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnyhY0tyMLCVGUuUE99WSlRAnCt9CstIMD7WvcB0cotNWVJ2SJSn6w84gUR8zEEi1qPOe4q+xFNKpOgnZ2PIaL6lB735c7S9rIwDLAdLchsPPnNWfvuAJmZ6Vp810n2qjcukL9s67aWIysU0cIpy/DsW8Xp+uassOgrxtAxc7Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y8RUxH+d; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eCyjhK/Q5fvtzDJtYR2G5sGLVBYO/Uljn2Rnbl90Gu0=; b=Y8RUxH+dN4uV3ck9NPBEDW9CGM
	fgtqPHdQaI5QFweHYVIYYEEuBsHHRv6yywnyvpCwRBGLzYy/o7bvAcPVG1Ymao+JTWrvwvVZnTwVm
	IN21XtGPpXtODoG9r4/dBnrjnRWgSij6UTDsxuArM4siJySJi1QR11AhSta/rwWUzR00ipJ8xCNf5
	9NXwEoh98VnqRKI7YdyJ0qYcFFjr7ctuQ5/prJtTJ6muED0U+YWgDgXkgXhJbkFc7OVRZmVrYGQYz
	GRd63Qs3K7/OG8khcL8MmtGYcH9hTyO6FhamVrohS+Miz4IsxuND1CLL6wiXVaLeaNMKl5hLkOZOx
	WOzwBaBA==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEptv-00000008Dyi-18py;
	Mon, 20 Apr 2026 14:47:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C9CC2301BDE; Mon, 20 Apr 2026 16:47:02 +0200 (CEST)
Date: Mon, 20 Apr 2026 16:47:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
Message-ID: <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83885-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[arndb.de,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,linuxfoundation.org,linux-foundation.org,vger.kernel.org,googlegroups.com,lists.freedesktop.org,roeck-us.net,linaro.org,igalia.com,redhat.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,noisy.programming.kicks-ass.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,roeck-us.net:email,igalia.com:email,linaro.org:email,ffwll.ch:email,infradead.org:dkim]
X-Rspamd-Queue-Id: 5605942FF93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> intentionally trigger warning backtraces by providing bad parameters to
> the tested functions. What is tested is the return value, not the existence
> of a warning backtrace. Suppress the backtraces to avoid clogging the
> kernel log and distraction from real problems.
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Acked-by: Maíra Canal <mcanal@igalia.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 17e1f34b76101..1dd7d819165e7 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
>  	const struct drm_rect_scale_case *params = test->param_value;
>  	int scaling_factor;
>  
> +	/*
> +	 * drm_rect_calc_hscale() generates a warning backtrace whenever bad
> +	 * parameters are passed to it. This affects all unit tests with an
> +	 * error code in expected_scaling_factor.
> +	 */
> +	KUNIT_START_SUPPRESSED_WARNING(test);
>  	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
>  					      params->min_range, params->max_range);
> +	KUNIT_END_SUPPRESSED_WARNING(test);

Would not something like:

	scoped_kunit_suppress() {
		scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
						      params->min_range, params->max_range);
	}

be better?

Also, how can you stand all this screaming in the code?

