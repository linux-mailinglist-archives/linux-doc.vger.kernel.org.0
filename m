Return-Path: <linux-doc+bounces-4236-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1A8068D7
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 08:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3741F213FD
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 07:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C102F18028;
	Wed,  6 Dec 2023 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPu8jcYo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B671D6D
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 23:44:08 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso5293a12.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 23:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701848646; x=1702453446; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdKPWOKviS7M/4hROCiqTd2mt3qGAslRAMcQk5Ps1I=;
        b=WPu8jcYoRUZPTjOyg+TCf6HfCSnsfHR0a2caq8am9E6+thrb65H/qvmVuKW4vlPwXe
         N6PJF60rEFhDcVghV45KWKSLL/A+bRBtc7uSkFqWl/+Iw2HPqGMjDC/Xf1d1YefbY5qu
         Ki49JTp8LfsxQ2+fEfq1NPp027wx0bAEYOzWrfDr1fDt9n8nHdBvwwDrluBrvYSy/PrP
         7PiTnwlkwHD2pJRmHeVd+ZWbDyba46UesURz7RI9C244q3c2UaMzqq1c/9hko1dsC/pL
         Hr2mteU0nDR03wFGxbJgFiPybZN8jiYPa/qulxRsLTTcc0v0B2Oe94tZnFt380SxKnAo
         0jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701848646; x=1702453446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAdKPWOKviS7M/4hROCiqTd2mt3qGAslRAMcQk5Ps1I=;
        b=AIDFjCQeB8qxk2NljqXEFAWDTNJDuXbF1nZtyV2djdOry96Y7wJle8TirMxYAI3RZR
         fe5sbb/+Mub+dWUT8jM6cUr4X4zpr/e4Dr9rcI3/4mLe65yLnLe7xrgxWq7b+EcBvTJG
         YGgigqTnf1IEfAZlhJyLFLjaaYBn0KsviCzalNPhSoC+2zZV3mTw2BLmzGqgkmmGFyK9
         OmEkNmZC5yZmVTv6VPZU4a+aW8Lc1kYf36Xp/APVDFdaapQRC6MzKb+Elc+LeE/doLV0
         H2Q5XwDbZ91lS4VtRk39yilIFYQ6Agt8U1ueWW1kq339dwioTsNY5ZW2xOCo48g6mBZY
         58zA==
X-Gm-Message-State: AOJu0YyhxIQXgpg7KqT261FljfWAnHXYmL+vi9yn+VLKuR9UjO37mHQt
	E023Wrpcn5QPF+DXd/v83jxwHlTGpBOAmoUfHaXm2g==
X-Google-Smtp-Source: AGHT+IGTP1Y3U72rXYtkmaXsWs8KvY9u5RQplJ6rS+PySca+roQe+qCOn/D2CkfwZqNuqG37Pb9tbKAhucCyjkbZlpY=
X-Received: by 2002:a50:d0cc:0:b0:54c:9996:7833 with SMTP id
 g12-20020a50d0cc000000b0054c99967833mr40395edf.7.1701848646262; Tue, 05 Dec
 2023 23:44:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205-kunit_bus-v1-0-635036d3bc13@google.com>
 <20231205-kunit_bus-v1-1-635036d3bc13@google.com> <ddb65f28-e900-44ef-aad3-568093540c38@gmail.com>
In-Reply-To: <ddb65f28-e900-44ef-aad3-568093540c38@gmail.com>
From: David Gow <davidgow@google.com>
Date: Wed, 6 Dec 2023 15:43:52 +0800
Message-ID: <CABVgOS=3mS7pA+5EuTu5yHPHQ7Rhe9WQN8shucuqd4H+tpzWRQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] kunit: Add APIs for managing devices
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Rae Moar <rmoar@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kees Cook <keescook@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Ripard <mripard@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000f8158060bd28400"

