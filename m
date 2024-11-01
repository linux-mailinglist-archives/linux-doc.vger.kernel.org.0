Return-Path: <linux-doc+bounces-29561-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF59B935C
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 15:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C37C7B2113B
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 14:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EF11537C3;
	Fri,  1 Nov 2024 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3kgHdfP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B34179A7
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471751; cv=none; b=n8nN3EQRCdfQ+yP0NI12dtcWfPFjicwWuXarVC1B7t6oHFZdgUKMvAqTqzFGc5vY4ILNmcwUBN3qBvFpJUrjvqjxOaQGy1s1Y8ZxROhkSMSr3g3FAoB9ExTmMfssPl55c7Dehm1gnBRoQAm+Ki8amBDEbDtF1uxsIBDSLCGK+GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471751; c=relaxed/simple;
	bh=TbBP2rH11V5ERVtW6qi9P1oHnXRkier6r3JpBBhbWNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlBvmOav/DhA4Evh0IVvuyrq2rqlM7vjGxmSqdX5vN0oJLasY8m/WcWBOyMl/zhVhxKbM5kH4q6+bowyBButwNvyH0d1Q1mQhte/UJx8Qe0KG9fvLDj2SCo92BGcTo0ojMMGvFOwhFb8ijTOlTBvsBUpwMLWMZ9xALn6zK3pZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3kgHdfP; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-460969c49f2so156801cf.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730471749; x=1731076549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14jhF3tUn+jodCAX38vJeaZlL+F/RmlRi6N5LmYVZfc=;
        b=R3kgHdfPLHwxCmrEU9Ij75pYIvKODSmBo359zca6+FwuEgmGBNquUeLQdwIIB3CCTA
         eRIoUxrxLyrncpidJAeCQawAgyywFy/uMLgXgcJdI1gtN8sEntc4bhSHAh5HTvOzVw7Q
         8WqLq+Ajt1jy5S3GF8M7ebe4qguATS+/w07jMGiYlYmb+TEXZD0+UiKXAdfdWEi0risi
         mS1h0jwlxFhDk+eyGIfuzVmjDeF5lO3tAGnlp49C5crA6xtJ1VRlXZBUJycDBfyquBA9
         Wc9/ktJ7GUR4zmpziwPjzugRWH8xIr078XnMCad+3fr9kg2V7dB0zrJXy45TtXT2/8GU
         jVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471749; x=1731076549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14jhF3tUn+jodCAX38vJeaZlL+F/RmlRi6N5LmYVZfc=;
        b=KpK40FvjeXBo98hrZjxhrPyV1xLPfPAiJ2PtysB0UsWYQ+VCv5myrNCzrMpnZAqXF5
         Wa0Rs2KD7pOndbVALbSEr/NOjLK6Pfa343XV+mjYTfz7y+kU6DDgmZuExk2iA4WdBWXx
         pFnep7rsVHayPGiexcbdyT7yqH7iZZ7PIgTbZbZvy8F4K3SHEBeuCocWjeQfvt+0G+4i
         WojpcwvXwb5i8V8hAlrbale+ilWbbf2KEFDD1oNDy+i607Um8qmoikGeYef2gWYrZUTr
         V+LJgaecsPWi/HjiaNXhX0t93REqral1CnLtLbmoq8IocMmnk44FPJcfkNWqtNAUb2an
         KuIA==
X-Forwarded-Encrypted: i=1; AJvYcCV6MJYTOxW87LRgr3HJ9eQSduRGoU3X5go+rZTeWNuZqgGBmsvf4jT4T5ZDXqRiBvVoVG3ea49W1yA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFxtJ8rJHMK36v2Q1faHO9ew4CfGh/bd0p5RXWzyOonrjQWsZ
	ZzZajXT3lusL3EWD0FxYSbiIuLhRstvrfg5Yz4ZbEi/SJG6b9XS4SGLEEzxZEWAMFbjSiF8uXyq
	iTC7IQMey61DkX8DO1yDZ0s46Cf+da299nD0H
X-Gm-Gg: ASbGnct8jLNLspBgz4XFIhwVD/zW/Cc4ajZdsVXFGXylFV4YLzee8PqVBfc9IoAxzXn
	qEnr7i/xZqqeUfoJNIEuLWNBpzhCMdoc=
