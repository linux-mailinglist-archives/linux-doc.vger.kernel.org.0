Return-Path: <linux-doc+bounces-39867-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E5A4D425
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 07:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A835B1896FBC
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 06:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C36F1F5408;
	Tue,  4 Mar 2025 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VblumwuK"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7491F4735
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741071512; cv=none; b=qxMsapPxB2IzavqyFmO5h7rtUu4pn9bVvnwAhoTEF+3rlptCa0LfWMg1g04YxfqcBWaBmO7G5+AwoIEUIoqKSuQMSlIuzDOkIHXkszamAYPRiz8CZTn8mbWsGFsaJK/DlCSpEdDkP9iccV/Kzeh+Qm35HJI1JY/xDUYbsfbZlVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741071512; c=relaxed/simple;
	bh=SX8vXzzjWYv3Umv9VxLpv8x53vWXrr2wDjbcZsDWNfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePBztDWqbkjOYMgXJRonJkrEX2mKFGP9KELj75jTqVZLayFE/5o5rjtmD9Wche5ssRL3QsdQWqex20Ryb7lwpjv02QaWkxBtbMGubZ42PuJwKOvN5NYbhpbctnrbHSNhSC5VV0zWDuXkMF/2/AZpyI8QJbgNy7bfCDguVcjnKZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VblumwuK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741071508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJ4q+O+sWNbVB7yATn6ZER3KODzkdvW23G3alTGR47E=;
	b=VblumwuKcOXlBwEsd25CL9n0efu4+oJ9YEVu0YfBZ6BuF4oENSr2BbRL1CmsVl0A/HAg5I
	k7eTXWsXaWB/WSi/hRdGCnH7VLWfJxpQjfwemiIxUSiY9KPup5ZiTgir7GnHk18ltG95yl
	QP2sYUhfr+6aWlNBhvq56GG2q6TwIcg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-eFdsqc8kMW2mjlmIXPfO5A-1; Tue, 04 Mar 2025 01:58:26 -0500
X-MC-Unique: eFdsqc8kMW2mjlmIXPfO5A-1
X-Mimecast-MFC-AGG-ID: eFdsqc8kMW2mjlmIXPfO5A_1741071506
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22366bcf24bso74619055ad.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 22:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741071506; x=1741676306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJ4q+O+sWNbVB7yATn6ZER3KODzkdvW23G3alTGR47E=;
        b=Xbu/3HRf1f/u+zrSnX8uB+1O9TzlrmnpR0yy81ywVaTvG1oAgLK0Cpwv8tEFkXZtAj
         SP97XZK7Mh0NXB0Z9lzrlLmnO7IM3ltT/Um3V+IbVhnLWt2wXoryM7IK9pFweNnwcQmo
         1Au2ORsITn6RFGzYwjCBHmx5WMzyM2lJy9+vhxF9C5sRwyeQmLh8BRiGlayeNe2jaXDN
         A6KH7JEsxrcQ9hHFnot49gsxSj1verxfnn+eYT/ODNYCIAvldiZAPlO7TCCXmGbnZL8v
         F5o1mLARQkp5A6CMH/vxRBmP3xdg+DiUk1bPrJk9Zcw1bGLQNA3zXBVbooqw8C14Kkis
         2g2g==
X-Forwarded-Encrypted: i=1; AJvYcCXhTJOLK/nye5Cu68/zqBDaNz8X6Zo1VqQtsyP5TMVCbPS6q0OgBjmW5zpe+RAWgrQwtubQq5gdviE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8FQYS+JxRVun6b1KKEJbCBLhSDCcxbVbQO2dKTCwqWQzanGW
	O66BY044Vp+EF1k2qlmR07BvTRdXhUD9lSJnQ1AiY/Kd/wEI1EyOLHEI5JG5Ut/r5isleB8MvAS
	p2gVb1tjfAJRQ/7cnSZYaS5Y51L5UC1H7r11mm7yI12dt/yPyVoHuU/9ov2xEMbXj0gDMOr/Jmk
	io0oR2swy0XUk8DE25DiazCqazB2s9hAND
X-Gm-Gg: ASbGncsHwQ9QwHJj5OgYKdnBXaMnEmM7nMWfcgzvxfWshhKmnGPr2pUDByXrxIveqSq
	CNOcMY9+2LtCWEvkMz37EmjgAZvlWO7rY7E/mCi/vYAvQrRLWIb9XAr/Qvg/0Y9nMltU/7z+7gQ
	==
X-Received: by 2002:a17:902:ce0d:b0:223:4b8d:32f7 with SMTP id d9443c01a7336-22368fa9062mr227933005ad.19.1741071505415;
        Mon, 03 Mar 2025 22:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIpgHKcbDPRRrgArStekvVIA5rjfRQLjiTyltf1TWO6Y202D/FweT047CivhGZEESU+RGIAecJGWvzi2dO34Q=
X-Received: by 2002:a17:902:ce0d:b0:223:4b8d:32f7 with SMTP id
 d9443c01a7336-22368fa9062mr227932585ad.19.1741071504786; Mon, 03 Mar 2025
 22:58:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-rss-v7-0-844205cbbdd6@daynix.com> <20250228-rss-v7-3-844205cbbdd6@daynix.com>