--0000000000000f8158060bd28400
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Dec 2023 at 16:30, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> On 12/5/23 09:31, davidgow@google.com wrote:
> > Tests for drivers often require a struct device to pass to other
> > functions. While it's possible to create these with
> > root_device_register(), or to use something like a platform device, this
> > is both a misuse of those APIs, and can be difficult to clean up after,
> > for example, a failed assertion.
> >
> > Add some KUnit-specific functions for registering and unregistering a
> > struct device:
> > - kunit_device_register()
> > - kunit_device_register_with_driver()
> > - kunit_device_unregister()
>
> Thanks a lot David! I have been missing these!
>
> I love the explanation you added under Documentation. Very helpful I'd
> say. I only have very minor comments which you can ignore if they don't
> make sense to you or the kunit-subsystem.
>
> With or without the suggested changes:
>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
>
> > --- /dev/null
> > +++ b/include/kunit/device.h
> > @@ -0,0 +1,76 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * KUnit basic device implementation
> > + *
> > + * Helpers for creating and managing fake devices for KUnit tests.
> > + *
> > + * Copyright (C) 2023, Google LLC.
> > + * Author: David Gow <davidgow@google.com>
> > + */
> > +
> > +#ifndef _KUNIT_DEVICE_H
> > +#define _KUNIT_DEVICE_H
> > +
> > +#if IS_ENABLED(CONFIG_KUNIT)
> > +
> > +#include <kunit/test.h>
> > +
> > +struct kunit_device;
> > +struct device;
> > +struct device_driver;
> > +
> > +// For internal use only -- registers the kunit_bus.
> > +int kunit_bus_init(void);
> > +
> > +/**
> > + * kunit_driver_create() - Create a struct device_driver attached to the kunit_bus
> > + * @test: The test context object.
> > + * @name: The name to give the created driver.
> > + *
> > + * Creates a struct device_driver attached to the kunit_bus, with the name @name.
> > + * This driver will automatically be cleaned up on test exit.
> > + */
> > +struct device_driver *kunit_driver_create(struct kunit *test, const char *name);
> > +
> > +/**
> > + * kunit_device_register() - Create a struct device for use in KUnit tests
> > + * @test: The test context object.
> > + * @name: The name to give the created device.
> > + *
> > + * Creates a struct kunit_device (which is a struct device) with the given name,
> > + * and a corresponding driver. The device and driver will be cleaned up on test
> > + * exit, or when kunit_device_unregister is called. See also
> > + * kunit_device_register_with_driver, if you wish to provide your own
> > + * struct device_driver.
> > + */
> > +struct device *kunit_device_register(struct kunit *test, const char *name);
> > +
> > +/**
> > + * kunit_device_register_with_driver() - Create a struct device for use in KUnit tests
> > + * @test: The test context object.
> > + * @name: The name to give the created device.
> > + * @drv: The struct device_driver to associate with the device.
> > + *
> > + * Creates a struct kunit_device (which is a struct device) with the given
> > + * name, and driver. The device will be cleaned up on test exit, or when
> > + * kunit_device_unregister is called. See also kunit_device_register, if you
> > + * wish KUnit to create and manage a driver for you
> > + */
> > +struct device *kunit_device_register_with_driver(struct kunit *test,
> > +                                              const char *name,
> > +                                              struct device_driver *drv);
> > +
> > +/**
> > + * kunit_device_unregister() - Unregister a KUnit-managed device
> > + * @test: The test context object which created the device
> > + * @dev: The device.
> > + *
> > + * Unregisters and destroys a struct device which was created with
> > + * kunit_device_register or kunit_device_register_with_driver. If KUnit created
> > + * a driver, cleans it up as well.
> > + */
> > +void kunit_device_unregister(struct kunit *test, struct device *dev);
>
> I wish the return values for error case(s) were also mentioned. But
> please, see my next comment as well.
>

I'll add these for v2.

> > +
> > +#endif
> > +
> > +#endif
>
> ...
>
> > diff --git a/lib/kunit/device.c b/lib/kunit/device.c
> > new file mode 100644
> > index 000000000000..93ace1a2297d
> > --- /dev/null
> > +++ b/lib/kunit/device.c
> > @@ -0,0 +1,176 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit basic device implementation
> > + *
> > + * Implementation of struct kunit_device helpers.
> > + *
> > + * Copyright (C) 2023, Google LLC.
> > + * Author: David Gow <davidgow@google.com>
> > + */
> > +
>
> ...
>
> > +
> > +static void kunit_device_release(struct device *d)
> > +{
> > +     kfree(to_kunit_device(d));
> > +}
>
> I see you added the function documentation to the header. I assume this
> is the kunit style(?) I may be heretical, but I'd love to see at least a
> very short documentation for (all) exported functions here. I think the
> arguments are mostly self-explatonary, but at least for me the return
> values aren't that obvious. Whether they are kerneldoc or not is not
> that important to me.
>
> I think you did a great job adding docs under Documentation/ (and the
> header) - but at least I tend to just jump to function implementation
> when I need to figure out how it behaves. Having doc (or pointer to doc)
> also here helps. I don't think it's that widely spread practice to add
> docs to the headers(?)
>

I'll add at least something to the implementations, too.

We've mostly kept the full documentation in the headers so they can be
found by people who only have headers installed, but also because the
headers tend to be smaller, and sphinx runs slowly enough as it is
without needing a bigger file to parse.

