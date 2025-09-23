Return-Path: <linux-doc+bounces-61579-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79810B96267
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 16:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C3403A2997
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 14:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD07221F20;
	Tue, 23 Sep 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/fxldMF"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F721FF38
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758636438; cv=none; b=cuycNDF54c8R9pbQSSidwqwM+yvDt7raRFinZ/CSa8uCfv8EHr8WVq1mtTOIYkYnRh5rUKYbYWMLA9edOvWw5vWSwKOWEPOgzpR2DuuW+gKtNi13vcI9f+26IMqrUkS3hL5ZeItvnrQTv+3kisI0PYxZMpOlVjCExxS5icTUbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758636438; c=relaxed/simple;
	bh=/2mleWLHIZh05MZ05yH7xTymq55hXfOh+CwN3zLm+GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/5IGJ5JE1jjjTFRw/f4RtNcvQOZQEwrizZqw6sDHA4U+K4e88LZyiPaYVGu/0YUoqG1hiuQDgqz8c4izKsONLI+FyKVqtTjYAgt0h05btunxP3BgQu9heLHjvWW7xHv+OLJW1C69gJ/IHE0qaBf4Lfzx5F8PyUXKUqAYFzlbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/fxldMF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758636435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kjyw9mS8YzbSQhc83g2Zp4AXhZWU1Nn9EGqrXHlT0FA=;
	b=R/fxldMFnHc4FH6pJb9E5uQQcCdGZJqHY8xz5gt8ulXzgh+1ghgw2iOoOvLJ/XTSTYtS+m
	g3thTFJKueCsx9bEvPaJcWJa70/f6SAA4WOd2PUg3eYp9r4RANmJpcFKxXZaDccAPmCI1c
	LGdQ+EFzbInoyJAxzLavgV6DmBxILyQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-Ct77egjDOiyMeZKLD_FE4Q-1; Tue, 23 Sep 2025 10:07:14 -0400
X-MC-Unique: Ct77egjDOiyMeZKLD_FE4Q-1
X-Mimecast-MFC-AGG-ID: Ct77egjDOiyMeZKLD_FE4Q_1758636432
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-333f8ddf072so22530771fa.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758636431; x=1759241231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjyw9mS8YzbSQhc83g2Zp4AXhZWU1Nn9EGqrXHlT0FA=;
        b=JvBtuEMvRZb0lW602XI4zr0Ta92g3ukb07P4E1O8O+Pq5E67fKEVjY0W5JORMZDOAC
         Ogc/rHnjp6qrozQQ43GIdNdi0dE2dTwCfcJBzo9rOAg7w+kFxCbLecYoiZXQWgQ49/32
         y5wVBxqgYpttpLMEZL9yHK+vmbsiAzUZhFCOKEW4FrfIxR/NN7Dw7ketMJZ4mpRkmeGj
         RLWrOaYOHvRT98AJMHuLB4eUC4ePBEYXweBL1OMSiLTYp8cMJ6KgdMaAroF0S0Ukq3xh
         ohFHLVpFB1yFSCERUVF/U5x8vUPCFnBZNwATvWfJz9TpCdyZvke4ZgnEFf0pXkSLbEFr
         PwxA==
X-Forwarded-Encrypted: i=1; AJvYcCXHfkXGGjxmnXamOZBqrc7+eoLpD7ijeisYuYjhU51KG3NiiWQq4NVYcCVxZcjMCnCx7in9/ASRwro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3F8F2K8T9fT1hVMTB0+oStlz+z0Jf28lMATtAnNBlaqPX0AHs
	Ms+X7JFD9lYWUNdSxhjg7RYIvjws45NH0acSKe8VZ5XD980uXTEelzBZwEfRPilzy/OJM3dTM0Y
	kep/GLLLSQq4J3wnCm3br9VsResOYwdAvgCz7fg5WPFykB5JS4hDg1sdFC0CHfjS+YVmAkF484j
	N6ZPll9LapXMqi4yL6OoxnxQEGQZwj4OAgsPEUBtLs4IDY
X-Gm-Gg: ASbGncubKGqgl5ce4LcFHV/4/ijZBOlx4RTDi3uCmctvLT3VqGirCNACCokAF2dgmgw
	cGO1O3bq6HAaeWJD0bugOamcdQWnKGiyNHwdEj486SQu4nZ+lGZx6IBhf4m/fiaoPEcKmbRB2Hw
	f48Kr2LUwU996N6FiNwSNAfQ==
