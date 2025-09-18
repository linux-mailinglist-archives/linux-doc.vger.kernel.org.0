Return-Path: <linux-doc+bounces-56945-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EDB2E112
	for <lists+linux-doc@lfdr.de>; Wed, 20 Aug 2025 17:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 814751CC38A4
	for <lists+linux-doc@lfdr.de>; Wed, 20 Aug 2025 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB41326D72;
	Wed, 20 Aug 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPoisYSV"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E069322A0E
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703056; cv=none; b=uG0RwhtJgfEAcICD8s4FEi4C6wQtaHA4N77kQzzUK4pyrpkfKLuLhHwxD+1NzGr55C5M+T6Nu1+oRWYocLeLuZmVj8kxRx6hwMXqrfuqO2YoqLkLNqIX5/zh7mj1Fg1kIhOigP4RvCb9680Uq9w6LTRRuJyydHpN2YEkxBPCt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703056; c=relaxed/simple;
	bh=W4duEWOlM+udE5VNJ/zPTR+3z61gEew4hVyTyQpHZM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGehn+ilhmLSmSsPO1Q05YUvcO1s4N6u7cxec2Cfp4JiKw8KxMiVzP40Z3fHyLP0DMaQMsoaJljYRcCdwYaIwnto4mqrGibNiHMnAwJyXMQbcBUdvPlTlMDqB8iEltihNaI0WJ/lKtj2mOEEMV4BfgIIc/cJvVN6A22bNJMqJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPoisYSV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755703053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwfU+IsVElt3h1n12yQUuhxkyKNo90VrK/DGR70vyVI=;
	b=dPoisYSV/fK/fqqtztdIi9ArPThQTZgWEqzOmSFzZuoGSCDo+sr38PJP37vuHYOgUVvzOl
	OJKz6R/SvMK1sW1BDPbxSrMuY/4uFrjamlm4XXdtfj+Bnik5t1o3g6ecCW6BOYK9svgJiV
	m4whFb2AQOXRmJ++QYXJU2Nh9zul/Ik=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-9cokob0hPmiEY4p9zEvwTQ-1; Wed, 20 Aug 2025 11:17:32 -0400
X-MC-Unique: 9cokob0hPmiEY4p9zEvwTQ-1
X-Mimecast-MFC-AGG-ID: 9cokob0hPmiEY4p9zEvwTQ_1755703052
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2955f64b1so302831cf.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 08:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703052; x=1756307852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwfU+IsVElt3h1n12yQUuhxkyKNo90VrK/DGR70vyVI=;
        b=ojPbOBAx/b5EZooDXbJ2X2V7dXRBcqoK48vXQby60OGg9+GicjqG8vQ1WFMoQg3KuQ
         R1jG0xyL//eeepiJM6STXmeTpDMaiFnJpPue7kyn9QyMd8KQKzCAuXEWHjJvIWnHMvJX
         Y/f9AXcSABVWy5hQgt4dbPGzjPQ3napRaghbDvEuCvJT96EjucYaesVKGozt8QgiAuWA
         qR6AusSn9BLJvw2C6MeXbaVMr6ggJev7QAwgeMDOfeqzCtBk/cwr3csjzTASo05hmREq
         iz+U37/v9tq0xPWtXfWgyUWXfW3+f1Jjm2wMECijoOCgpa6KpC8nck8VBd0hjP4FvVeH
         16cQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3CAoF4DCB9b0E06YoHpnd1goKFlrLGb18jDpBsQxt0YyIzXMAZpVc5KICq8UWHNXlTAKq50v6f1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIr/qdtlOyu29h7aiWo2bz2a/ZlUXxmTBlE8djMpDZuQC1rVnZ
	qA5LW6aeL4xJe7cwic4Sqy0gJVAaKHSSJkiuNSsLNgrpbScKdGDmPkh+uEf/AeONj7gNc7wiQn+
	iFyNC1sMdwRP1Oq1a1DheiDe2dSGElWpucLeIMshNg1iT1MvLuZOvPMh7LfNRCNh+hXKNBQn08h
	AvgLtwWvp7NCEnoMnnkyq24ajlLhUJO+BtaboJ
X-Gm-Gg: ASbGncvP5jaXs5ig0el2o67eCeNHHHRdedxVArqtMNlTl50Cbun3XmSfBJKm6j9HoFN
	6RJRkk3IJAISDX6KZ6PgLZ54S7vXCU7I/kagu3F88DmU23txFZ3X5mKLz6HVzP0skW+B2A7PgCY
	33Qm1/8dDztBWWXDMfyKHZH8GrlYh3zdy4eagcmVNf01CqGjZmIz8g
X-Received: by 2002:a05:622a:5c93:b0:4af:203f:73e9 with SMTP id d75a77b69052e-4b291a45948mr38268841cf.3.1755703051781;
        Wed, 20 Aug 2025 08:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgNNXQPsAlJCg5PdYpqbUQjKk2La90rXTiB/Xg+AFCp6PDdl0eXQ9VodkzneYLfMLO6npPB65IGBnQ/QO7tyQ=
X-Received: by 2002:a05:622a:5c93:b0:4af:203f:73e9 with SMTP id
 d75a77b69052e-4b291a45948mr38268261cf.3.1755703051224; Wed, 20 Aug 2025
 08:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815121459.3391223-1-lichliu@redhat.com>
