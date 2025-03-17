Return-Path: <linux-doc+bounces-40976-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B3A639DC
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 02:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75CF7188E6BF
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 01:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5332E433C8;
	Mon, 17 Mar 2025 01:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aSx4eidn"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2BE571
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 01:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742174158; cv=none; b=ENjXEakYiEfuzuLXD12ddglBXriBXgPTebLFZT2Ja/o7+N+2phEcDZ9KgpoziCEr9NNB5aSA4lecKNVC+6DlW4FjsCK1zdWZ2snAZWU0Lic9Ik4XzsJin+cI2FFOEWo8y+EB6ZvPK+Xo8o/cZXOPR0gRSKuJF4JiSqfWgWU9Iqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742174158; c=relaxed/simple;
	bh=Q0+PIJ88a4iRAsJs1W5fwyu0AoevhoEEr/zt+lUAKjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6GAk/NdW9nX1m5r7wGhu4m3+u7PRh27fcSMbK2cXDx4z+b0vpwgK3VIKuPh8DQp+VHTnZulPdnUxbtx8piyIAj4GTO1FjLwHyaU75YMjC7OxIbSIeWY5m0AvIvnOVJx4DOfqq5OAhs1iB6PnL9K3IxYsLEuWfKGLAaYArxt7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aSx4eidn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742174155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqiRITvym1c0onqrnYAcV6zc/1khgZbdXRXq4ArYjQA=;
	b=aSx4eidnJm0TX99TX2t55AeBona4fd3S8VQ+cMiSgBQGx0pV8gcQGytxpSJQH3NiHFTxDT
	ooq66XCDORA9wl/JHvuNvDhcL8JPI+EB8nzYFGHk1vrPbRehAXWWtDyuC9Z+s9euc6elCT
	Dd5CGq072bmfJ4SMqq8GY2i6RImxP0Y=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-WrxjR_u-NxmM_0jx2SDIBA-1; Sun, 16 Mar 2025 21:15:54 -0400
X-MC-Unique: WrxjR_u-NxmM_0jx2SDIBA-1
X-Mimecast-MFC-AGG-ID: WrxjR_u-NxmM_0jx2SDIBA_1742174153
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so2008360a91.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Mar 2025 18:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742174153; x=1742778953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqiRITvym1c0onqrnYAcV6zc/1khgZbdXRXq4ArYjQA=;
        b=TFI7nicMRhyLQzsxQ1OteislFSRmm98pLpz3JSbab9iX2o3lNVr8oYqyDaiiK9axwF
         /Fyhvjx2ERhy1DSjkJ4ppR+rloygHDU7y9ft9k7zBASunzMmhkzxYzKPYX6ABh5zjNvg
         Kt2obasj/EBhS2FwOwkg1Ta3vs10onzQoDKx/m9NEk/kCuOrfOcufgYycx0KB+zbgn4s
         fDLQ2eEYkZT3drVkltpFJPGEF3uDJLPciKZL1OP4WLv2Itn9UjOD2H50/wnscd1shDeE
         dNlFwO3bnZSM4oP57V9SDJc2esJYrVb00hHGQB4ai7w2CmkdFEcj6UCAF3OD4+CMN7Ta
         IFIw==
X-Forwarded-Encrypted: i=1; AJvYcCUlaVfUijo+VcHZtita43OBSUcZfpdG53iDfa8ORisi1vgV8aAV8wOV/eqraKQE7FPrGI9DYjR3ZgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjtNk8KDdD4yByTavdzRUi451ZkDCx81Ve3VGu/hzkLfUv6Ax1
	uEIDTi++LLCBkgKqyA+A3nG67jxQMTvAhuPsx9GcDDVKxWobYGogbYCoJx/BFsp6bCU8hIDjzMX
	lAZTxVmsEUJNZvpATe4D5npGZ/02kY5+IcxBXewnwRZ7HnvRO7m2SlESzjDQKcng1Z3TdTup2eK
	bKYafQNycs6J2U3YWZYuAESWzkgGcE8IYI
X-Gm-Gg: ASbGncsai2cRWkIi5f1QD9DIR3gkEO9Yd8Vb/aaY/SC4IfbEFvnepduYRzBj8WXrsEk
	o18ZUNfaC2U0ayX+/lYM0DBNwg7pyNOreM5MJX/YUHvwR2wHrnB/TtS7OGqRsqgDP8cG4Hq8TVg
	==