X-Received: by 2002:a2e:b8c2:0:b0:350:690e:219 with SMTP id 38308e7fff4ca-36d16dec9e3mr11195841fa.33.1758636431149;
        Tue, 23 Sep 2025 07:07:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnvdcfAZXkkguji5J5L9DB0ruMNmkGB0D8m4uGELGy0j9NTHF/TaRKRd8lfyRGyyozct9JnDYa8vkQaFkAT1Q=
X-Received: by 2002:a2e:b8c2:0:b0:350:690e:219 with SMTP id
 38308e7fff4ca-36d16dec9e3mr11195701fa.33.1758636430471; Tue, 23 Sep 2025
 07:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918115759.334067-1-linan666@huaweicloud.com>
 <20250918115759.334067-3-linan666@huaweicloud.com> <CALTww2_4rEb9SojpVbwFy=ZEjUc0-4ECYZKYKgsay9XzDTs-cg@mail.gmail.com>
 <b7fc02d2-7643-4bf1-1b15-c1ecdf883c87@huaweicloud.com>
In-Reply-To: <b7fc02d2-7643-4bf1-1b15-c1ecdf883c87@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 23 Sep 2025 22:06:58 +0800
X-Gm-Features: AS18NWDDDJ0K9e_QG6qURe6CQv1sgIdakMjaBaPZ9EzAF-b5kDVQqe-3LBBgdg4
Message-ID: <CALTww2_knuDVWLtVzrqcuLH5dmiyMqkAaZr2DB_ZpCYPQsYH0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] md: allow configuring logical block size
To: Li Nan <linan666@huaweicloud.com>
Cc: corbet@lwn.net, song@kernel.org, yukuai3@huawei.com, hare@suse.de, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, martin.petersen@oracle.com, yangerkun@huawei.com, 
	yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 9:37=E2=80=AFPM Li Nan <linan666@huaweicloud.com> w=
rote:
>
>
>
> =E5=9C=A8 2025/9/23 19:36, Xiao Ni =E5=86=99=E9=81=93:
> > Hi Li Nan
> >
> > On Thu, Sep 18, 2025 at 8:08=E2=80=AFPM <linan666@huaweicloud.com> wrot=
e:
> >>
> >> From: Li Nan <linan122@huawei.com>
> >>
> >> Previously, raid array used the maximum logical block size (LBS)
> >> of all member disks. Adding a larger LBS disk at runtime could
> >> unexpectedly increase RAID's LBS, risking corruption of existing
> >> partitions. This can be reproduced by:
> >>
> >> ```
> >>    # LBS of sd[de] is 512 bytes, sdf is 4096 bytes.
> >>    mdadm -CRq /dev/md0 -l1 -n3 /dev/sd[de] missing --assume-clean
> >>
> >>    # LBS is 512
> >>    cat /sys/block/md0/queue/logical_block_size
> >>
> >>    # create partition md0p1
> >>    parted -s /dev/md0 mklabel gpt mkpart primary 1MiB 100%
> >>    lsblk | grep md0p1
> >>
> >>    # LBS becomes 4096 after adding sdf
> >>    mdadm --add -q /dev/md0 /dev/sdf
> >>    cat /sys/block/md0/queue/logical_block_size
> >>
> >>    # partition lost
> >>    partprobe /dev/md0
> >>    lsblk | grep md0p1
> >> ```
> >
> > Thanks for the reproducer. I can reproduce it myself.
> >
> >>
> >> Simply restricting larger-LBS disks is inflexible. In some scenarios,
> >> only disks with 512 bytes LBS are available currently, but later, disk=
s
> >> with 4KB LBS may be added to the array.
> >
> > If we add a disk with 4KB LBS and configure it to 4KB by the sysfs
> > interface, how can we make the partition table readable and avoid the
> > problem mentioned above?
> >
>

Hi

> Thanks for your review.
>
> The main cause of partition loss is LBS changes. Therefore, we should
> specify a 4K LBS at creation time, instead of modifying LBS after the RAI=
D
> is already in use. For example:
>
> mdadm -C --logical-block-size=3D4096 ...
>
> In this way, even if all underlying disks are 512-byte, the RAID will be
> created with a 4096 LBS. Adding 4096-byte disks later will not cause any
> issues.

It can work. But it looks strange to me to set LBS to 4096 but all
devices' LBS is 512 bytes. I don't reject it anyway :)

