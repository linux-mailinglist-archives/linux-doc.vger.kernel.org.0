Return-Path: <linux-doc+bounces-1751-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D667E2D30
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 20:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D079280A06
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 19:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B937182C8;
	Mon,  6 Nov 2023 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sqN1m8v5"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F814F9B
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 19:49:08 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C9195;
	Mon,  6 Nov 2023 11:49:07 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 025052E6;
	Mon,  6 Nov 2023 19:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 025052E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1699300146; bh=zEQVt6vSfkbE0VtgX8L2A0cLeymcuJsbgzk3kYbgEQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sqN1m8v5uKefgXcVoXs3nzfjFsozgjlQGI2hzYaua1W6UJVYUtoQEMdxWgad9d91C
	 /Yv54Dus92LipnX/lwyNTjkywG2SImP5uNDW9l6xSGnpYPfZ5F8woJIIdWP0l8CXtc
	 1jmumAStJiBZfW/uV4BsQuJmzVDRieW054jp1so/livXVp+giY73x/CpypszRdDOrN
	 YpD1Tes3NCUEjT6HaHFgKopNcqLbIVK+V/N21u+usK4ZYqL1YvUBzJIIdsw0QIZaMH
	 dIBynHFbcRBeJ0FbH9uiUtBUVifi2bfrcyiCWdFiYc+Q1+F402Ahs8Vuzgkx9rWSvQ
	 IMldVcCvKLncg==
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@intel.com>, Hunter Chasens
 <hunter.chasens18@ncf.edu>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Luca Coelho
 <luciano.coelho@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
In-Reply-To: <87edh2zn2y.fsf@intel.com>
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
 <CAFJe6O1oJnQvLVSJZP6MMXULGrX=a3SEO1X5b4xff06WhqLw_g@mail.gmail.com>
 <87edh2zn2y.fsf@intel.com>
Date: Mon, 06 Nov 2023 12:49:05 -0700
Message-ID: <871qd24q8e.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@intel.com> writes:

> Looks like this is because namespacing was introduced in Sphinx 3.1
> [1]. With earlier Sphinx, you get a warning about the namespace
> directives.
>
> However, with newer Sphinx, you get the warning mentioned in commit
> f6757dfcfde7 ("drm/doc: fix duplicate declaration warning") if you
> remove the namespace directives:
>
> linux/Documentation/gpu/driver-uapi.rst:2279: WARNING: Duplicate C declaration, also defined at rfc/i915_scheduler:3.
> Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.
>
> It would be short-sighted to just remove the directives. Sooner or later
> we're gong to bump the (IMO extremely conservative) minimum version
> requirement.

I'd say let's just do that once the merge window is done.  A year ago
(in 31abfdda6527) I added a warning for <2.4.x, so raising the minimum
that far would appear to require no thought.  Going up to 3.1 is a step
beyond that, though, not sure if we want to go that far.

Something to ask at the LPC session next week.

Thanks,

jon