X-Google-Smtp-Source: AGHT+IHxye/kG8xYgTajHP+lNhien9/6s2ywLieWI077qqN3Twxzkdns6ZUy/BiKzp3pn4v4R9d6W2nXi1boMG+Mebw=
X-Received: by 2002:ac8:5881:0:b0:461:43d4:fcb5 with SMTP id
 d75a77b69052e-462aba425a6mr6465331cf.2.1730471748326; Fri, 01 Nov 2024
 07:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022162359.2713094-1-ap420073@gmail.com> <20241022162359.2713094-7-ap420073@gmail.com>
In-Reply-To: <20241022162359.2713094-7-ap420073@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 1 Nov 2024 07:35:36 -0700
Message-ID: <CAHS8izMingYgf_ZuGWZMFNb3QGGkqKFjYwWvFpdbLW5yBWvvng@mail.gmail.com>
Subject: Re: [PATCH net-next v4 6/8] net: ethtool: add ring parameter filtering
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, donald.hunter@gmail.com, corbet@lwn.net, 
	michael.chan@broadcom.com, andrew+netdev@lunn.ch, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, dw@davidwei.uk, sdf@fomichev.me, 
	asml.silence@gmail.com, brett.creeley@amd.com, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:25=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> While the devmem is running, the tcp-data-split and
> header-data-split-thresh configuration should not be changed.
> If user tries to change tcp-data-split and threshold value while the
> devmem is running, it fails and shows extack message.
>
> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> ---
>
> v4:
>  - Add netdev_devmem_enabled() helper.
>  - Add Test tag from Stanislav.
>
> v3:
>  - Patch added
>
>  include/net/netdev_rx_queue.h | 14 ++++++++++++++
>  net/ethtool/common.h          |  1 +
>  net/ethtool/rings.c           | 13 +++++++++++++
>  3 files changed, 28 insertions(+)
>
> diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.=
h
> index 596836abf7bf..7fbb64ce8d89 100644
> --- a/include/net/netdev_rx_queue.h
> +++ b/include/net/netdev_rx_queue.h
> @@ -55,6 +55,20 @@ get_netdev_rx_queue_index(struct netdev_rx_queue *queu=
e)
>         return index;
>  }
>
> +static inline bool netdev_devmem_enabled(struct net_device *dev)

Mega nit: netdev_memory_provider_enabled().

This is actually not devmem specific, and there is already an io_uring
provider in the works.

But, also, we already have dev_get_min_mp_channel_count() defined in
linux/netdevice.h. Lets re-use that one instead of adding another
helper that does almost the same thing. Sorry, I should have
remembered we already have this helper in the last iteration.

Other than that, looks fine to me.

> +{
> +       struct netdev_rx_queue *queue;
> +       int i;
> +
> +       for (i =3D 0; i < dev->real_num_rx_queues; i++) {
> +               queue =3D __netif_get_rx_queue(dev, i);
> +               if (queue->mp_params.mp_priv)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq);
>
>  #endif
> diff --git a/net/ethtool/common.h b/net/ethtool/common.h
> index 4a2de3ce7354..5b8e5847ba3c 100644
> --- a/net/ethtool/common.h
> +++ b/net/ethtool/common.h
> @@ -5,6 +5,7 @@
>
>  #include <linux/netdevice.h>
>  #include <linux/ethtool.h>
> +#include <net/netdev_rx_queue.h>
>
>  #define ETHTOOL_DEV_FEATURE_WORDS      DIV_ROUND_UP(NETDEV_FEATURE_COUNT=
, 32)
>
> diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
> index e1fd82a91014..ca313c301081 100644
> --- a/net/ethtool/rings.c
> +++ b/net/ethtool/rings.c
> @@ -258,6 +258,19 @@ ethnl_set_rings(struct ethnl_req_info *req_info, str=
uct genl_info *info)
>                 return -ERANGE;
>         }
>
> +       if (netdev_devmem_enabled(dev)) {
> +               if (kernel_ringparam.tcp_data_split !=3D
> +                   ETHTOOL_TCP_DATA_SPLIT_ENABLED) {
> +                       NL_SET_ERR_MSG(info->extack,
> +                                      "tcp-data-split should be enabled =
while devmem is running");

Maybe: "can't disable tcp-data-split while device has memory provider enabl=
ed"

> +                       return -EINVAL;
> +               } else if (kernel_ringparam.hds_thresh) {
> +                       NL_SET_ERR_MSG(info->extack,
> +                                      "header-data-split-thresh should b=
e zero while devmem is running");

Maybe: "can't set non-zero hds_thresh while device is memory provider enabl=
ed".


--=20
Thanks,
Mina