In-Reply-To: <20250815121459.3391223-1-lichliu@redhat.com>
From: Lichen Liu <lichliu@redhat.com>
Date: Wed, 20 Aug 2025 23:17:20 +0800
X-Gm-Features: Ac12FXz5J-qsSNe_dCy4Is9oFh6XR_1xsHJhV6_kkHN0LaUVbdz8uoGPSmN-wtU
Message-ID: <CAPmSd0OHB3orya=3V1icz4ZzOoAwHuWTqON_Dk+EaEcACtVtbg@mail.gmail.com>
Subject: Re: [PATCH v2] fs: Add 'rootfsflags' to set rootfs mount options
To: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	safinaskar@zohomail.com, kexec@lists.infradead.org, rob@landley.net, 
	weilongchen@huawei.com, cyphar@cyphar.com, linux-api@vger.kernel.org, 
	zohar@linux.ibm.com, stefanb@linux.ibm.com, initramfs@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all, do you have any comments for this v2 patch?

Thanks,
Lichen

On Fri, Aug 15, 2025 at 8:15=E2=80=AFPM Lichen Liu <lichliu@redhat.com> wro=
te:
>
> When CONFIG_TMPFS is enabled, the initial root filesystem is a tmpfs.
> By default, a tmpfs mount is limited to using 50% of the available RAM
> for its content. This can be problematic in memory-constrained
> environments, particularly during a kdump capture.
>
> In a kdump scenario, the capture kernel boots with a limited amount of
> memory specified by the 'crashkernel' parameter. If the initramfs is
> large, it may fail to unpack into the tmpfs rootfs due to insufficient
> space. This is because to get X MB of usable space in tmpfs, 2*X MB of
> memory must be available for the mount. This leads to an OOM failure
> during the early boot process, preventing a successful crash dump.
>
> This patch introduces a new kernel command-line parameter, rootfsflags,
> which allows passing specific mount options directly to the rootfs when
> it is first mounted. This gives users control over the rootfs behavior.
>
> For example, a user can now specify rootfsflags=3Dsize=3D75% to allow the
> tmpfs to use up to 75% of the available memory. This can significantly
> reduce the memory pressure for kdump.
>
> Consider a practical example:
>
> To unpack a 48MB initramfs, the tmpfs needs 48MB of usable space. With
> the default 50% limit, this requires a memory pool of 96MB to be
> available for the tmpfs mount. The total memory requirement is therefore
> approximately: 16MB (vmlinuz) + 48MB (loaded initramfs) + 48MB (unpacked
> kernel) + 96MB (for tmpfs) + 12MB (runtime overhead) =E2=89=88 220MB.
>
> By using rootfsflags=3Dsize=3D75%, the memory pool required for the 48MB
> tmpfs is reduced to 48MB / 0.75 =3D 64MB. This reduces the total memory
> requirement by 32MB (96MB - 64MB), allowing the kdump to succeed with a
> smaller crashkernel size, such as 192MB.
>
> An alternative approach of reusing the existing rootflags parameter was
> considered. However, a new, dedicated rootfsflags parameter was chosen
> to avoid altering the current behavior of rootflags (which applies to
> the final root filesystem) and to prevent any potential regressions.
>
> Also add documentation for the new kernel parameter "rootfsflags"
>
> This approach is inspired by prior discussions and patches on the topic.
> Ref: https://www.lightofdawn.org/blog/?viewDetailed=3D00128
> Ref: https://landley.net/notes-2015.html#01-01-2015
> Ref: https://lkml.org/lkml/2021/6/29/783
> Ref: https://www.kernel.org/doc/html/latest/filesystems/ramfs-rootfs-init=
ramfs.html#what-is-rootfs
>
> Signed-off-by: Lichen Liu <lichliu@redhat.com>
> Tested-by: Rob Landley <rob@landley.net>
> ---
> Changes in v2:
>   - Add documentation for the new kernel parameter.
>
>  Documentation/admin-guide/kernel-parameters.txt |  3 +++
>  fs/namespace.c                                  | 11 ++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index fb8752b42ec8..0c00f651d431 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6220,6 +6220,9 @@
>
>         rootflags=3D      [KNL] Set root filesystem mount option string
>
> +       rootfsflags=3D    [KNL] Set initial root filesystem mount option =
string
> +                       (e.g. tmpfs for initramfs)
> +
>         rootfstype=3D     [KNL] Set root filesystem type
>
>         rootwait        [KNL] Wait (indefinitely) for root device to show=
 up.
> diff --git a/fs/namespace.c b/fs/namespace.c
> index 8f1000f9f3df..e484c26d5e3f 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -65,6 +65,15 @@ static int __init set_mphash_entries(char *str)
>  }
>  __setup("mphash_entries=3D", set_mphash_entries);
>
> +static char * __initdata rootfs_flags;
> +static int __init rootfs_flags_setup(char *str)
> +{
> +       rootfs_flags =3D str;
> +       return 1;
> +}
> +
> +__setup("rootfsflags=3D", rootfs_flags_setup);
> +
>  static u64 event;
>  static DEFINE_XARRAY_FLAGS(mnt_id_xa, XA_FLAGS_ALLOC);
>  static DEFINE_IDA(mnt_group_ida);
> @@ -5677,7 +5686,7 @@ static void __init init_mount_tree(void)
>         struct mnt_namespace *ns;
>         struct path root;
>
> -       mnt =3D vfs_kern_mount(&rootfs_fs_type, 0, "rootfs", NULL);
> +       mnt =3D vfs_kern_mount(&rootfs_fs_type, 0, "rootfs", rootfs_flags=
);
>         if (IS_ERR(mnt))
>                 panic("Can't create rootfs");
>
> --
> 2.47.0
>