>
> >>
> >> Making LBS configurable is the best way to solve this scenario.
> >> After this patch, the raid will:
> >>    - store LBS in disk metadata
> >>    - add a read-write sysfs 'mdX/logical_block_size'
> >>
> >> Future mdadm should support setting LBS via metadata field during RAID
> >> creation and the new sysfs. Though the kernel allows runtime LBS chang=
es,
> >> users should avoid modifying it after creating partitions or filesyste=
ms
> >> to prevent compatibility issues.
> >>
> >> Only 1.x metadata supports configurable LBS. 0.90 metadata inits all
> >> fields to default values at auto-detect. Supporting 0.90 would require
> >> more extensive changes and no such use case has been observed.
> >>
> >> Note that many RAID paths rely on PAGE_SIZE alignment, including for
> >> metadata I/O. A larger LBS than PAGE_SIZE will result in metadata
> >> read/write failures. So this config should be prevented.
> >>
> >> Signed-off-by: Li Nan <linan122@huawei.com>
> >> ---
> >>   Documentation/admin-guide/md.rst |  7 +++
> >>   drivers/md/md.h                  |  1 +
> >>   include/uapi/linux/raid/md_p.h   |  3 +-
> >>   drivers/md/md-linear.c           |  1 +
> >>   drivers/md/md.c                  | 75 ++++++++++++++++++++++++++++++=
++
> >>   drivers/md/raid0.c               |  1 +
> >>   drivers/md/raid1.c               |  1 +
> >>   drivers/md/raid10.c              |  1 +
> >>   drivers/md/raid5.c               |  1 +
> >>   9 files changed, 90 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-gu=
ide/md.rst
> >> index 1c2eacc94758..f5c81fad034a 100644
> >> --- a/Documentation/admin-guide/md.rst
> >> +++ b/Documentation/admin-guide/md.rst
> >> @@ -238,6 +238,13 @@ All md devices contain:
> >>        the number of devices in a raid4/5/6, or to support external
> >>        metadata formats which mandate such clipping.
> >>
> >> +  logical_block_size
> >> +     Configures the array's logical block size in bytes. This attribu=
te
> >> +     is only supported for RAID1, RAID5, RAID10 with 1.x meta. The va=
lue
> >
> > s/RAID5/RAID456/g
> >
>
> I will fix it later. Thanks.
>
> >> +     should be written before starting the array. The final array LBS
> >> +     will use the max value between this configuration and all rdev's=
 LBS.
