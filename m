Return-Path: <linux-doc+bounces-28277-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D49AB5CA
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 20:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63D46B23573
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 18:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E3C1C9B7B;
	Tue, 22 Oct 2024 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dHkIGz66"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC81C6F6A
	for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620690; cv=none; b=n2CbO4nGVdQxcwX/Afe15fW87rrIyQW7WsDxtCYe5PDfRKBopBN/ErNfpk5cbgeTgE3Ivkwj8o+2OlwEMDIaMG1ylX95Eng5O1ZUeB/PkD4cp2GYsKqzo0gw1ALqZNEyBJlfmJ43wAVGPUUJ0OeMsf3ElYImizmvcPkNEZuQq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620690; c=relaxed/simple;
	bh=4fUh/Y5Wu/2hZYMxBvSfyM0BJWo+IgP4cjxDEkuvIoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHGW8fI2yk9eA0U9bFrrNBuf3aFQ77+KTxACrVZ7zNoLgaitat1MKZGfh9skHBZGBgFPEbb7OByvK1i6Z6ECgsZ/QkI++pXESpeO/uG2VYTk2e5Soi1aMhQRwzh0ZSvvWrtS3W9+hxXJ5yS7voXkivEsUXdbm4sMsg0odWniYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dHkIGz66; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso57992271fa.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729620685; x=1730225485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxX9XE7Bu14uzEO7ETrCqQQOfswrKYUdi+DacsDonWk=;
        b=dHkIGz66Sk5RVXqU9GtKEEbIkDoPNIcM1t4xOqc87L7BK9MrAgeNq5AhuRsQJYUrDq
         /cjoROwOTrL1Wbx7rIEW9lUXLrdktqmDkcLLD2USfv3oJSKF5cGtHwK0yQOCjUJL7siR
         NKs9XrWy6rw3x/CwIvo2UsOcrP10nexVX2vak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729620685; x=1730225485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxX9XE7Bu14uzEO7ETrCqQQOfswrKYUdi+DacsDonWk=;
        b=M51sDlVUn90Kq0S1idtj7m7NM5P1/sAlkRKXnThF7AK1QJxmDMOw15zZxyIW3JJcz/
         IMdHbzCDkXaNZpjjwOl1Ox+4UfcCqdgNdPA1vvyQ5/8ozgNkrVXcJiO8HG3GMp2Dd3bR
         2ix5GKU4zJzLV0wbM9LVug9WJdPMRBrpzMJKWv//0NyXcqV4dn7WCzRaRZBeWjaMGEsD
         H5J5cB9DHU3h5wBgwzi/WniHfa0rteC7hBCd7/ZDTS4RBDd55gGgTtWl2DfuTbfcX53z
         Wgxakuhvt7NFDGJbx6P2KJeeoxWwKmTO1UV0bWwjCkPz8UKJe5782qGcGoWuSWFG7qh3
         mS5g==
X-Forwarded-Encrypted: i=1; AJvYcCX5HLiaA5XcrUbRFtxRCOmEPREF1bdViaBwC8gAMazLLeSr8QAFQ4WkmNni9+MRAB7nBccpj7+GmZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YztmDgObUBVwTRap+DDCX+1AX2pvWB7fJCd9Qqa0bYmGWumtuSR
	Ag0TkvRa+m+eVBWKWuE+hLrCNVcJBEnYXppvrgFVm/bX+VWJJPRUsxoSRkOjKI0WFsdjw3rEJo3
	bbQG1kwzxWXw+USKZOmzXx5As5AjsrGIbFk3q
X-Google-Smtp-Source: AGHT+IF1lvYbetIHrryAdh+jmeC5rJO5rAiidyzmaALJvxxCwL4J2paIXfTnO/FOGo6ANr8RE57YXdoA+RN0fF/TxZw=
X-Received: by 2002:a05:651c:2112:b0:2fb:6169:c42a with SMTP id
 38308e7fff4ca-2fc93341785mr21602731fa.30.1729620684671; Tue, 22 Oct 2024
 11:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021191233.1334897-1-dualli@chromium.org> <20241021191233.1334897-2-dualli@chromium.org>
 <20241022170625.GJ402847@kernel.org>
In-Reply-To: <20241022170625.GJ402847@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Tue, 22 Oct 2024 11:11:13 -0700
Message-ID: <CANBPYPh97difTKrD=a6A-0sOVwZS28K=BvH37-62Z5FUO+kNUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] binder: report txn errors via generic netlink (genl)
To: Simon Horman <horms@kernel.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, arnd@arndb.de, 
	masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, hridya@google.com, smoreland@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 10:06=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
