Return-Path: <linux-doc+bounces-43318-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D546A8B554
	for <lists+linux-doc@lfdr.de>; Wed, 16 Apr 2025 11:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADBA14444C8
	for <lists+linux-doc@lfdr.de>; Wed, 16 Apr 2025 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C9123536C;
	Wed, 16 Apr 2025 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHNJGM1/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01F235360;
	Wed, 16 Apr 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795769; cv=none; b=F+8ufP69nBH2Bb8vaIxQ7eqWPovHOJXi10wPxSnrU1UlXS90BdOWL7NM0MYhGr3n9NucWLvIfw9rnXsoBRAR7m8Xx3XjYqsszG5Foop5KiCHV7cCpEx5bFw7syd+zBliyOyyErTOj+l/0A3U0nkMqir3EuMyYnwv6k2rdLx6JSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795769; c=relaxed/simple;
	bh=xKc8QblkN9uJFFCNL6TIKz3YjB59ygJkZnOM9Cdts/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ng4wPAPPzQAD/vN98Wv9qWizXA/JwS67UfYNOcE9LOzNqlfQYf6gNZL7Vw1l0FWl2inujkAoM0Gf9l1AjCcvk0cdNw6NxQbXvOrZODCW1TPRnXt+tDI8lP3Rglbyu9kXIgv+4OjcK/6Ezvzh9F9gef5dvO1adDFtNYLAb7+jBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHNJGM1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBF2C4CEE2;
	Wed, 16 Apr 2025 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744795768;
	bh=xKc8QblkN9uJFFCNL6TIKz3YjB59ygJkZnOM9Cdts/Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vHNJGM1//ojqqTbQ3yiTbcMZDv4Ur+nBc2qkNjLe8xRQ4EYJ9LkW9VsCKmY3nlM/q
	 XBl/0dy2GDg5Qvej2MThYk/7hDAS/cotGKHYpwC4ANvaxkov7B12fAE/GJf3/VgqBs
	 UO0v4W1HVWqO26xOLT7BQJbSyCT0MihHG3jlPmul2oKOoo2cJ5Or3CrNvjQGd6SgVA
	 cEyDA3KbYnwdud9rXx5bgNwiP1SGhOmP7n/p22oUVjAHRMX3dmEG63USPagIeZ6e68
	 PBK2hW+TZzaMrKBnHQ4Jxy8V8hHLF5d0JKYWYaXZf/+n43hq5r/heHpZMjikVUkjFH
	 MMJSP7sAXZ77A==
Date: Wed, 16 Apr 2025 17:29:01 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@intel.com>, David
 Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250416172901.60104103@sal.lan>
In-Reply-To: <20250416171917.0985c0eb@sal.lan>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
	<4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
	<87tt6opks7.fsf@intel.com>
	<20250416171917.0985c0eb@sal.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Apr 2025 17:19:17 +0800
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Wed, 16 Apr 2025 11:34:16 +0300
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> 
> > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > As reported by Andy, kernel-doc.py is creating a __pycache__
> > > directory at build time.
> > >
> > > Disable creation of __pycache__ for the libraries used by
> > > kernel-doc.py, when excecuted via the build system or via
> > > scripts/find-unused-docs.sh.
> > >
> > > Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  drivers/gpu/drm/Makefile      | 2 +-
> > >  drivers/gpu/drm/i915/Makefile | 2 +-
> > >  include/drm/Makefile          | 2 +-
> > >  scripts/Makefile.build        | 2 +-
> > >  scripts/find-unused-docs.sh   | 2 +-
> > >  5 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index ed54a546bbe2..d21d0cd2c752 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
> > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > >        cmd_hdrtest = \
> > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> > 
> > KERNELDOC is not set here.
> 
> > 
> > /bin/sh: 1: -none: not found
> 
> Weird. This is set on Documentation/Makefile:
> 
> 	$ grep KERNELDOC Documentation/Makefile 
> 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> 	...
> 
> drivers/gpu/drm/Makefile should be able to see this variable there...

I suspect that the building system tries to confine variables to
sub-directories, so maybe one solution would be to move it to the
main makefile.

could you please check if this patch solves the issue?

[PATCH] Makefile: move KERNELDOC macro to the main Makefile

As kernel-doc script is used not only on Documentation, but
also on scripts and drivers/drm Makefiles, move it to the
main makefile, as otherwise sub-makefiles may not have it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/Makefile b/Documentation/Makefile
index c022b97c487e..7a2069e87dbd 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
 # Internal variables.
 PAPEROPT_a4     = -D latex_paper_size=a4
 PAPEROPT_letter = -D latex_paper_size=letter
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
 KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
 ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
 ifneq ($(wildcard $(srctree)/.config),)
diff --git a/Makefile b/Makefile
index 38689a0c3605..c8e46f0c1f63 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,8 @@ endif
 HOSTRUSTC = rustc
 HOSTPKG_CONFIG	= pkg-config
 
+KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
 			 -O2 -fomit-frame-pointer -std=gnu11
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)