> >> +     Note that LBS cannot exceed PAGE_SIZE.
> >> +
> >>     reshape_position
> >>        This is either ``none`` or a sector number within the devices o=
f
> >>        the array where ``reshape`` is up to.  If this is set, the thre=
e
> >> diff --git a/drivers/md/md.h b/drivers/md/md.h
> >> index afb25f727409..b0147b98c8d3 100644
> >> --- a/drivers/md/md.h
> >> +++ b/drivers/md/md.h
> >> @@ -432,6 +432,7 @@ struct mddev {
> >>          sector_t                        array_sectors; /* exported ar=
ray size */
> >>          int                             external_size; /* size manage=
d
> >>                                                          * externally =
*/
> >> +       unsigned int                    logical_block_size;
> >>          __u64                           events;
> >>          /* If the last 'event' was simply a clean->dirty transition, =
and
> >>           * we didn't write it to the spares, then it is safe and simp=
le
> >> diff --git a/include/uapi/linux/raid/md_p.h b/include/uapi/linux/raid/=
md_p.h
> >> index ac74133a4768..310068bb2a1d 100644
> >> --- a/include/uapi/linux/raid/md_p.h
> >> +++ b/include/uapi/linux/raid/md_p.h
> >> @@ -291,7 +291,8 @@ struct mdp_superblock_1 {
> >>          __le64  resync_offset;  /* data before this offset (from data=
_offset) known to be in sync */
> >>          __le32  sb_csum;        /* checksum up to devs[max_dev] */
> >>          __le32  max_dev;        /* size of devs[] array to consider *=
/
> >> -       __u8    pad3[64-32];    /* set to 0 when writing */
> >> +       __le32  logical_block_size;     /* same as q->limits->logical_=
block_size */
> >> +       __u8    pad3[64-36];    /* set to 0 when writing */
> >>
> >>          /* device state information. Indexed by dev_number.
> >>           * 2 bytes per device
> >> diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
> >> index 5d9b08115375..da8babb8da59 100644
> >> --- a/drivers/md/md-linear.c
> >> +++ b/drivers/md/md-linear.c
> >> @@ -72,6 +72,7 @@ static int linear_set_limits(struct mddev *mddev)
> >>
> >>          md_init_stacking_limits(&lim);
> >>          lim.max_hw_sectors =3D mddev->chunk_sectors;
> >> +       lim.logical_block_size =3D mddev->logical_block_size;
> >>          lim.max_write_zeroes_sectors =3D mddev->chunk_sectors;
> >>          lim.io_min =3D mddev->chunk_sectors << 9;
> >>          err =3D mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTE=
GRITY);
> >> diff --git a/drivers/md/md.c b/drivers/md/md.c
> >> index 40f56183c744..e0184942c8ec 100644
> >> --- a/drivers/md/md.c
> >> +++ b/drivers/md/md.c
> >> @@ -1963,6 +1963,7 @@ static int super_1_validate(struct mddev *mddev,=
 struct md_rdev *freshest, struc
> >>                  mddev->layout =3D le32_to_cpu(sb->layout);
> >>                  mddev->raid_disks =3D le32_to_cpu(sb->raid_disks);
> >>                  mddev->dev_sectors =3D le64_to_cpu(sb->size);
> >> +               mddev->logical_block_size =3D le32_to_cpu(sb->logical_=
block_size);
> >>                  mddev->events =3D ev1;
> >>                  mddev->bitmap_info.offset =3D 0;
> >>                  mddev->bitmap_info.space =3D 0;
> >> @@ -2172,6 +2173,7 @@ static void super_1_sync(struct mddev *mddev, st=
ruct md_rdev *rdev)
> >>          sb->chunksize =3D cpu_to_le32(mddev->chunk_sectors);
> >>          sb->level =3D cpu_to_le32(mddev->level);
> >>          sb->layout =3D cpu_to_le32(mddev->layout);
> >> +       sb->logical_block_size =3D cpu_to_le32(mddev->logical_block_si=
ze);
> >>          if (test_bit(FailFast, &rdev->flags))
> >>                  sb->devflags |=3D FailFast1;
> >>          else
> >> @@ -5900,6 +5902,66 @@ static struct md_sysfs_entry md_serialize_polic=
y =3D
> >>   __ATTR(serialize_policy, S_IRUGO | S_IWUSR, serialize_policy_show,
> >>          serialize_policy_store);
> >>
> >> +static int mddev_set_logical_block_size(struct mddev *mddev,
> >> +                               unsigned int lbs)
> >> +{
> >> +       int err =3D 0;
> >> +       struct queue_limits lim;
> >> +
> >> +       if (queue_logical_block_size(mddev->gendisk->queue) >=3D lbs) =
{
> >> +               pr_err("%s: incompatible logical_block_size %u, can no=
t set\n",
> >> +                      mdname(mddev), lbs);
> >
> > Is it better to print the mddev's LBS and give the message "it can't
> > set lbs smaller than mddev logical block size"?
> >
>
> I agree. Let me improve this.
>
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       lim =3D queue_limits_start_update(mddev->gendisk->queue);
> >> +       lim.logical_block_size =3D lbs;
> >> +       pr_info("%s: logical_block_size is changed, data may be lost\n=
",
> >> +               mdname(mddev));
> >> +       err =3D queue_limits_commit_update(mddev->gendisk->queue, &lim=
);
> >> +       if (err)
> >> +               return err;
> >> +
> >> +       mddev->logical_block_size =3D lbs;
> >> +       return 0;
> >> +}
> >> +
> >> +static ssize_t
> >> +lbs_show(struct mddev *mddev, char *page)
> >> +{
> >> +       return sprintf(page, "%u\n", mddev->logical_block_size);
> >> +}
> >> +
> >> +static ssize_t
> >> +lbs_store(struct mddev *mddev, const char *buf, size_t len)
> >> +{
> >> +       unsigned int lbs;
> >> +       int err =3D -EBUSY;
> >> +
> >> +       /* Only 1.x meta supports configurable LBS */
> >> +       if (mddev->major_version =3D=3D 0)
> >> +               return -EINVAL;
> >
> > It looks like it should check raid level here as doc mentioned above, r=
ight?
>
> Yeah, kuai suggests supporting this feature only in 1.x meta.

I mean it should check if raid is raid0 here, right? As doc mentioned,
it should return error if raid is level 0.

Regards
Xiao
>
>
> --
> Thanks,
> Nan
>
>