>
> On Mon, Oct 21, 2024 at 12:12:33PM -0700, Li Li wrote:
> > + * @pid:     the target process
> > + * @flags:   the flags to set
> > + *
> > + * If pid is 0, the flags are applied to the whole binder context.
> > + * Otherwise, the flags are applied to the specific process only.
> > + */
> > +static int binder_genl_set_report(struct binder_context *context, u32 =
pid, u32 flags)
>
> ...
>
> >  static int __init init_binder_device(const char *name)
> >  {
> >       int ret;
> > @@ -6920,6 +7196,11 @@ static int __init init_binder_device(const char =
*name)
>
> The code above this hunk looks like this:
>
>
>         ret =3D misc_register(&binder_device->miscdev);
>         if (ret < 0) {
>                 kfree(binder_device);
>                 return ret;
>         }
>
> >
> >       hlist_add_head(&binder_device->hlist, &binder_devices);
> >
> > +     binder_device->context.report_seq =3D (atomic_t)ATOMIC_INIT(0);
> > +     ret =3D binder_genl_init(&binder_device->context.genl_family, nam=
e);
> > +     if (ret < 0)
> > +             kfree(binder_device);
>
> So I think that binder_device->miscdev needs to be misc_deregister'ed
> if we hit this error condition.
>
> > +
> >       return ret;
>
> Probably adding an unwind ladder like this makes sense (completely untest=
ed!):
>
>         ret =3D misc_register(&binder_device->miscdev);
>         if (ret < 0)
>                 goto err_misc_deregister;
>
>         hlist_add_head(&binder_device->hlist, &binder_devices);
>
>         binder_device->context.report_seq =3D (atomic_t)ATOMIC_INIT(0);
>         ret =3D binder_genl_init(&binder_device->context.genl_family, nam=
e);
>         if (ret < 0);
>                 goto err_misc_deregister;
>
>         return 0;
>
> err_misc_deregister:
>         misc_deregister(&binder_device->miscdev);
> err_free_dev:
>         kfree(binder_device);
>         return ret;
>

Good catch! Will fix it in the next revision.

> ...
>
> > diff --git a/drivers/android/binder_genl.h b/drivers/android/binder_gen=
l.h
>
> Perhaps it is because of a different version of net-next,
> but with this patch applied on top of the current head commit
> 13feb6074a9f ("binder: report txn errors via generic netlink (genl)")
> I see:
>
> $ ./tools/net/ynl/ynl-regen.sh -f
> $ git diff
>
> diff --git a/include/uapi/linux/android/binder_genl.h b/include/uapi/linu=
x/android/binder_genl.h
> index ef5289133be5..93e58b370420 100644
> --- a/include/uapi/linux/android/binder_genl.h
> +++ b/include/uapi/linux/android/binder_genl.h
> @@ -3,12 +3,17 @@
>  /*     Documentation/netlink/specs/binder_genl.yaml */
>  /* YNL-GEN uapi header */
>
> -#ifndef _UAPI_LINUX_BINDER_GENL_H
> -#define _UAPI_LINUX_BINDER_GENL_H
> +#ifndef _UAPI_LINUX_ANDROID/BINDER_GENL_H
> +#define _UAPI_LINUX_ANDROID/BINDER_GENL_H
>
>  #define BINDER_GENL_FAMILY_NAME                "binder_genl"
>  #define BINDER_GENL_FAMILY_VERSION     1
>
> +/**
> + * enum binder_genl_flag - Used with "set" and "reply" command below, de=
fining
> + *   what kind \ of binder transactions should be reported to the user s=
pace \
> + *   administration process.
> + */
>  enum binder_genl_flag {
>         BINDER_GENL_FLAG_FAILED =3D 1,
>         BINDER_GENL_FLAG_DELAYED =3D 2,
> @@ -34,4 +39,4 @@ enum {
>         BINDER_GENL_CMD_MAX =3D (__BINDER_GENL_CMD_MAX - 1)
>  };
>
> -#endif /* _UAPI_LINUX_BINDER_GENL_H */
> +#endif /* _UAPI_LINUX_ANDROID/BINDER_GENL_H */

The patch was based on the top of Linus's tree instead of net-next.
I'll investigate this difference.