X-Received: by 2002:a17:90a:d610:b0:2fe:9581:fbea with SMTP id 98e67ed59e1d1-30151d80d72mr13059900a91.29.1742174152922;
        Sun, 16 Mar 2025 18:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxpVZEUCtxPZyh7hATJuGyGFLhT6k6detJv2gwkDBKiP/VApC5tJcX/mSZDxnZ+e+OpQEJWcYXL+Lqzu0fpMQ=
X-Received: by 2002:a17:90a:d610:b0:2fe:9581:fbea with SMTP id
 98e67ed59e1d1-30151d80d72mr13059874a91.29.1742174152536; Sun, 16 Mar 2025
 18:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-rss-v9-0-df76624025eb@daynix.com> <20250307-rss-v9-6-df76624025eb@daynix.com>
 <CACGkMEuccQ6ah-aZ3tcW1VRuetEoPA_NaLxLT+9fb0uAab8Agg@mail.gmail.com>
 <2e550452-a716-4c3f-9d5a-3882d2c9912a@daynix.com> <CACGkMEu9tynRgTh__3p_vSqOekSirbVgS90rd5dUiJru9oV1eg@mail.gmail.com>
 <1dd2417a-3246-44b0-b4ba-feadfd6f794e@daynix.com> <CACGkMEthfj0KJvOHhnc_ww7iqtmhHUy9f9EGOoR-n0OwHOBrvQ@mail.gmail.com>
 <77c21953-b850-4962-8673-6effb593d819@daynix.com>