In-Reply-To: <20250228-rss-v7-3-844205cbbdd6@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 4 Mar 2025 14:58:12 +0800
X-Gm-Features: AQ5f1JrzuO7Qw-lxRKXfRPhN-c858WDcskIUM4X_6bkj11KtbJjMPTMTrP748Cs
Message-ID: <CACGkMEuMhXp0r09n09PQhGEJujPehSnM3O2bydGvCNhdGefHZA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 3/6] tun: Introduce virtio-net hash feature
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
	Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 3:59=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> Hash reporting
> --------------
>
> Allow the guest to reuse the hash value to make receive steering
> consistent between the host and guest, and to save hash computation.
>
> RSS
> ---
>
> RSS is a receive steering algorithm that can be negotiated to use with
> virtio_net. Conventionally the hash calculation was done by the VMM.
> However, computing the hash after the queue was chosen defeats the
> purpose of RSS.
>
> Another approach is to use eBPF steering program. This approach has
> another downside: it cannot report the calculated hash due to the
> restrictive nature of eBPF steering program.
>
> Introduce the code to perform RSS to the kernel in order to overcome
> thse challenges. An alternative solution is to extend the eBPF steering
> program so that it will be able to report to the userspace, but I didn't
> opt for it because extending the current mechanism of eBPF steering
> program as is because it relies on legacy context rewriting, and
> introducing kfunc-based eBPF will result in non-UAPI dependency while
> the other relevant virtualization APIs such as KVM and vhost_net are
> UAPIs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  Documentation/networking/tuntap.rst |   7 ++
>  drivers/net/Kconfig                 |   1 +
>  drivers/net/tap.c                   |  62 ++++++++++++-
>  drivers/net/tun.c                   |  89 ++++++++++++++----
>  drivers/net/tun_vnet.h              | 180 ++++++++++++++++++++++++++++++=
+++---
>  include/linux/if_tap.h              |   2 +
>  include/linux/skbuff.h              |   3 +
>  include/uapi/linux/if_tun.h         |  75 +++++++++++++++
>  net/core/skbuff.c                   |   4 +
>  9 files changed, 390 insertions(+), 33 deletions(-)
>
> diff --git a/Documentation/networking/tuntap.rst b/Documentation/networki=
ng/tuntap.rst
> index 4d7087f727be5e37dfbf5066a9e9c872cc98898d..86b4ae8caa8ad062c1e558920=
be42ce0d4217465 100644
> --- a/Documentation/networking/tuntap.rst
> +++ b/Documentation/networking/tuntap.rst
> @@ -206,6 +206,13 @@ enable is true we enable it, otherwise we disable it=
::
>        return ioctl(fd, TUNSETQUEUE, (void *)&ifr);
>    }
>
> +3.4 Reference
> +-------------
> +
> +``linux/if_tun.h`` defines the interface described below:
> +
> +.. kernel-doc:: include/uapi/linux/if_tun.h
> +
>  Universal TUN/TAP device driver Frequently Asked Question
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> index 1fd5acdc73c6af0e1a861867039c3624fc618e25..aecfd244dd83585fea2c5b815=
dcd787c58166c28 100644
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -395,6 +395,7 @@ config TUN
>         tristate "Universal TUN/TAP device driver support"
>         depends on INET
>         select CRC32
> +       select SKB_EXTENSIONS
>         help
>           TUN/TAP provides packet reception and transmission for user spa=
ce
>           programs.  It can be viewed as a simple Point-to-Point or Ether=
net
> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index d4ece538f1b23789ca60caa6232690e4d0a4d14a..06c6df153a30a4acbcaff8619=
b0b4229eb638664 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -49,6 +49,10 @@ struct major_info {
>         struct list_head next;
>  };
>
> +struct tap_skb_cb {
> +       struct virtio_net_hash hash;
> +};
> +
>  #define GOODCOPY_LEN 128
>
>  static const struct proto_ops tap_socket_ops;
> @@ -179,6 +183,22 @@ static void tap_put_queue(struct tap_queue *q)
>         sock_put(&q->sk);
>  }
>
> +static struct tap_skb_cb *tap_skb_cb(const struct sk_buff *skb)
> +{
> +       BUILD_BUG_ON(sizeof(skb->cb) < sizeof(struct tap_skb_cb));
> +       return (struct tap_skb_cb *)skb->cb;
> +}
> +
> +static struct virtio_net_hash *tap_add_hash(struct sk_buff *skb)
> +{
> +       return &tap_skb_cb(skb)->hash;
> +}
> +
> +static const struct virtio_net_hash *tap_find_hash(const struct sk_buff =
*skb)
> +{
> +       return &tap_skb_cb(skb)->hash;
> +}
> +
>  /*
>   * Select a queue based on the rxq of the device on which this packet
>   * arrived. If the incoming device is not mq, calculate a flow hash
> @@ -189,6 +209,7 @@ static void tap_put_queue(struct tap_queue *q)
>  static struct tap_queue *tap_get_queue(struct tap_dev *tap,
>                                        struct sk_buff *skb)
>  {
> +       struct flow_keys_basic keys_basic;
>         struct tap_queue *queue =3D NULL;
>         /* Access to taps array is protected by rcu, but access to numvta=
ps
>          * isn't. Below we use it to lookup a queue, but treat it as a hi=
nt
> @@ -196,17 +217,43 @@ static struct tap_queue *tap_get_queue(struct tap_d=
ev *tap,
>          * racing against queue removal.
>          */
>         int numvtaps =3D READ_ONCE(tap->numvtaps);
> +       struct tun_vnet_hash_container *vnet_hash =3D rcu_dereference(tap=
->vnet_hash);
>         __u32 rxq;
>
> +       *tap_skb_cb(skb) =3D (struct tap_skb_cb) {
> +               .hash =3D { .report =3D VIRTIO_NET_HASH_REPORT_NONE }
> +       };
> +
>         if (!numvtaps)
>                 goto out;
>
>         if (numvtaps =3D=3D 1)
>                 goto single;
>
> +       if (vnet_hash && (vnet_hash->common.flags & TUN_VNET_HASH_RSS)) {
> +               rxq =3D tun_vnet_rss_select_queue(numvtaps, vnet_hash, sk=
b, tap_add_hash);
> +               queue =3D rcu_dereference(tap->taps[rxq]);
> +               goto out;
> +       }
> +
> +       if (!skb->l4_hash && !skb->sw_hash) {
> +               struct flow_keys keys;
> +
> +               skb_flow_dissect_flow_keys(skb, &keys, FLOW_DISSECTOR_F_S=
TOP_AT_FLOW_LABEL);
> +               rxq =3D flow_hash_from_keys(&keys);
> +               keys_basic =3D (struct flow_keys_basic) {
> +                       .control =3D keys.control,
> +                       .basic =3D keys.basic
> +               };
> +       } else {
> +               skb_flow_dissect_flow_keys_basic(NULL, skb, &keys_basic, =
NULL, 0, 0, 0,
> +                                                FLOW_DISSECTOR_F_STOP_AT=
_FLOW_LABEL);
> +               rxq =3D skb->hash;
> +       }