> > +struct device_driver *kunit_driver_create(struct kunit *test, const char *name)
> > +{
> > +     struct device_driver *driver;
> > +     int err = -ENOMEM;
> > +
> > +     driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
> > +
> > +     if (!driver)
> > +             return ERR_PTR(err);
> > +
> > +     driver->name = name;
> > +     driver->bus = &kunit_bus_type;
> > +     driver->owner = THIS_MODULE;
> > +
> > +     err = driver_register(driver);
> > +     if (err) {
> > +             kunit_kfree(test, driver);
> > +             return ERR_PTR(err);
> > +     }
> > +
> > +     kunit_add_action(test, driver_unregister_wrapper, driver);
> > +     return driver;
> > +}
> > +EXPORT_SYMBOL_GPL(kunit_driver_create);
> > +
> > +struct kunit_device *__kunit_device_register_internal(struct kunit *test,
> > +                                                   const char *name,
> > +                                                   struct device_driver *drv)
>
> Very much nitpicking only - but do you think either the "__"-prefix or
> the "_internal"-suffix would be enough and not both? (Just to make
> function a tad shorter, not that it matters much though).
>

Fair enough, I've tentatively got rid of the underscores for v2.

> > +{
> > +     struct kunit_device *kunit_dev;
> > +     int err = -ENOMEM;
> > +
> > +     kunit_dev = kzalloc(sizeof(struct kunit_device), GFP_KERNEL);
> > +     if (!kunit_dev)
> > +             return ERR_PTR(err);
> > +
> > +     kunit_dev->owner = test;
> > +
> > +     err = dev_set_name(&kunit_dev->dev, "%s.%s", test->name, name);
> > +     if (err) {
> > +             kfree(kunit_dev);
> > +             return ERR_PTR(err);
> > +     }
> > +
> > +     /* Set the expected driver pointer, so we match. */
> > +     kunit_dev->driver = drv;
> > +
> > +     kunit_dev->dev.release = kunit_device_release;
> > +     kunit_dev->dev.bus = &kunit_bus_type;
> > +     kunit_dev->dev.parent = &kunit_bus;
> > +
> > +     err = device_register(&kunit_dev->dev);
> > +     if (err) {
> > +             put_device(&kunit_dev->dev);
> > +             return ERR_PTR(err);
> > +     }
> > +
> > +     kunit_add_action(test, device_unregister_wrapper, &kunit_dev->dev);
> > +
> > +     return kunit_dev;
> > +}
>

Thanks,
-- David

--0000000000000f8158060bd28400
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
ddIn9n5Jt6Z1o79zxraLMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBtHFwIgQZjer5K
H+4Q+wns10k7qN+4wN2Uf+JsyOYjukaMEgdLErfA1wwtQ9uHkoYQZcWBuVVkQFa5hI+sqI2m1Weq
riMCFSiU38s1tADdMX12IMfJRN60Nznhrw+nPyDRZqRhUTW24TwnHorkDnFPW8PHo7fAw4FrpI0n
impZAng7ccvvK09K3ZuhwTIxJMsPXCZYsrXWORTw5sczRAP6XvKbPBJnsJoSTe5dFBPBHOQJOGhU
qWfEfWnWMJPF3LxSGLpLFQXO3RwQqmxv08avwXfVPouh1xuB3FX7rpDabT8YDhu9JgIZkLEKko7L
yQt6zWwng7k8YF/jGbiAta6VMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABzgV+4+mJnUzG7XDy6d2uMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBt
bY5pgASKNxYOOhAflV8MgwKe0yqydBPELBkufdYhpjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzEyMDYwNzQ0MDZaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEALniBTuEniBe10dZfpWBB
KeqAmNEENkau2la5iXFAqK0/h1bIGTKLfYBltKXA+fVkd+CPiCQYs0L/b1gLH+FW8KTo3YndXv9L
zVJ/Alnv0LTAkxDa7WAPCT1wIXISJXWOiItOlK78Ma9DQomIsNbHS0AA+qz2EmWVzHNUcuoA1GEY
zk7YJGIiB8+3NV65VMwgd7695uF/00LJRasHxY0hGAS/m+hS0jIpn/18YbCQ7sXw0LrPagVJBQgU
Bb3moyXScvEJ4tywp8qX/VINEUj71b7CMAXAEUFasyXb01B7ZATTtOQen+O1FRFzUPKaHlnKFkP4
+G7WDO4NWJALOYiuiA==
--0000000000000f8158060bd28400--