In-Reply-To: <77c21953-b850-4962-8673-6effb593d819@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 17 Mar 2025 09:15:40 +0800
X-Gm-Features: AQ5f1JpR0mxXkmVnrSX1gXa2p5ktJxpo4uYjioUOGsjKMLFJ1-a0iSEE4BZ4sls
Message-ID: <CACGkMEtMghoZbMO8c+30vqtOr3daEYrU2gG-QAZjOJev8NnBhQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 6/6] vhost/net: Support VIRTIO_NET_F_HASH_REPORT
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 1:59=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/03/12 12:36, Jason Wang wrote:
> > On Tue, Mar 11, 2025 at 2:24=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2025/03/11 9:42, Jason Wang wrote:
> >>> On Mon, Mar 10, 2025 at 3:04=E2=80=AFPM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
> >>>>
> >>>> On 2025/03/10 13:43, Jason Wang wrote:
> >>>>> On Fri, Mar 7, 2025 at 7:02=E2=80=AFPM Akihiko Odaki <akihiko.odaki=
@daynix.com> wrote:
> >>>>>>
> >>>>>> VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated o=
n the
> >>>>>> host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report =
no
> >>>>>> hash values (i.e., the hash_report member is always set to
> >>>>>> VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by th=
e
> >>>>>> underlying socket will be reported.
> >>>>>>
> >>>>>> VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.
> >>>>>>
> >>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>> Tested-by: Lei Yang <leiyang@redhat.com>
> >>>>>> ---
> >>>>>>     drivers/vhost/net.c | 49 +++++++++++++++++++++++++++++--------=
------------
> >>>>>>     1 file changed, 29 insertions(+), 20 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> >>>>>> index b9b9e9d40951856d881d77ac74331d914473cd56..16b241b44f89820a42=
c302f3586ea6bb5e0d4289 100644
> >>>>>> --- a/drivers/vhost/net.c
> >>>>>> +++ b/drivers/vhost/net.c
> >>>>>> @@ -73,6 +73,7 @@ enum {
> >>>>>>            VHOST_NET_FEATURES =3D VHOST_FEATURES |
> >>>>>>                             (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
> >>>>>>                             (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
> >>>>>> +                        (1ULL << VIRTIO_NET_F_HASH_REPORT) |
> >>>>>>                             (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
> >>>>>>                             (1ULL << VIRTIO_F_RING_RESET)
> >>>>>>     };
> >>>>>> @@ -1097,9 +1098,11 @@ static void handle_rx(struct vhost_net *net=
)
> >>>>>>                    .msg_controllen =3D 0,
> >>>>>>                    .msg_flags =3D MSG_DONTWAIT,
> >>>>>>            };
> >>>>>> -       struct virtio_net_hdr hdr =3D {
> >>>>>> -               .flags =3D 0,
> >>>>>> -               .gso_type =3D VIRTIO_NET_HDR_GSO_NONE
> >>>>>> +       struct virtio_net_hdr_v1_hash hdr =3D {
> >>>>>> +               .hdr =3D {
> >>>>>> +                       .flags =3D 0,
> >>>>>> +                       .gso_type =3D VIRTIO_NET_HDR_GSO_NONE
> >>>>>> +               }
> >>>>>>            };
> >>>>>>            size_t total_len =3D 0;
> >>>>>>            int err, mergeable;
> >>>>>> @@ -1110,7 +1113,6 @@ static void handle_rx(struct vhost_net *net)
> >>>>>>            bool set_num_buffers;
> >>>>>>            struct socket *sock;
> >>>>>>            struct iov_iter fixup;
> >>>>>> -       __virtio16 num_buffers;
> >>>>>>            int recv_pkts =3D 0;
> >>>>>>
> >>>>>>            mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
> >>>>>> @@ -1191,30 +1193,30 @@ static void handle_rx(struct vhost_net *ne=
t)
> >>>>>>                            vhost_discard_vq_desc(vq, headcount);
> >>>>>>                            continue;
> >>>>>>                    }
> >>>>>> +               hdr.hdr.num_buffers =3D cpu_to_vhost16(vq, headcou=
nt);
> >>>>>>                    /* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_=
NET_HDR */
> >>>>>>                    if (unlikely(vhost_hlen)) {
> >>>>>> -                       if (copy_to_iter(&hdr, sizeof(hdr),
> >>>>>> -                                        &fixup) !=3D sizeof(hdr))=
 {
> >>>>>> +                       if (copy_to_iter(&hdr, vhost_hlen,
> >>>>>> +                                        &fixup) !=3D vhost_hlen) =
{
> >>>>>>                                    vq_err(vq, "Unable to write vne=
t_hdr "
> >>>>>>                                           "at addr %p\n", vq->iov-=
>iov_base);
> >>>>>>                                    goto out;
> >>>>>
> >>>>> Is this an "issue" specific to RSS/HASH? If it's not, we need a sep=
arate patch.
> >>>>>
> >>>>> Honestly, I'm not sure if it's too late to fix this.
> >>>>
> >>>> There is nothing wrong with the current implementation.
> >>>
> >>> Note that I meant the vhost_hlen part, and the current code is tricky=
.
> >>>
> >>> The comment said:
> >>>
> >>> """
> >>> /* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
> >>> """
> >>>
> >>> So it tries to only offer virtio_net_hdr even if vhost_hlen is the se=
t
> >>> to mrg_rxbuf len.
> >>>
> >>> And this patch changes this behaviour.
> >>
> >> mrg_rxbuf only adds the num_buffers field, which is always set for
> >> mrg_rxbuf.
> >>
> >> The num_buffers was not set for VIRTIO_F_VERSION_1 in the past, but th=
is
> >> was also fixed with commit a3b9c053d82a ("vhost/net: Set num_buffers f=
or
> >> virtio 1.0")
> >>
> >> So there is no behavioral change for existing features with this patch=
.
> >
> > I meant this part.
> >
> >>>>> +                       if (copy_to_iter(&hdr, vhost_hlen,
> >>>>> +                                        &fixup) !=3D vhost_hlen) {
> >
> > We should copy only sizeof(hdr) instead of vhost_hlen.> > Anything I mi=
ss?
>
> sizeof(hdr) will be greater than vhost_hlen when neither
> VIRTIO_NET_F_MRG_RXBUF or VIRTIO_F_VERSION_1 is negotiated.

Just to make sure we are on the same page I meant we should only
advance sizeof(struct virtio_net_hdr) here to make sure we can set the
num_buffers correctly.

But this is not what the code did here.

Thanks

>
> Regards,
> Akihiko Odaki
>
> >
> > Thanks
> >
> >>
> >> Regards,
> >> Akihiko Odaki
> >>
> >>>
> >>> Thanks
> >>>
> >>>> The current
> >>>> implementation fills the header with zero except num_buffers, which =
it
> >>>> fills some real value. This functionality is working fine with
> >>>> VIRTIO_NET_F_MRG_RXBUF and VIRTIO_F_VERSION_1, which change the head=
er size.
> >>>>
> >>>> Now I'm adding VIRTIO_NET_F_HASH_REPORT and it adds the hash_report
> >>>> field, which also needs to be initialized with zero, so I'm making s=
ure
> >>>> vhost_net will also initialize it.
> >>>>
> >>>> Regards,
> >>>> Akihiko Odaki
> >>>>
> >>>>>
> >>>>> Others look fine.
> >>>>>
> >>>>> Thanks
> >>>>>
> >>>>
> >>>
> >>
> >
>