Can we avoid those when hash is not enabled?

> +
>         /* Check if we can use flow to select a queue */
> -       rxq =3D skb_get_hash(skb);
>         if (rxq) {
> +               tun_vnet_hash_report(vnet_hash, skb, &keys_basic, rxq, ta=
p_add_hash);
>                 queue =3D rcu_dereference(tap->taps[rxq % numvtaps]);
>                 goto out;
>         }
> @@ -711,11 +758,12 @@ static ssize_t tap_put_user(struct tap_queue *q,
>         int total;
>
>         if (q->flags & IFF_VNET_HDR) {
> -               struct virtio_net_hdr vnet_hdr;
> +               struct virtio_net_hdr_v1_hash vnet_hdr;
>
>                 vnet_hdr_len =3D READ_ONCE(q->vnet_hdr_sz);
>
> -               ret =3D tun_vnet_hdr_from_skb(q->flags, NULL, skb, &vnet_=
hdr);
> +               ret =3D tun_vnet_hdr_from_skb(vnet_hdr_len, q->flags, NUL=
L, skb,
> +                                           tap_find_hash, &vnet_hdr);
>                 if (ret)
>                         return ret;
>
> @@ -1023,7 +1071,13 @@ static long tap_ioctl(struct file *file, unsigned =
int cmd,
>                 return ret;
>
>         default:
> -               return tun_vnet_ioctl(&q->vnet_hdr_sz, &q->flags, cmd, sp=
);
> +               rtnl_lock();
> +               tap =3D rtnl_dereference(q->tap);
> +               ret =3D tun_vnet_ioctl(&q->vnet_hdr_sz, &q->flags,
> +                                    tap ? &tap->vnet_hash : NULL, -EINVA=
L,
> +                                    true, cmd, sp);
> +               rtnl_unlock();
> +               return ret;
>         }
>  }
>
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index d8f4d3e996a7a81d1f8b04635054081671a14f07..8c9dd87ddce023baa94ab858c=
eed0d67dd9527da 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -209,6 +209,7 @@ struct tun_struct {
>         struct bpf_prog __rcu *xdp_prog;
>         struct tun_prog __rcu *steering_prog;
>         struct tun_prog __rcu *filter_prog;
> +       struct tun_vnet_hash_container __rcu *vnet_hash;
>         struct ethtool_link_ksettings link_ksettings;
>         /* init args */
>         struct file *file;
> @@ -451,20 +452,37 @@ static inline void tun_flow_save_rps_rxhash(struct =
tun_flow_entry *e, u32 hash)
>                 e->rps_rxhash =3D hash;
>  }
>
> +static struct virtio_net_hash *tun_add_hash(struct sk_buff *skb)
> +{
> +       return skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
> +}
> +
> +static const struct virtio_net_hash *tun_find_hash(const struct sk_buff =
*skb)
> +{
> +       return skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
> +}
> +
>  /* We try to identify a flow through its rxhash. The reason that
>   * we do not check rxq no. is because some cards(e.g 82599), chooses
>   * the rxq based on the txq where the last packet of the flow comes. As
>   * the userspace application move between processors, we may get a
>   * different rxq no. here.
>   */
> -static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buf=
f *skb)
> +static u16 tun_automq_select_queue(struct tun_struct *tun,
> +                                  const struct tun_vnet_hash_container *=
vnet_hash,
> +                                  struct sk_buff *skb)
>  {
> +       struct flow_keys keys;
> +       struct flow_keys_basic keys_basic;
>         struct tun_flow_entry *e;
>         u32 txq, numqueues;
>
>         numqueues =3D READ_ONCE(tun->numqueues);
>
> -       txq =3D __skb_get_hash_symmetric(skb);
> +       memset(&keys, 0, sizeof(keys));
> +       skb_flow_dissect(skb, &flow_keys_dissector_symmetric, &keys, 0);
> +
> +       txq =3D flow_hash_from_keys(&keys);
>         e =3D tun_flow_find(&tun->flows[tun_hashfn(txq)], txq);
>         if (e) {
>                 tun_flow_save_rps_rxhash(e, txq);
> @@ -473,6 +491,13 @@ static u16 tun_automq_select_queue(struct tun_struct=
 *tun, struct sk_buff *skb)
>                 txq =3D reciprocal_scale(txq, numqueues);
>         }
>
> +       keys_basic =3D (struct flow_keys_basic) {
> +               .control =3D keys.control,
> +               .basic =3D keys.basic
> +       };
> +       tun_vnet_hash_report(vnet_hash, skb, &keys_basic, skb->l4_hash ? =
skb->hash : txq,
> +                            tun_add_hash);
> +
>         return txq;
>  }
>
> @@ -500,10 +525,17 @@ static u16 tun_select_queue(struct net_device *dev,=
 struct sk_buff *skb,
>         u16 ret;
>
>         rcu_read_lock();
> -       if (rcu_dereference(tun->steering_prog))
> +       if (rcu_dereference(tun->steering_prog)) {
>                 ret =3D tun_ebpf_select_queue(tun, skb);
> -       else
> -               ret =3D tun_automq_select_queue(tun, skb);
> +       } else {
> +               struct tun_vnet_hash_container *vnet_hash =3D rcu_derefer=
ence(tun->vnet_hash);
> +
> +               if (vnet_hash && (vnet_hash->common.flags & TUN_VNET_HASH=
_RSS))

Does this mean the uAPI allow vnet_hash->common.flags &
TUN_VNET_HASH_RSS but not vnet_hash?

> +                       ret =3D tun_vnet_rss_select_queue(READ_ONCE(tun->=
numqueues), vnet_hash,
> +                                                       skb, tun_add_hash=
);
> +               else
> +                       ret =3D tun_automq_select_queue(tun, vnet_hash, s=
kb);
> +       }
>         rcu_read_unlock();
>
>         return ret;
> @@ -1987,7 +2019,7 @@ static ssize_t tun_put_user_xdp(struct tun_struct *=
tun,
>         ssize_t ret;
>
>         if (tun->flags & IFF_VNET_HDR) {
> -               struct virtio_net_hdr gso =3D { 0 };
> +               struct virtio_net_hdr_v1_hash gso =3D { 0 };
>
>                 vnet_hdr_sz =3D READ_ONCE(tun->vnet_hdr_sz);
>                 ret =3D tun_vnet_hdr_put(vnet_hdr_sz, iter, &gso);
> @@ -2040,9 +2072,10 @@ static ssize_t tun_put_user(struct tun_struct *tun=
,
>         }
>
>         if (vnet_hdr_sz) {
> -               struct virtio_net_hdr gso;
> +               struct virtio_net_hdr_v1_hash gso;
>
> -               ret =3D tun_vnet_hdr_from_skb(tun->flags, tun->dev, skb, =
&gso);
> +               ret =3D tun_vnet_hdr_from_skb(vnet_hdr_sz, tun->flags, tu=
n->dev,
> +                                           skb, tun_find_hash, &gso);
>                 if (ret)
>                         return ret;
>
> @@ -2223,6 +2256,9 @@ static void tun_free_netdev(struct net_device *dev)
>         security_tun_dev_free_security(tun->security);
>         __tun_set_ebpf(tun, &tun->steering_prog, NULL);
>         __tun_set_ebpf(tun, &tun->filter_prog, NULL);
> +       rtnl_lock();
> +       kfree_rcu_mightsleep(rtnl_dereference(tun->vnet_hash));
> +       rtnl_unlock();

I may miss something but why do we need rtnl_lock() here?

>  }
>
>  static void tun_setup(struct net_device *dev)
> @@ -2921,13 +2957,9 @@ static int tun_set_queue(struct file *file, struct=
 ifreq *ifr)
>  }
>
>  static int tun_set_ebpf(struct tun_struct *tun, struct tun_prog __rcu **=
prog_p,
> -                       void __user *data)
> +                       int fd)
>  {
>         struct bpf_prog *prog;
> -       int fd;
> -
> -       if (copy_from_user(&fd, data, sizeof(fd)))
> -               return -EFAULT;
>
>         if (fd =3D=3D -1) {
>                 prog =3D NULL;
> @@ -2994,6 +3026,7 @@ static long __tun_chr_ioctl(struct file *file, unsi=
gned int cmd,
>         int sndbuf;
>         int ret;
>         bool do_notify =3D false;
> +       struct tun_vnet_hash_container *vnet_hash;
>
>         if (cmd =3D=3D TUNSETIFF || cmd =3D=3D TUNSETQUEUE ||
>             (_IOC_TYPE(cmd) =3D=3D SOCK_IOC_TYPE && cmd !=3D SIOCGSKNS)) =
{
> @@ -3052,9 +3085,10 @@ static long __tun_chr_ioctl(struct file *file, uns=
igned int cmd,
>                 goto unlock;
>         }
>
> -       ret =3D -EBADFD;
> -       if (!tun)
> +       if (!tun) {
> +               ret =3D tun_vnet_ioctl(NULL, NULL, NULL, -EBADFD, true, c=
md, argp);

I think we need to tweak the code to avoid the calling this twice as
well as the NULL tricks which makes code very tricky to maintain.

>                 goto unlock;
> +       }
>
>         netif_info(tun, drv, tun->dev, "tun_chr_ioctl cmd %u\n", cmd);
>
> @@ -3230,11 +3264,27 @@ static long __tun_chr_ioctl(struct file *file, un=
signed int cmd,
>                 break;
>
>         case TUNSETSTEERINGEBPF:
> -               ret =3D tun_set_ebpf(tun, &tun->steering_prog, argp);
> +               if (get_user(ret, (int __user *)argp)) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }

Nit: let's use variable like "fd" other than ret and copy_from_user()
for better readability.

> +
> +               vnet_hash =3D rtnl_dereference(tun->vnet_hash);
> +               if (ret !=3D -1 && vnet_hash && (vnet_hash->common.flags =
& TUN_VNET_HASH_RSS)) {
> +                       ret =3D -EBUSY;
> +                       break;
> +               }
> +
> +               ret =3D tun_set_ebpf(tun, &tun->steering_prog, ret);
>                 break;
>
>         case TUNSETFILTEREBPF:
> -               ret =3D tun_set_ebpf(tun, &tun->filter_prog, argp);
> +               if (get_user(ret, (int __user *)argp)) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }

Same here.

> +
> +               ret =3D tun_set_ebpf(tun, &tun->filter_prog, ret);
>                 break;
>
>         case TUNSETCARRIER:
> @@ -3253,7 +3303,10 @@ static long __tun_chr_ioctl(struct file *file, uns=
igned int cmd,
>                 break;
>
>         default:
> -               ret =3D tun_vnet_ioctl(&tun->vnet_hdr_sz, &tun->flags, cm=
d, argp);
> +               ret =3D tun_vnet_ioctl(&tun->vnet_hdr_sz, &tun->flags,
> +                                    &tun->vnet_hash, -EINVAL,
> +                                    !rtnl_dereference(tun->steering_prog=
),
> +                                    cmd, argp);
>                 break;
>         }
>
> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> index 58b9ac7a5fc4084c789fe94fe36b5f8631bf1fa4..c73d778f76e33fddc6ab881bf=
6fbaaebc55ee9bf 100644
> --- a/drivers/net/tun_vnet.h
> +++ b/drivers/net/tun_vnet.h
> @@ -6,6 +6,16 @@
>  #define TUN_VNET_LE     0x80000000
>  #define TUN_VNET_BE     0x40000000
>
> +typedef struct virtio_net_hash *(*tun_vnet_hash_add)(struct sk_buff *);
> +typedef const struct virtio_net_hash *(*tun_vnet_hash_find)(const struct=
 sk_buff *);
> +
> +struct tun_vnet_hash_container {
> +       struct tun_vnet_hash common;
> +       struct tun_vnet_hash_rss rss;
> +       u32 rss_key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
> +       u16 rss_indirection_table[];
> +};
> +
>  static inline bool tun_vnet_legacy_is_little_endian(unsigned int flags)
>  {
>         bool be =3D IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
> @@ -61,18 +71,33 @@ static inline __virtio16 cpu_to_tun_vnet16(unsigned i=
nt flags, u16 val)
>  }
>
>  static inline long tun_vnet_ioctl(int *vnet_hdr_sz, unsigned int *flags,
> -                                 unsigned int cmd, int __user *sp)
> +                                 struct tun_vnet_hash_container __rcu **=
hashp,
> +                                 long fallback, bool can_rss,
> +                                 unsigned int cmd, void __user *argp)
>  {
> +       static const struct tun_vnet_hash cap =3D {
> +               .flags =3D TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
> +               .types =3D VIRTIO_NET_SUPPORTED_HASH_TYPES
> +       };
> +       struct tun_vnet_hash hash_buf;
> +       struct tun_vnet_hash_container *hash;
> +       int __user *sp =3D argp;
>         int s;
>
>         switch (cmd) {
>         case TUNGETVNETHDRSZ:
> +               if (!vnet_hdr_sz)
> +                       return -EBADFD;
> +
>                 s =3D *vnet_hdr_sz;
>                 if (put_user(s, sp))
>                         return -EFAULT;
>                 return 0;
>
>         case TUNSETVNETHDRSZ:
> +               if (!vnet_hdr_sz)
> +                       return -EBADFD;
> +
>                 if (get_user(s, sp))
>                         return -EFAULT;
>                 if (s < (int)sizeof(struct virtio_net_hdr))
> @@ -82,12 +107,18 @@ static inline long tun_vnet_ioctl(int *vnet_hdr_sz, =
unsigned int *flags,
>                 return 0;
>
>         case TUNGETVNETLE:
> +               if (!flags)
> +                       return -EBADFD;
> +
>                 s =3D !!(*flags & TUN_VNET_LE);
>                 if (put_user(s, sp))
>                         return -EFAULT;
>                 return 0;
>
>         case TUNSETVNETLE:
> +               if (!flags)
> +                       return -EBADFD;
> +
>                 if (get_user(s, sp))
>                         return -EFAULT;
>                 if (s)
> @@ -97,16 +128,129 @@ static inline long tun_vnet_ioctl(int *vnet_hdr_sz,=
 unsigned int *flags,
>                 return 0;
>
>         case TUNGETVNETBE:
> +               if (!flags)
> +                       return -EBADFD;
> +
>                 return tun_get_vnet_be(*flags, sp);
>
>         case TUNSETVNETBE:
> +               if (!flags)
> +                       return -EBADFD;
> +
>                 return tun_set_vnet_be(flags, sp);
>
> +       case TUNGETVNETHASHCAP:
> +               return copy_to_user(argp, &cap, sizeof(cap)) ? -EFAULT : =
0;
> +
> +       case TUNSETVNETHASH:
> +               if (!hashp)
> +                       return -EBADFD;
> +
> +               if (copy_from_user(&hash_buf, argp, sizeof(hash_buf)))
> +                       return -EFAULT;
> +               argp =3D (struct tun_vnet_hash __user *)argp + 1;
> +
> +               if (hash_buf.flags & TUN_VNET_HASH_RSS) {
> +                       struct tun_vnet_hash_rss rss;
> +                       size_t indirection_table_size;
> +                       size_t key_size;
> +                       size_t size;
> +
> +                       if (!can_rss)
> +                               return -EBUSY;
> +
> +                       if (copy_from_user(&rss, argp, sizeof(rss)))
> +                               return -EFAULT;
> +                       argp =3D (struct tun_vnet_hash_rss __user *)argp =
+ 1;
> +
> +                       indirection_table_size =3D ((size_t)rss.indirecti=
on_table_mask + 1) * 2;
> +                       key_size =3D virtio_net_hash_key_length(hash_buf.=
types);
> +                       size =3D struct_size(hash, rss_indirection_table,
> +                                          (size_t)rss.indirection_table_=
mask + 1);
> +
> +                       hash =3D kmalloc(size, GFP_KERNEL);
> +                       if (!hash)
> +                               return -ENOMEM;
> +
> +                       if (copy_from_user(hash->rss_indirection_table,
> +                                          argp, indirection_table_size))=
 {
> +                               kfree(hash);
> +                               return -EFAULT;
> +                       }
> +                       argp =3D (u16 __user *)argp + rss.indirection_tab=
le_mask + 1;
> +
> +                       if (copy_from_user(hash->rss_key, argp, key_size)=
) {
> +                               kfree(hash);
> +                               return -EFAULT;
> +                       }
> +
> +                       virtio_net_toeplitz_convert_key(hash->rss_key, ke=
y_size);
> +                       hash->rss =3D rss;
> +               } else {
> +                       hash =3D kmalloc(sizeof(hash->common), GFP_KERNEL=
);
> +                       if (!hash)
> +                               return -ENOMEM;
> +               }
> +
> +               hash->common =3D hash_buf;
> +               kfree_rcu_mightsleep(rcu_replace_pointer_rtnl(*hashp, has=
h));
> +               return 0;
> +
>         default:
> -               return -EINVAL;
> +               return fallback;
>         }
>  }
>
> +static void tun_vnet_hash_report(const struct tun_vnet_hash_container *h=
ash,
> +                                struct sk_buff *skb,
> +                                const struct flow_keys_basic *keys,
> +                                u32 value,
> +                                tun_vnet_hash_add vnet_hash_add)
> +{
> +       struct virtio_net_hash *report;
> +
> +       if (!hash || !(hash->common.flags & TUN_VNET_HASH_REPORT))
> +               return;
> +
> +       report =3D vnet_hash_add(skb);
> +       if (!report)
> +               return;
> +
> +       *report =3D (struct virtio_net_hash) {
> +               .report =3D virtio_net_hash_report(hash->common.types, ke=
ys),
> +               .value =3D value
> +       };
> +}
> +
> +static u16 tun_vnet_rss_select_queue(u32 numqueues,
> +                                    const struct tun_vnet_hash_container=
 *hash,
> +                                    struct sk_buff *skb,
> +                                    tun_vnet_hash_add vnet_hash_add)
> +{
> +       struct virtio_net_hash *report;
> +       struct virtio_net_hash ret;
> +       u16 txq, index;
> +
> +       if (!numqueues)
> +               return 0;
> +
> +       virtio_net_hash_rss(skb, hash->common.types, hash->rss_key, &ret)=
;
> +
> +       if (!ret.report)
> +               return hash->rss.unclassified_queue % numqueues;
> +
> +       if (hash->common.flags & TUN_VNET_HASH_REPORT) {
> +               report =3D vnet_hash_add(skb);
> +               if (report)
> +                       *report =3D ret;
> +       }
> +
> +       index =3D ret.value & hash->rss.indirection_table_mask;
> +       txq =3D READ_ONCE(hash->rss_indirection_table[index]);
> +
> +       return txq % numqueues;
> +}
> +
>  static inline int tun_vnet_hdr_get(int sz, unsigned int flags,
>                                    struct iov_iter *from,
>                                    struct virtio_net_hdr *hdr)
> @@ -135,15 +279,17 @@ static inline int tun_vnet_hdr_get(int sz, unsigned=
 int flags,
>  }
>
>  static inline int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
> -                                  const struct virtio_net_hdr *hdr)
> +                                  const struct virtio_net_hdr_v1_hash *h=
dr)
>  {
> +       int content_sz =3D MIN(sizeof(*hdr), sz);
> +
>         if (unlikely(iov_iter_count(iter) < sz))
>                 return -EINVAL;
>
> -       if (unlikely(copy_to_iter(hdr, sizeof(*hdr), iter) !=3D sizeof(*h=
dr)))
> +       if (unlikely(copy_to_iter(hdr, content_sz, iter) !=3D content_sz)=
)
>                 return -EFAULT;
>
> -       if (iov_iter_zero(sz - sizeof(*hdr), iter) !=3D sz - sizeof(*hdr)=
)
> +       if (iov_iter_zero(sz - content_sz, iter) !=3D sz - content_sz)
>                 return -EFAULT;
>
>         return 0;
> @@ -155,26 +301,38 @@ static inline int tun_vnet_hdr_to_skb(unsigned int =
flags, struct sk_buff *skb,
>         return virtio_net_hdr_to_skb(skb, hdr, tun_vnet_is_little_endian(=
flags));
>  }
>
> -static inline int tun_vnet_hdr_from_skb(unsigned int flags,
> +static inline int tun_vnet_hdr_from_skb(int sz, unsigned int flags,
>                                         const struct net_device *dev,
>                                         const struct sk_buff *skb,
> -                                       struct virtio_net_hdr *hdr)
> +                                       tun_vnet_hash_find vnet_hash_find=
,
> +                                       struct virtio_net_hdr_v1_hash *hd=
r)
>  {
>         int vlan_hlen =3D skb_vlan_tag_present(skb) ? VLAN_HLEN : 0;
> +       const struct virtio_net_hash *report =3D sz < sizeof(struct virti=
o_net_hdr_v1_hash) ?
> +                                              NULL : vnet_hash_find(skb)=
;
> +
> +       *hdr =3D (struct virtio_net_hdr_v1_hash) {
> +               .hash_report =3D VIRTIO_NET_HASH_REPORT_NONE
> +       };
> +
> +       if (report) {
> +               hdr->hash_value =3D cpu_to_le32(report->value);
> +               hdr->hash_report =3D cpu_to_le16(report->report);
> +       }
>
> -       if (virtio_net_hdr_from_skb(skb, hdr,
> +       if (virtio_net_hdr_from_skb(skb, (struct virtio_net_hdr *)hdr,
>                                     tun_vnet_is_little_endian(flags), tru=
e,
>                                     vlan_hlen)) {
>                 struct skb_shared_info *sinfo =3D skb_shinfo(skb);
>
>                 if (net_ratelimit()) {
>                         netdev_err(dev, "unexpected GSO type: 0x%x, gso_s=
ize %d, hdr_len %d\n",
> -                                  sinfo->gso_type, tun_vnet16_to_cpu(fla=
gs, hdr->gso_size),
> -                                  tun_vnet16_to_cpu(flags, hdr->hdr_len)=
);
> +                                  sinfo->gso_type, tun_vnet16_to_cpu(fla=
gs, hdr->hdr.gso_size),
> +                                  tun_vnet16_to_cpu(flags, hdr->hdr.hdr_=
len));
>                         print_hex_dump(KERN_ERR, "tun: ",
>                                        DUMP_PREFIX_NONE,
>                                        16, 1, skb->head,
> -                                      min(tun_vnet16_to_cpu(flags, hdr->=
hdr_len), 64), true);
> +                                      min(tun_vnet16_to_cpu(flags, hdr->=
hdr.hdr_len), 64), true);
>                 }
>                 WARN_ON_ONCE(1);
>                 return -EINVAL;
> diff --git a/include/linux/if_tap.h b/include/linux/if_tap.h
> index 553552fa635c3e1e53d1a63c203d32e4c4fd5a4f..7334c46a3f101675a0d4e5a03=
6987cfe18842f9f 100644
> --- a/include/linux/if_tap.h
> +++ b/include/linux/if_tap.h
> @@ -31,6 +31,7 @@ static inline struct ptr_ring *tap_get_ptr_ring(struct =
file *f)
>  #define MAX_TAP_QUEUES 256
>
>  struct tap_queue;
> +struct tun_vnet_hash_container;
>
>  struct tap_dev {
>         struct net_device       *dev;
> @@ -43,6 +44,7 @@ struct tap_dev {
>         int                     numqueues;
>         netdev_features_t       tap_features;
>         int                     minor;
> +       struct tun_vnet_hash_container __rcu *vnet_hash;

Any thing that makes vnet_hash different from vnet_hdr where the
latter we don't use RCU.

>
>         void (*update_features)(struct tap_dev *tap, netdev_features_t fe=
atures);
>         void (*count_tx_dropped)(struct tap_dev *tap);
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index bb2b751d274acff931281a72e8b4b0c699b4e8af..cdd793f1c360ad5f63fcc4cbf=
67d845f5e2ccf6f 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -4842,6 +4842,9 @@ enum skb_ext_id {
>  #endif
>  #if IS_ENABLED(CONFIG_MCTP_FLOWS)
>         SKB_EXT_MCTP,
> +#endif
> +#if IS_ENABLED(CONFIG_TUN)
> +       SKB_EXT_TUN_VNET_HASH,
>  #endif
>         SKB_EXT_NUM, /* must be last */
>  };
> diff --git a/include/uapi/linux/if_tun.h b/include/uapi/linux/if_tun.h
> index 287cdc81c9390c289a30545aa7ed23d81c3329d3..4887f97500a870c7ef3c96a58=
37b2d0a5a225040 100644
> --- a/include/uapi/linux/if_tun.h
> +++ b/include/uapi/linux/if_tun.h
> @@ -62,6 +62,42 @@
>  #define TUNSETCARRIER _IOW('T', 226, int)
>  #define TUNGETDEVNETNS _IO('T', 227)
>
> +/**
> + * define TUNGETVNETHASHCAP - ioctl to get virtio_net hashing capability=
.
> + *
> + * The argument is a pointer to &struct tun_vnet_hash which will store t=
he
> + * maximal virtio_net hashing configuration.
> + */
> +#define TUNGETVNETHASHCAP _IOR('T', 228, struct tun_vnet_hash)

Why not reusing TUNGETIFF?

> +
> +/**
> + * define TUNSETVNETHASH - ioctl to configure virtio_net hashing
> + *
> + * The argument is a pointer to &struct tun_vnet_hash.
> + *
> + * The argument is a pointer to the compound of the following in order i=
f
> + * %TUN_VNET_HASH_RSS is set:

I understand that RSS depends on the hash but it should be better to
use separate ioctls for enabling them than try to embed RSS into hash.

> + *
> + * 1. &struct tun_vnet_hash
> + * 2. &struct tun_vnet_hash_rss
> + * 3. Indirection table
> + * 4. Key
> + *
> + * The %TUN_VNET_HASH_REPORT flag set with this ioctl will be effective =
only
> + * after calling the %TUNSETVNETHDRSZ ioctl with a number greater than o=
r equal
> + * to the size of &struct virtio_net_hdr_v1_hash.
> + *
> + * The members added to the legacy header by %TUN_VNET_HASH_REPORT flag =
will
> + * always be little-endian.
> + *
> + * This ioctl results in %EBADFD if the underlying device is deleted. It=
 affects
> + * all queues attached to the same device.
> + *
> + * This ioctl currently has no effect on XDP packets and packets with
> + * queue_mapping set by TC.
> + */
> +#define TUNSETVNETHASH _IOW('T', 229, struct tun_vnet_hash)
> +
>  /* TUNSETIFF ifr flags */
>  #define IFF_TUN                0x0001
>  #define IFF_TAP                0x0002
> @@ -115,4 +151,43 @@ struct tun_filter {
>         __u8   addr[][ETH_ALEN];
>  };
>
> +/**
> + * define TUN_VNET_HASH_REPORT - Request virtio_net hash reporting for v=
host
> + */
> +#define TUN_VNET_HASH_REPORT   0x0001
> +
> +/**
> + * define TUN_VNET_HASH_RSS - Request virtio_net RSS
> + *
> + * This is mutually exclusive with eBPF steering program.

Any reason for this? Note that we didn't claim such for automq.

> + */
> +#define TUN_VNET_HASH_RSS      0x0002
> +
> +/**
> + * struct tun_vnet_hash - virtio_net hashing configuration
> + * @flags:
> + *             Bitmask consists of %TUN_VNET_HASH_REPORT and %TUN_VNET_H=
ASH_RSS
> + * @pad:
> + *             Should be filled with zero before passing to %TUNSETVNETH=
ASH
> + * @types:
> + *             Bitmask of allowed hash types
> + */
> +struct tun_vnet_hash {
> +       __u16 flags;
> +       __u8 pad[2];
> +       __u32 types;
> +};
> +
> +/**
> + * struct tun_vnet_hash_rss - virtio_net RSS configuration
> + * @indirection_table_mask:
> + *             Bitmask to be applied to the indirection table index
> + * @unclassified_queue:
> + *             The index of the queue to place unclassified packets in
> + */
> +struct tun_vnet_hash_rss {
> +       __u16 indirection_table_mask;
> +       __u16 unclassified_queue;
> +};
> +
>  #endif /* _UAPI__IF_TUN_H */
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 7b03b64fdcb276f68ce881d1d8da8e4c6b897efc..aa2a091b649f0c9d6e0196f34=
f345ba78b5498fb 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -64,6 +64,7 @@
>  #include <linux/mpls.h>
>  #include <linux/kcov.h>
>  #include <linux/iov_iter.h>
> +#include <linux/virtio_net.h>
>
>  #include <net/protocol.h>
>  #include <net/dst.h>
> @@ -4969,6 +4970,9 @@ static const u8 skb_ext_type_len[] =3D {
>  #if IS_ENABLED(CONFIG_MCTP_FLOWS)
>         [SKB_EXT_MCTP] =3D SKB_EXT_CHUNKSIZEOF(struct mctp_flow),
>  #endif
> +#if IS_ENABLED(CONFIG_TUN)
> +       [SKB_EXT_TUN_VNET_HASH] =3D SKB_EXT_CHUNKSIZEOF(struct virtio_net=
_hash),
> +#endif
>  };
>
>  static __always_inline unsigned int skb_ext_total_length(void)
>
> --
> 2.48.1
>

Thanks


