Return-Path: <linux-doc+bounces-83976-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C7+G4tk52nx7gEAu9opvQ
	(envelope-from <linux-doc+bounces-83976-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 13:50:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEB43A40B
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 13:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6073C301413E
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 11:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572E019D89E;
	Tue, 21 Apr 2026 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBbbt8HT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98E38838F;
	Tue, 21 Apr 2026 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776772220; cv=none; b=PeuO0HSSKFoE9VBko75capp2D1aTPVo+UmzwjdOmorQNVby5prZ41zQV0u3PGufPTlPs4oXT+Dyu93jSy6jotP6vw0x4xWTdThNSWuCSbGVyaQJ1f4KIeHjYIF2Yd+otgM6UXa6OUw2zI0AfDXQGdCf21BoqV3JDeYtdLmEWymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776772220; c=relaxed/simple;
	bh=7EgXSX2kbNsQTGNgx4ImlKGpezUOlRUpgOi4icXx1j8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P1jbg7dJIwfJBLVqbQ6ejb9A8JbTrev/O4g78tTX/8JAeUIxrZUZ3XTMd8JiI/pRSXGAdMFNjiWgIoI+FeyoL17Xvnt7jdjJbahu60x5xESLeUHZ6dEj2uKrhqBn/KNBw9RytRgkoOd2RDrmAmZ4/3UVksauPyauPpm9c2FokMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBbbt8HT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776772217; x=1808308217;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=7EgXSX2kbNsQTGNgx4ImlKGpezUOlRUpgOi4icXx1j8=;
  b=IBbbt8HTY2xEZ3fE7cOPNHqSc/SjlQhkIOIX7RkE1ykOfuL/0tctQpCT
   aa+0YBGW/Zo3/xhtYemHNl6O4ysHoaBzFyGsVw+03qS9uwhQciaArk30j
   6wsvtzt6qvq+TC70hd0fiovzGcdQ/dUmoFimgp71loM0HIweWd6Xe87zm
   4KklEABkNzFCuWg0N/mvxZQaotvPb0KkbA5unb7O6x+bCPUgv71BW+mJ2
   Qsu8a4aOGHUITwUR31yvv0W8YkMEA8akZcHMxqlmSDQ6gf37ANjtF7dD6
   yN7Po0Q2t6wPZuZzeQ/aN4dWc19+W1fo9LXE1dj9hfdLZ2qUT3OtpkZg2
   g==;
X-CSE-ConnectionGUID: hHpzJggGSWej78kzOIV71g==
X-CSE-MsgGUID: RG6lFl7BSeKD7RlJdxM0fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77577797"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77577797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 04:50:16 -0700
X-CSE-ConnectionGUID: B3auslJVR6GKADUigwj8Wg==
X-CSE-MsgGUID: yUjIc98WRBiNmeMG9f/VHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="231891388"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.38])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 04:50:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Albert Esteve <aesteve@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar
 <raemoar63@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Guenter Roeck
 <linux@roeck-us.net>, Linux Kernel Functional Testing <lkft@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Alessandro Carminati <acarmina@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
In-Reply-To: <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com>
 <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
 <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com>
Date: Tue, 21 Apr 2026 14:50:05 +0300
Message-ID: <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,linuxfoundation.org,linux-foundation.org,vger.kernel.org,googlegroups.com,lists.freedesktop.org,roeck-us.net,linaro.org,igalia.com,redhat.com];
	TAGGED_FROM(0.00)[bounces-83976-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,linaro.org:email,intel.com:email,intel.com:dkim,intel.com:mid,ffwll.ch:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CEBEB43A40B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026, Albert Esteve <aesteve@redhat.com> wrote:
> On Mon, Apr 20, 2026 at 4:47=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
>>
>> On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
>> > From: Guenter Roeck <linux@roeck-us.net>
>> >
>> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
>> > intentionally trigger warning backtraces by providing bad parameters to
>> > the tested functions. What is tested is the return value, not the exis=
tence
>> > of a warning backtrace. Suppress the backtraces to avoid clogging the
>> > kernel log and distraction from real problems.
>> >
>> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: David Airlie <airlied@gmail.com>
>> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
>> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>> > ---
>> >  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
>> >  1 file changed, 14 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/t=
ests/drm_rect_test.c
>> > index 17e1f34b76101..1dd7d819165e7 100644
>> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
>> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
>> > @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct kuni=
t *test)
>> >       const struct drm_rect_scale_case *params =3D test->param_value;
>> >       int scaling_factor;
>> >
>> > +     /*
>> > +      * drm_rect_calc_hscale() generates a warning backtrace whenever=
 bad
>> > +      * parameters are passed to it. This affects all unit tests with=
 an
>> > +      * error code in expected_scaling_factor.
>> > +      */
>> > +     KUNIT_START_SUPPRESSED_WARNING(test);
>> >       scaling_factor =3D drm_rect_calc_hscale(&params->src, &params->d=
st,
>> >                                             params->min_range, params-=
>max_range);
>> > +     KUNIT_END_SUPPRESSED_WARNING(test);
>>
>> Would not something like:
>>
>>         scoped_kunit_suppress() {
>>                 scaling_factor =3D drm_rect_calc_hscale(&params->src, &p=
arams->dst,
>>                                                       params->min_range,=
 params->max_range);
>>         }
>>
>> be better?
>
> Since KUnit already has a few macros in its API it didn't occur to me.
> Good idea, I like it. And I guess the scope approach matches well with
> your __cleanup comment in the first patch. If no one opposes, I will
> work toward that pattern for the next version.

There's a catch with kunit and __cleanup and thus (scoped) guards. Kunit
runs in ktreads, asserts lead to kthread_exit() and the __cleanup won't
be called.

Warning suppression being part of kunit infrastructure, asserts can and
should end the suppression too. But setting the example (scoped) guards
are safe in kunit tests in general feels like a trap waiting to happen.


BR,
Jani.


>
>>
>> Also, how can you stand all this screaming in the code?
>>
>
> Again, KUnit already contains many macros, so this use didn't register
> as such. Now I will not be able to unsee it.
>
>

--=20
Jani Nikula, Intel

