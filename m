Return-Path: <linux-doc+bounces-4498-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BA809D3F
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 08:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8251F21334
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 07:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A7510790;
	Fri,  8 Dec 2023 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AxHsxAZ/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239E4171F
	for <linux-doc@vger.kernel.org>; Thu,  7 Dec 2023 23:39:11 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c32bea30dso30035e9.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Dec 2023 23:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702021149; x=1702625949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCkP1UOSFN/6Yv9hZtznqIMqYxp7IUc2r86Qofpf4h4=;
        b=AxHsxAZ/xykqhTKH/4qrAOMgBFMUS6FtjwtZwCt2FJ107pcqxjfJe2TEmC7LTkxXb+
         rRmw6jAe31h2VQyMtb2IUDm9t9P8hrzRDhIMDR+J+geyyFoOI9QMhR/rJto3YQ3JvgDy
         Ufli6jeAosTAEhRXe0fviP6h189aLa9SqcyguZfuhLnGIlIoiqGGcPi1xcUedPItOGir
         Lv1pgYf/N7vI5EcUchnsnJ0JFQtQNtPk1pbSFVOCLY+Cf+v6TCQbmkcNgADIPKzUFL7S
         zUIvUz1xuWyZakmWucGiOHHSlqoCwv8gIdK2OhGdIefeoGq5TX3WHo8YX/wPtYQPZRk6
         OK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702021149; x=1702625949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCkP1UOSFN/6Yv9hZtznqIMqYxp7IUc2r86Qofpf4h4=;
        b=te6MaWfPgI7AaU0YTxCsCEt2LYqannialJpw+OFeAJw0BTqhfZwuhbS2Lmbi1tXNE9
         iiXmIvKw8MgCLVuLXz+QiBL2SHef9TLshzaVjgznJzzt8rE4GX5dsNGI1TxEqHqfISn+
         tjwuGmpGi2qK5YK3aKf2kIcLWBszbSCcqYGjyzxMSdINSkG0Kyp9ggXA7Rh3XQIazdAq
         KGzI97rGPXgFw9J7N5eRy4jtoN2wJo3bLw7RkLt1jSn93Gg24dRziSnNzts3X8Hi7K88
         ULM7FBc8igKlvIScHooqQ4Y6GkKi6bzDl6xJJ36uPRx2T3ZQwA69pU2fYy4Bp4Fe6cs5
         LnVg==
X-Gm-Message-State: AOJu0YxBI/IflWCkQJMAbXmNHElasuNUA8teY31a9AUGJHR0mNYYgmDx
	+9mXxFfBLC/Km8DQT+uOy2p4h3qolrYhEaqvYvpT1w==
X-Google-Smtp-Source: AGHT+IHtwp5+Xh1T0DDbMixGMxkesvV/WAZ7PB8oqKgeYis6tuJvGlc9TtYOL/dGIFuzzX0bR0zNC49Q9Vw6vStVMM0=
X-Received: by 2002:a05:600c:2941:b0:405:320a:44f9 with SMTP id
 n1-20020a05600c294100b00405320a44f9mr25035wmd.5.1702021149395; Thu, 07 Dec
 2023 23:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205-kunit_bus-v1-0-635036d3bc13@google.com>
 <20231205-kunit_bus-v1-2-635036d3bc13@google.com> <202312061306.98DA6D275D@keescook>
In-Reply-To: <202312061306.98DA6D275D@keescook>
From: David Gow <davidgow@google.com>
Date: Fri, 8 Dec 2023 15:38:56 +0800
Message-ID: <CABVgOSnTJFeso-=if=2Vs31xoCKNGvN2vM9nCJ37eJNEd=dRYw@mail.gmail.com>
Subject: Re: [PATCH 2/4] fortify: test: Use kunit_device
To: Kees Cook <keescook@chromium.org>
Cc: Rae Moar <rmoar@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 05:07, Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Dec 05, 2023 at 03:31:34PM +0800, davidgow@google.com wrote:
> > Using struct root_device to create fake devices for tests is something
> > of a hack. The new struct kunit_device is meant for this purpose, so use
> > it instead.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
> > ---
> >  lib/fortify_kunit.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/fortify_kunit.c b/lib/fortify_kunit.c
> > index c8c33cbaae9e..f7a1fce8849b 100644
> > --- a/lib/fortify_kunit.c
> > +++ b/lib/fortify_kunit.c
> > @@ -16,6 +16,7 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> >  #include <kunit/test.h>
> > +#include <kunit/device.h>
> >  #include <linux/device.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> > @@ -269,7 +270,7 @@ DEFINE_ALLOC_SIZE_TEST_PAIR(kvmalloc)
> >       size_t len;                                                     \
> >                                                                       \
> >       /* Create dummy device for devm_kmalloc()-family tests. */      \
> > -     dev = root_device_register(dev_name);                           \
> > +     dev = kunit_device_register(test, dev_name);                    \
> >       KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev),                       \
> >                              "Cannot register test device\n");        \
> >                                                                       \
> > @@ -303,7 +304,7 @@ DEFINE_ALLOC_SIZE_TEST_PAIR(kvmalloc)
> >       checker(len, devm_kmemdup(dev, "Ohai", len, gfp),               \
> >               devm_kfree(dev, p));                                    \
> >                                                                       \
> > -     device_unregister(dev);                                         \
> > +     kunit_device_unregister(test, dev);                             \
> >  } while (0)
> >  DEFINE_ALLOC_SIZE_TEST_PAIR(devm_kmalloc)
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> (As an aside; shouldn't this get automatically cleaned up like other
> kunit resources, though?)
>

We can't just get rid of the {kunit_,}device_unregister() here,
because otherwise we'd have several devices with the same name during
the test.

So, yes, these get automatically cleaned up, but the test would have
to be restructured to either give each device a different name, or
split the tests up further.

-- David

