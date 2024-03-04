Return-Path: <linux-doc+bounces-11289-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DF98707ED
	for <lists+linux-doc@lfdr.de>; Mon,  4 Mar 2024 18:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 549321F235EA
	for <lists+linux-doc@lfdr.de>; Mon,  4 Mar 2024 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAFA5C90B;
	Mon,  4 Mar 2024 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EJmp2YwZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A025CDDD;
	Mon,  4 Mar 2024 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571838; cv=none; b=CSUMKjy+qDToJGlHn3lW5kmlN1S5gQ+KHMvVbdpHQU4pq0nz4x8TH1mryzuv2rgQg1jVNWftD+k1x9Gm/BGlr++4K1aCCNDr3fbEjeOzjmjkf3A8ShgRl+81X6cAiHu+iPxMbiZId90tW0hBIkax6n6Und7la2n1ldsqxWz2gpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571838; c=relaxed/simple;
	bh=QVFxd1YSLwW2a7fCHIdyRN5o6f+rp+oB5zXu4FiVrfE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6zUcrtaOHUKHl5k6WUHt0b23Asp9jiR4cHOIgw2Z/7gvTI6/inud3KuNE09XeLO6ApkFUNCyIVG96p0lalKOxphsjeNUkBHz2ymG/6TqPuXtD3hGdlf6hcBaheyQ9uaCZFsvm1k94ZoRA++STXGofxMxVeXLScePQcR3hC61eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EJmp2YwZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709571832;
	bh=QVFxd1YSLwW2a7fCHIdyRN5o6f+rp+oB5zXu4FiVrfE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EJmp2YwZN2npYth3cYKdcDbjC89Fb7BLm57YTX0okcstsmnZ2dZbh3wZR1kizg1Ub
	 +Yyhexq7++bev8BdvIY8jg2WruI3TFqiC4b5fZu6ju3SEW2bWc46mgGXwB8WFLYZ2i
	 BmyUK8/ZWSSB68ITN6ZouphhbjLQbni0j3qC/px+ewUQbX9jKo52QGBMGwSCYpKniE
	 C20k2wE/ATntdD4anS+VAtEvfgv8w/UyXjQzqtEE3JD/VHMqh0HXLvqnHPrzMx4gO1
	 BqE63y/PqhbfRgx2UlaXy3DfiC+fTAnNtHIeHoZIZgJv1Stwm24NtAm/+5i4IlQDbd
	 vQXJnI6Jqs5Yw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 32BCB37820CC;
	Mon,  4 Mar 2024 17:03:52 +0000 (UTC)
Date: Mon, 4 Mar 2024 18:03:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Rob
 Herring <robh@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Message-ID: <20240304180350.74e7e385@collabora.com>
In-Reply-To: <51167b19-5a2c-4749-8b8c-b2a0e6050a33@arm.com>
References: <20240302154845.3223223-2-adrian.larumbe@collabora.com>
	<20240302154845.3223223-3-adrian.larumbe@collabora.com>
	<51167b19-5a2c-4749-8b8c-b2a0e6050a33@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Mar 2024 16:04:34 +0000
Steven Price <steven.price@arm.com> wrote:

> On 02/03/2024 15:48, Adri=C3=A1n Larumbe wrote:
> > Debugfs isn't always available in production builds that try to squeeze
> > every single byte out of the kernel image, but we still need a way to
> > toggle the timestamp and cycle counter registers so that jobs can be
> > profiled for fdinfo's drm engine and cycle calculations.
> >=20
> > Drop the debugfs knob and replace it with a sysfs file that accomplishes
> > the same functionality, and document its ABI in a separate file.
> >=20
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
>=20
> I'm happy with this.
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
> Boris: are you happy with the sysfs ABI, or would you like to
> investigate further the implications of leaving the counters enabled all
> the time during execution before committing to the sysfs ABI?

No, that's fine, but I have a few comments on the implementation.

> > +static ssize_t
> > +profiling_show(struct kobject *kobj, struct kobj_attribute *attr, char=
 *buf)
> > +{
> > +	bool *profile_mode =3D
> > +		&container_of(kobj, struct panfrost_device,
> > +			      profiling.base)->profiling.profile_mode;
> > +
> > +	return sysfs_emit(buf, "%d\n", *profile_mode);
> > +}
> > +
> > +static ssize_t
> > +profiling_store(struct kobject *kobj, struct kobj_attribute *attr,
> > +	       const char *buf, size_t count)
> > +{
> > +	bool *profile_mode =3D
> > +		&container_of(kobj, struct panfrost_device,
> > +			      profiling.base)->profiling.profile_mode;
> > +	int err, value;
> > +
> > +	err =3D kstrtoint(buf, 0, &value);

I'd suggest using kstrtobool() since you make the result a boolean
anyway.

> > +	if (err)
> > +		return err;
> > +
> > +	*profile_mode =3D !!value;
> > +
> > +	return count;
> > +}
> > +
> > +static const struct kobj_attribute profiling_status =3D
> > +__ATTR(status, 0644, profiling_show, profiling_store);
> > +
> > +static const struct kobj_type kobj_profile_type =3D {
> > +	.sysfs_ops =3D &kobj_sysfs_ops,
> > +};

DEVICE_ATTR(profiling, 0644, profiling_show, profiling_store);

?

> > +
> > +int panfrost_sysfs_init(struct panfrost_device *pfdev)
> > +{
> > +	struct device *kdev =3D pfdev->ddev->primary->kdev;
> > +	int err;
> > +
> > +	kobject_init(&pfdev->profiling.base, &kobj_profile_type);
> > +
> > +	err =3D kobject_add(&pfdev->profiling.base, &kdev->kobj, "%s", "profi=
ling");

Can we make it a device attribute instead of adding an extra kboj?

> > +	if (err)
> > +		return err;
> > +
> > +	err =3D sysfs_create_file(&pfdev->profiling.base, &profiling_status.a=
ttr);
> > +	if (err)
> > +		kobject_del(&pfdev->profiling.base);
> > +
> > +	return err;
> > +}

